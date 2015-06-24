package com.wonders.frame.icp.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.wonders.frame.icp.dao.QteComplexInfoDao;
import com.wonders.frame.icp.model.vo.QteDeptStatistics;
import com.wonders.frame.icp.model.vo.QteMainDetail;
import com.wonders.frame.icp.model.vo.QteStatistics;

@Repository("qteComplexInfoDao")
public class QteComplexInfoDaoImpl implements QteComplexInfoDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	/**
	 * 查询问卷详细信息
	 */
	public List<QteMainDetail> findMainDetailByMainId(Integer mainId) {
		String sql="select m.id as m_id,m.title,g.id as g_id,g.name,g.orders,qu.id as qu_id,qu.ques_content,"
			       +"qu.ques_type,qu.ques_orders,qu.is_display,op.id as op_id,op.code,op.value"
			       +" from qte_main m" 
			       +" left join qte_group g on m.id=g.main_id"
			       +" left join qte_question qu on g.id=qu.group_id"
			       +" left join qte_option op on qu.id=op.ques_id"
			       +" where m.removed=0 and g.removed=0 and qu.removed=0 and op.removed=0 and m.id=?"
			       +" order by g.orders asc,qu.id asc,qu.ques_orders asc,code asc,"
			       +" case qu.ques_type  when 'radio' then 0"
                   +" when 'multiChoice' then 1"
                   +" when 'fill' then 2"
                   +" else 3 end";
		Query query=entityManager.createNativeQuery(sql);
		query.setParameter(1,mainId);
		List<Object[]> objs=query.getResultList();
		List<QteMainDetail> qteMainDetails=new ArrayList<QteMainDetail>();
		if(objs!=null && objs.size()>0){
			for(int i=0;i<objs.size();i++){
				QteMainDetail qteMainDetail=new QteMainDetail();
				qteMainDetail.setmId(Integer.valueOf(objs.get(i)[0].toString()));
				qteMainDetail.setmTilte(objs.get(i)[1].toString());
				qteMainDetail.setgId(Integer.valueOf(objs.get(i)[2].toString()));
				qteMainDetail.setgName(objs.get(i)[3].toString());
				qteMainDetail.setgOrders(Integer.valueOf(objs.get(i)[4].toString()));
				if(objs.get(i)[5]!=null){//分组下无题目
					qteMainDetail.setQuId(Integer.valueOf(objs.get(i)[5].toString()));
					qteMainDetail.setQuContent(objs.get(i)[6].toString());
					qteMainDetail.setQuesType(objs.get(i)[7].toString());
					qteMainDetail.setQuesOrders(Integer.valueOf(objs.get(i)[8].toString()));
					qteMainDetail.setIsDisplay(objs.get(i)[9].toString());
					if(objs.get(i)[10]!=null){//题目无选项：填空或简答
						qteMainDetail.setOpId(Integer.valueOf(objs.get(i)[10].toString()));
						qteMainDetail.setCode(objs.get(i)[11].toString());
						qteMainDetail.setValue(objs.get(i)[12].toString());	
					}
				}
				qteMainDetails.add(qteMainDetail);
			}
		}
		return qteMainDetails;
	}

	/**
	 * 查询填报问卷人数
	 */
	public Integer findUserCountByMainId(Integer mainId) {
		String sql="select count(distinct ua.login_name)"
				  +" from qte_main m"
				  +" left join qte_question qu on m.id=qu.main_id"
				  +" left join qte_user_answer ua on qu.id=ua.quest_id"
				  +" where m.removed=0 and qu.removed=0 and ua.removed=0 and m.id=?";
		Query query=entityManager.createNativeQuery(sql);
		query.setParameter(1,mainId);
		return Integer.valueOf(query.getSingleResult().toString());
	}
	
	/**
	 * 获取问卷下所有问题选项
	 * @param mainId
	 * @return
	 */
	public List<QteStatistics> getQteMainByMainId(Integer mainId) {
		String sql="select m.id as m_id,qu.id as qu_id,qu.ques_type,op.id as op_id,op.code,op.value"
				  +" from qte_main m"
				  +" left join qte_question qu on m.id=qu.main_id"
				  +" left join qte_option op on qu.id=op.ques_id"
				  +" where m.removed=0 and (qu.ques_type='radio' or qu.ques_type='multiChoice') and qu.removed=0 and op.removed=0  and m.id=?"
				  +" group by m.id,qu.id,qu.ques_type,op.id,op.code,op.value"
				  +" order by qu.id asc,op.id asc,op.code asc,"
				  +" case qu.ques_type when 'radio' then 0 when 'multiChoice' then 1 end,op.code asc";
		Query query=entityManager.createNativeQuery(sql);
		query.setParameter(1,mainId);
		List<Object[]> objs=query.getResultList();
		List<QteStatistics> qteStatistics=new ArrayList<QteStatistics>();
		if(objs!=null && objs.size()>0){
			for(int i=0;i<objs.size();i++){
				QteStatistics q=new QteStatistics();
				q.setMainId(Integer.valueOf(objs.get(i)[0].toString()));
				q.setQuesId(Integer.valueOf(objs.get(i)[1].toString()));
				q.setQuesType(objs.get(i)[2].toString());
				q.setOpId(Integer.valueOf(objs.get(i)[3].toString()));
				q.setCode(objs.get(i)[4].toString());
				q.setValue(objs.get(i)[5].toString());
				qteStatistics.add(q);
			}
		}
		return qteStatistics;
	}

	/**
	 * 获取饼状图中各部门参与人数数据
	 */
	public Map<String,Integer> getPieDataOfDeptByMainId(Integer mainId) {
		String sql="select dept_id,count(login_name)"
				  +" from"
				  +"("
				  +"  select distinct ua.dept_id as dept_id, ua.login_name as login_name"
				  +"  from qte_main m"
				  +"  left join qte_question qu"
				  +"  on m.id=qu.main_id"
				  +"  left join qte_user_answer ua"
				  +"  on qu.id=ua.quest_id"
				  +"  where m.removed=0 and qu.removed=0 and ua.removed=0 and ua.dept_id is not null and m.id=?"
				  +")"
				  +" group by dept_id";
		
		Query query=entityManager.createNativeQuery(sql);
		query.setParameter(1,mainId);
		List<Object[]> list=query.getResultList();
		Map<String,Integer> data=new HashMap<String,Integer>();
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				data.put(list.get(i)[0].toString(),Integer.valueOf(list.get(i)[1].toString()) );
			}
		}
		return data;
	}

	public List<Object> getDeptsByMainId(Integer mainId){
		String sql="select  distinct ua.dept_id"
				  +" from qte_main m"
				  +" left join qte_question qu on m.id=qu.main_id"
				  +" left join qte_option op on qu.id=op.ques_id"
				  +" left join qte_user_answer ua on op.id=ua.option_id"
				  +" where m.removed=0 and qu.removed=0 and op.removed=0 and ua.removed=0 and (qu.ques_type='radio' or qu.ques_type='multiChoice') and m.id=?"; 
		Query query=entityManager.createNativeQuery(sql);
		query.setParameter(1,mainId);
		List<Object> objs=query.getResultList();
		return objs;
	}
	
}
