package com.wonders.frame.iims.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wonders.frame.core.model.bo.ImportConfig;
import com.wonders.frame.core.model.bo.ImportConfigLog;
import com.wonders.frame.core.model.vo.FieldProperty;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.service.ObjInfoService;
import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.utils.DateFormatUtil;
import com.wonders.frame.core.utils.ExcelUtil;
import com.wonders.frame.core.utils.ReflectUtil;
import com.wonders.frame.iims.dao.ProjectPlanDao;
import com.wonders.frame.iims.dao.ProjectPlanImposedDao;
import com.wonders.frame.iims.dao.ProjectPlanTargetDao;
import com.wonders.frame.iims.dao.TargetVersionDao;
import com.wonders.frame.iims.model.bo.ProjectPlanImposed;
import com.wonders.frame.iims.model.bo.ProjectPlanTarget;
import com.wonders.frame.iims.model.bo.TargetVersion;
import com.wonders.frame.iims.service.ProjectPlanTargetService;

public abstract class ExcelImportDataController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Resource
	GenericService genericService;
	@Resource
	TargetVersionDao targetVersionDao;
	@Resource
	ProjectPlanTargetDao projectPlanTargetDao;
	@Resource
	ProjectPlanDao projectPlanDao;
	@Resource
	ProjectPlanImposedDao projectPlanImposedDao;
	@Resource
	ProjectPlanTargetService projectPlanTargetService ;
	@Resource
	ObjInfoService objInfoService;

	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	
	@RequestMapping("/{crudObj}/importExcelPlan")
	@ResponseBody
	public HashMap<String, Object> importExcel(@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String,Object> importResult=new HashMap<String,Object>();
		try {

			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			logger.debug( multipartRequest.toString());
			Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
			// 文件保存路径
			String savePath = request.getSession().getServletContext().getRealPath("/")+ "uploadFiles";
			savePath += File.separator + DateFormatUtil.getCurrentDate()+ File.separator;
			// 创建文件夹
			File file = new File(savePath);
			if (!file.exists()) {
				file.mkdirs();
			}

			for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
				// 上传文件
				MultipartFile mf = entity.getValue();

				// 获取文件后缀
				String ext = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				// 重命名文件
				String newFileName = DateFormatUtil.getFileDateTime() + "_"+ new Random().nextInt(1000) + ext;
				File uploadFile = new File(savePath + newFileName);
				FileCopyUtils.copy(mf.getBytes(), uploadFile);

				// 创建导入Excel数据操作日志对象
				ImportConfigLog importLog = new ImportConfigLog();
				importLog.setOriginalFilename(mf.getOriginalFilename().substring(0,mf.getOriginalFilename().lastIndexOf(".")));
				importLog.setSaveFilename(newFileName.substring(0,newFileName.lastIndexOf(".")));
				importLog.setFileType(ext);
				importLog.setSavePath(savePath);
				importLog.setImportTime(new Date(System.currentTimeMillis()));
				if (mf != null) {
				//执行数据导入方法2	
					List<Object> datas = importDatas(uploadFile, crudObj,request);
					
					if (datas != null) {// 文件导入数据成功
						importLog.setFlag("true");
						importLog.setRecordNum(datas.size());
						importResult.put(mf.getOriginalFilename(),datas);
						
					} else {// 文件导入数据失败
						importLog.setFlag("false");
						importLog.setRecordNum(0);
						importResult.put(mf.getOriginalFilename(),null);
					}
					// 保存本次导入Excel数据操作日志
					Object obj =genericService.executeMethod("importConfigLog", "save",new Class[] { Object.class },new Object[] { importLog });
				}
			}
			result.put("success", true);
			result.put("importResult", importResult);
		} catch (IOException e) {
			result.put("success", false);
		}
		return result;
	}

	/**
	 * @author taoweiwei
	 * 作用：将Excel数据保存到数据库
	 * @param file
	 * @param crudObj
	 * @return
	 */
	public List<Object> importDatas(File file, String crudObj,HttpServletRequest request) {
		Long start = System.currentTimeMillis();
		List<Object> datas = new ArrayList<Object>();
		List<String[]> list = ExcelUtil.getExcelData(file);
		if (list == null || list.size() < 1) {
			return datas;
		}
		try {
			Class crudObjClazz = objInfoService.getEntityClassByType(crudObj);
			// 根据type、实体对象查询Excel导入数据配置项
			List queryObj = (List) genericService.executeMethod("importConfig", "findByEntityAndType",
					new Class[] { String.class,String.class }, new Object[] { crudObj,(String) request.getParameter("type") });
			if (queryObj == null) {
				return null;
			}
			//获取type
			String type=(String)request.getParameter("type");
			//获取VersionId
			String versionId= (String)request.getParameter("versionId");
			System.out.println(versionId);
			
			
			// 根据type查询Excel导入数据配置，该配置下的Excel只能是存在标题、不存在标题其中一种
			// 判断是否存在标题
			Integer hasTitle = ((ImportConfig) queryObj.get(0)).getHasTitle();
			if (hasTitle == 1) {// 存在标题
				int targetVersionId =0;
				for (int i = 1; i < list.size(); i++) {
					
					boolean isEmpty=isNotEmpty(list.get(i));
					if(isEmpty){
						continue;
					}
					
					Object obj = crudObjClazz.newInstance();
					
					for (int j = 0; j < queryObj.size(); j++) {
						//字段名
						String entityField = (String) ReflectUtil.invokeGet(queryObj.get(j), "entityField");
						//对应中文名
						String excelField = (String) ReflectUtil.invokeGet(queryObj.get(j), "excelField");
						
						// 遍历标题集合
						int flag = 0;
						boolean isNull = false;

						for (int k = 0; k < list.get(0).length; k++) {
							if (excelField.equals(list.get(0)[k])) {
								flag = k;
								isNull = true;
								break;
							}
						}
						
						if (!list.get(i)[flag].equals("")&&isNull) {
					
							Field field = crudObjClazz.getDeclaredField(entityField);
							String fieldExcelData = list.get(i)[flag];
							setData(type,field ,fieldExcelData,entityField,crudObjClazz,obj);
						}
					}
				    
					if(datas.size()==0){
						//这里获取到上一次版本
						TargetVersion tv  =  targetVersionDao.findById(Integer.parseInt(versionId));
						
						
						
						if(tv.getVersionId().equals("0")){
							
							tv.setVersionId((Integer.parseInt(tv.getVersionId())+1)+"");
							tv.setTargetState("initial");
							
							tv=(TargetVersion) genericService.executeMethod("targetVersion", "save",new Class[] { Object.class }, new Object[] { tv });
							
						}else if(tv.getVersionId().equals("1")){
							
							TargetVersion tvv =new TargetVersion();
							BeanUtils.copyProperties(tv, tvv);
							tv.setShowCode("0");
						    genericService.executeMethod("targetVersion", "save",new Class[] { Object.class }, new Object[] { tv });
							tvv.setId(null);
							tvv.setShowCode("1");
							if(tv.getVersionId().equals("1")){
								tvv.setVersionId((Integer.parseInt(tv.getVersionId())+10)+"");
							}else{
								tvv.setVersionId((Integer.parseInt(tv.getVersionId())+1)+"");
							}
							
							tvv.setTargetState("modify");
							tv=(TargetVersion) genericService.executeMethod("targetVersion", "save",new Class[] { Object.class }, new Object[] { tvv });

						}else{
							TargetVersion tvv =new TargetVersion();
							BeanUtils.copyProperties(tv, tvv);
							tv.setShowCode("0");
						    genericService.executeMethod("targetVersion", "save",new Class[] { Object.class }, new Object[] { tv });
							tvv.setId(null);
							tvv.setShowCode("1");
							tvv.setVersionId((Integer.parseInt(tv.getVersionId())+1)+"");
							tv=(TargetVersion) genericService.executeMethod("targetVersion", "save",new Class[] { Object.class }, new Object[] { tvv });
						}
						
						
						targetVersionId =tv.getId();
					}
					ProjectPlanTarget pt = (ProjectPlanTarget) obj;
					pt.setVersionId(targetVersionId+"");
					//这里将excel数据保存进数据库中
					obj=genericService.executeMethod(crudObj, "save",new Class[] { Object.class }, new Object[] { pt });
					datas.add(obj);
				}
			} else {// 不存在标题,配置中列必须从1开始
				Object obj = crudObjClazz.newInstance();
				for (int i = 0; i < list.size(); i++) {
					
					boolean isEmpty=isNotEmpty(list.get(i));
					if(isEmpty){
						continue;
					}
					
					
					for (int j = 0; j < queryObj.size(); j++) {
						String entityField = (String) ReflectUtil.invokeGet(queryObj.get(j), "entityField");
						String excelField = (String) ReflectUtil.invokeGet(queryObj.get(j), "excelField");
                        Integer column=Integer.valueOf(excelField);
						if (!list.get(i)[column - 1].equals("")) {
							Field field = crudObjClazz.getDeclaredField(entityField);
							String fieldExcelData = list.get(i)[column - 1];
							setData(type,field ,fieldExcelData,entityField,crudObjClazz,obj);
						}
					}
					//////111111111111111111111111111
				
					obj=genericService.executeMethod(crudObj, "save",new Class[] { Object.class }, new Object[] { obj });
					datas.add(obj);
				}
			}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//检查是否有未导入的历史项
		TargetVersion tv  =  targetVersionDao.findById(Integer.parseInt((String)request.getParameter("versionId")));
		getCheck(tv,datas);
		
		
		System.out.println("[import]--Owner total：" + datas.size());

		/*		for (Object obj : datas) {
			ProjectPlanTarget tv2 =(ProjectPlanTarget) obj;
			System.out.println(tv2.getId());
		}
		
		*/
		System.out.println("[import]--parse excel use time:"+ (System.currentTimeMillis() - start) + " ms");
		return datas;
	}
	
	/**
	 * 获取增量targetVersion最新版本
	 * @author Jone
	 * @param t
	 * @param tp
	 * @return  List<ProjectPlanTarget>  封装ProjectPlanTarget对象的List,内容为需要增量的历史数据
	 */
	public List<ProjectPlanTarget> getCheck(TargetVersion t,List tp){
        int lastVersionId = t.getId();
        List <ProjectPlanTarget> ppts =  projectPlanTargetDao.findByVersionId(lastVersionId+"");
        boolean isChange = false;
        /**
         * @ppt:上一version版本中的ProjectPlanTarget对象
         * @ppt2:当前version版本中的ProjectPlanTarget对象
         * @ppi:上一version版本对应已填报的实施计划
         */
        //循环获取上一版本中的projectTarget
		for (ProjectPlanTarget ppt : ppts) {
			System.out.println(ppt.getId());
			//循环获取当前导入的Excel中的ProjectPlanTarget对象
			for (Object obj : tp) {
				ProjectPlanTarget ppt2 = (ProjectPlanTarget) obj;
				
			
				if(ppt2.getProjectName().equals(ppt.getProjectName())&&ppt2.getYear().equals(ppt.getYear())){
					System.out.println("比对成功的历史版本--"+ppt.toString());
					System.out.println("比对成功的最新版本--"+ppt2.toString());
					//判断新增数据的ProjectPlanId是否真实有效
					if(ppt2.getProjectPlanID()==null){
						ppt2.setProjectPlanID(ppt.getProjectPlanID());
					}else if(ppt2.getProjectPlanID().equals(ppt.getProjectPlanID())){
						ppt2.setProjectPlanID(ppt.getProjectPlanID()) ;
						
						isChange=true;
					}else{
						//查询新增数据中的项目编号是否存在
					 Object o =	projectPlanDao.findById(Integer.parseInt(ppt2.getProjectPlanID()));
					 if(o==null){
							ppt2.setProjectPlanID(ppt.getProjectPlanID());
							isChange=true;
					 }
					}
					
					//判断上一版本是否存在已填报的实施计划
				    int lastTargetId = ppt.getId();
				    ProjectPlanImposed ppi = projectPlanTargetService.findImposedByProjectTargetId(lastTargetId);
					//如果上一版本已存在填报的实施计划则将上一版本的实施计划更新
				    if(ppi!=null){
						
							System.out.println("更新前的实施计划："+ppi.toString());
							System.out.println("ProjectTargetIdbefore:"+ppi.getProjectTargetId());
							ppi.setProjectTargetId(ppt2.getId());
							System.out.println("ProjectTargetIdafter:"+ppi.getProjectTargetId());
							ppi = projectPlanImposedDao.save(ppi);
							System.out.println("更新后的实施计划："+ppi.toString());
					}
				    
				    //从上一版本同步到当前版本中的丢失数据
				    //项目概述
				    if(ppt2.getMainContent()==null){
				    	if(ppt.getMainContent()!=null){
				    		ppt2.setMainContent(ppt.getMainContent());	
				    	}
				    }
				    
				    //申报单位ID
				    if(ppt2.getReportUnitId()==null){
				    	if(ppt.getReportUnitId()!=null){
				    		ppt2.setReportUnitId(ppt.getReportUnitId());
				    	}
				    }
				    
				    //申报单位名称
				    if(ppt2.getReportUnit()==null){
				    	if(ppt.getReportUnit()!=null){
				    		ppt2.setReportUnit(ppt.getReportUnit());
				    	}
				    }
				    
				    //申请人
				    if(ppt2.getApplyer()==null){
				    	if(ppt.getApplyer()!=null){
				    		ppt2.setApplyer(ppt.getApplyer());
				    	}
				    }
				    
				    //申请人工号
				    if(ppt2.getApplyerLoginname()==null){
				    	if(ppt.getApplyerLoginname()!=null){
				    		ppt2.setApplyerLoginname(ppt.getApplyerLoginname());
				    	}
				    }
				    //状态位同步
				    if(ppt2.getStatus()==null){
				    	if(ppt.getStatus()!=null){
				    		ppt2.setStatus(ppt.getStatus());
				    	}
				    }
				    
				    System.out.println("修改完成的最新版本--"+ppt2.toString());
				}
			}
		}
        return null;
	}
	/**
	 * 判断Excel当前行是否是空行
	 * @param obj
	 * @return
	 */
	private boolean isNotEmpty(Object[] obj){
		int length=0;
		for(int m=0;m<obj.length;m++){
			if(obj[m]==null||"".equals(obj[m])){
				length++;
			}
		}
		if(length==obj.length){
			return true;//空行
		}else{
			return false;//非空行
		}
	}
	
	/**
	 * @author taoweiwei
	 * 给指定对象的指定字段设置Excel数据
	 * @param field
	 * @param fieldExcelData
	 * @param entityField
	 * @param crudObjClazz
	 * @param obj
	 */
	@SuppressWarnings("unused")
	private void setData(String type,Field field ,String fieldExcelData,String entityField,Class crudObjClazz,Object obj){
		/**
		 * 判断该字段上是否存在ShowInView注解，
		 * 一、存在该注解，则判断该选项是否是字典项（即是否是一个选择项）；
		 * 1、若是一个字典项，则取出其字典项，找 出excel中数据对应的字典项code保存到数据库；
		 * 2、若不是一个字典项，则将excel中数据值保存到数据库
		 * 二、不存在该注解，则将excel中值存到数据库
		 */

		ShowInView showInView = field.getAnnotation(ShowInView.class);
		if (showInView != null) {// 存在ShowInView注解
			String ccateType = showInView.ccateType();
			if (!"".equals(ccateType)) {// 存在字典项
				/*List<FieldProperty> fieldProperties = ReflectUtil.getFieldProperties(crudObjClazz,field.getName(), "true");
				FieldProperty fieldProperty = fieldProperties.get(0);
				LinkedHashMap<String,String> option = fieldProperty.getOption();
				HashMap<String,LinkedHashMap<String,String>> code=fieldProperty.getCodes();
				fieldExcelData=convertExcelImportData(type,entityField ,fieldExcelData,option,code);*/
				fieldExcelData=convertExcelImportData(type,entityField ,fieldExcelData,null,null);
			}else{
				fieldExcelData=convertExcelImportData(type,entityField ,fieldExcelData,null,null);
			}
		}
		
		String returnType = field.getType().getName().toString();
		if (returnType.contains("Long")) {
			ReflectUtil.invokeSet(obj, entityField,Long.valueOf(fieldExcelData));
		} else if (returnType.contains("Integer")) {
			ReflectUtil.invokeSet(obj, entityField,Integer.valueOf(fieldExcelData));
		} else if (returnType.contains("Date")) {
			ReflectUtil.invokeSet(obj, entityField,DateFormatUtil.timeParse("yyyy-MM-dd HH:mm:ss",fieldExcelData));
		} else if (returnType.contains("Double")) {
			ReflectUtil.invokeSet(obj, entityField,Double.valueOf(fieldExcelData));
		} else if (returnType.contains("Float")) {
			ReflectUtil.invokeSet(obj, entityField,Float.valueOf(fieldExcelData));
		} else if (returnType.contains("Boolean")) {
			ReflectUtil.invokeSet(obj, entityField,Boolean.valueOf(fieldExcelData));
		} else {
			ReflectUtil.invokeSet(obj, entityField,fieldExcelData);
		}
	}

	
	public abstract String convertExcelImportData(String type,String fieldName ,String fieldValue,LinkedHashMap<String,String> option,HashMap<String,LinkedHashMap<String,String>> code);
}
