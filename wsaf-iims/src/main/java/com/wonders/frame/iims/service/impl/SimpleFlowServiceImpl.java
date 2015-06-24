package com.wonders.frame.iims.service.impl;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.wonders.frame.core.model.vo.SimplePage;
import com.wonders.frame.core.utils.SpringBeanUtil;
import com.wonders.frame.iims.dao.SimpleFlowLogDao;
import com.wonders.frame.iims.dao.SimpleFlowMainDao;
import com.wonders.frame.iims.dao.SimpleFlowNodeDao;
import com.wonders.frame.iims.model.bo.SimpleFlowLog;
import com.wonders.frame.iims.model.bo.SimpleFlowMain;
import com.wonders.frame.iims.model.bo.SimpleFlowNode;
import com.wonders.frame.iims.service.SimpleFlowService;
import com.wonders.frame.iims.util.SimpleFlowUtil;

@Service("simpleFlowService")
public class SimpleFlowServiceImpl implements SimpleFlowService{
	
	@Resource
	private SimpleFlowMainDao simpleFlowMainDao;
	@Resource
	private SimpleFlowNodeDao simpleFlowNodeDao;
	@Resource
	private SimpleFlowLogDao simpleFlowLogDao;
	
	@Transactional
	@Override
	public SimpleFlowMain startFlow(SimpleFlowMain simpleFlowMain,
			List<SimpleFlowNode> nodes) {
		simpleFlowMain = simpleFlowMainDao.save(simpleFlowMain);
		for(SimpleFlowNode n :nodes){
			simpleFlowNodeDao.save(n);
		}
		return simpleFlowMain;
	}
	/** 处理完成的记录
	 * @see com.wonders.frame.iims.service.SimpleFlowService#findLogsByFlowCode(java.lang.String)
	 **/
	@Override
	public List<SimpleFlowLog> findLogsByFlowCodeStatus(String flowCode,String status) {
		// TODO Auto-generated method stub
		return simpleFlowLogDao.findListByFlowCodeStatus(flowCode,status);
	}
	@Override
	public List<SimpleFlowLog> findLogsByLoginName(String flowCode,
			String status, String userLoginName) {
		// TODO Auto-generated method stub
		return simpleFlowLogDao.findLogsByLoginName(flowCode,
				status, userLoginName);
	}
	@Override
	public List<SimpleFlowLog>  findLogsByFinalLoginName(String flowCode,
			String userLoginName) {
		// TODO Auto-generated method stub
		return simpleFlowLogDao.findLogsByFinalLoginName(flowCode,userLoginName);
	}
	@Override
	public SimpleFlowMain startFlow(String flowCode, String flowName,
			String userName, String loginName, String deptName, String deptId) {
		SimpleFlowMain main = new SimpleFlowMain();
		main.setRemoved(0);
		main.setFlowCode(flowCode);
		main.setFlowName(flowName);
		main.setStartUser(userName);
		main.setStartUserLoginname(loginName);
		main.setStatus("0");
		main.setStartDeptId(deptId);
		main.setStartDept(deptName);
		main.setStatusDetail("暂未发起");
		main.setInitiateTime(new Date());
		String flowTypeCode = flowCode.substring(0, flowCode.lastIndexOf(":"));
		main.setDealUrl(SimpleFlowUtil.getDealUrl(flowTypeCode));
		main=simpleFlowMainDao.save(main);
		List<SimpleFlowNode> nodes = simpleFlowNodeDao.findListByFlowTypeCode(flowTypeCode);
		if(nodes!=null){
			for(SimpleFlowNode node : nodes){
				SimpleFlowLog log = new SimpleFlowLog();
				BeanUtils.copyProperties(node, log);
				log.setFlowCode(flowCode);
				log.setNodeId(node.getId());
				log.setStatus("0");
				log.setMainId(main.getId());
				if(node.getNodeCode().equals("startUser")){
					log.setDealDept(deptName);
					log.setDealUser(userName);
					log.setDealDeptId(deptId);
					log.setDealUserLoginname(loginName);
					log.setStatus("1");
					main.setNowLog(log);
				}
				simpleFlowLogDao.save(log);
			}
		}
		
		
		return main;
	}
	@Override
	public SimpleFlowMain findByFlowCodeWithNowLog(String flowCode) {
		SimpleFlowMain main = simpleFlowMainDao.findByFlowCode(flowCode);
		List<SimpleFlowLog> logs =  simpleFlowLogDao.findListByFlowCodeStatus(flowCode,"1");
		if(logs!=null&&logs.size()>0){
			main.setNowLog(logs.get(0));
		}
		return main;
	}
	@Override
	public SimpleFlowLog findByOrderIndex(Integer mainId,Long orderIndex) {
		// TODO Auto-generated method stub
		return simpleFlowLogDao.findByOrderIndex(mainId,orderIndex);
	}
	
	@Override
	@Transactional 
	public void firstStartFlow(SimpleFlowLog log,HttpServletRequest request) {
		try {
		Date date = new Date();
		 
		
		if(log.getOrderIndexNext()!=null&&log.getOrderIndexNext().toString().equals("-1")){ //最终处理人处理
			Integer id = log.getId();
			simpleFlowLogDao.updateStatusTime(id,"2",date,log.getSuggestion());//更新当前操作人信息
			Integer mainId = log.getMainId();
			simpleFlowMainDao.updateStatusTime(mainId,"2","审核完成");//更新主表
			
			SimpleFlowMain main = simpleFlowMainDao.findById(mainId);
			String crudObjName = main.getFlowCode().split(":")[0];
			String firstChar = crudObjName.substring(0, 1);
			crudObjName = crudObjName.substring(1, crudObjName.length());//str.replaceFirst(temp,temp.toLowerCase());
			crudObjName = firstChar.toLowerCase()+crudObjName;
			String iid = main.getFlowCode().split(":")[2];
//			Object dao2=SpringBeanUtil.getBean(crudObjName+"Dao");
//			Object dao=SpringBeanUtil.getBean(crudObjName+"Service");
			ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext()); 
			Object service =  ctx.getBean(crudObjName+"Service"); 
			if(service!=null&&iid!=null){
				Method method = service.getClass().getMethod("finishFlow",Integer.class);
				method.invoke(service,Integer.parseInt(iid));
			}
		}else{
			SimpleFlowLog nextlog = simpleFlowLogDao.findById(log.getNextLog().getId());
			//更新 发起人状态   及 main 的流程开启状态
			
			Integer id = log.getId();
			simpleFlowLogDao.updateStatusTime(id,"2",date,log.getSuggestion());//更新当前操作人信息
			
			nextlog.setStatus("1");
			
			if(nextlog.getDealUserLoginname()==null||nextlog.getDealUserLoginname().equals("")){
				nextlog.setDealDept(log.getNextLog().getDealDept());
				nextlog.setDealDeptId(log.getNextLog().getDealDeptId());
				nextlog.setDealUser(log.getNextLog().getDealUser());
				nextlog.setDealUserLoginname(log.getNextLog().getDealUserLoginname());
			}
			
			simpleFlowLogDao.save(nextlog);
			
			Integer mainId = log.getMainId();
			simpleFlowMainDao.updateStatusTime(mainId,"1",nextlog.getDealDept()+":处理中");//更新主表
		}
		
		
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		
	}
	@Override
	public SimpleFlowMain findMainByFlowCode(String flowCode) {
		return simpleFlowMainDao.findByFlowCode(flowCode);
	}
	@Override
	public SimplePage<SimpleFlowMain> findByPageWithHql(String sql,
			HashMap<String, Object> formatQueryParam, int pz, int pn) {
		// TODO Auto-generated method stub
		return simpleFlowMainDao.findByPageWithHql(sql, formatQueryParam, pz, pn);
	}
	
	
}
