/** 
 * @Title: BasicCOntroller.java 
 * @Package com.wonders.frame.core.controller 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author lushuaifeng
 * @version V1.0 
 */
package com.wonders.frame.core.controller;

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

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.type.JavaType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wonders.frame.core.model.bo.ImportConfigLog;
import com.wonders.frame.core.model.bo.ImportConfig;
import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.model.vo.FieldProperty;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.service.ObjInfoService;
import com.wonders.frame.core.tags.ShowInView;
import com.wonders.frame.core.utils.DateFormatUtil;
import com.wonders.frame.core.utils.ExcelUtil;
import com.wonders.frame.core.utils.JacksonMapper;
import com.wonders.frame.core.utils.ReflectUtil;

/**
 * @ClassName: AbstractSimpleCrudController
 * @Description: 提供简单的增删改查的抽象controller类
 */

public abstract class AbstractSimpleCrudController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource
	GenericService genericService;

	@Resource
	ObjInfoService objInfoService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	// 获取字段定义
	@RequestMapping(value = "/{crudObj}/getEntityProperty", method = {
			RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public HashMap<String, Object> getFieldList(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		logger.debug(
				"Entering getFieldList(crudObj={},request={})",
				new Object[] {
						crudObj,
						request.getRequestURL().append(
								request.getQueryString() == null ? "" : "?"
										+ request.getQueryString()), });
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			Class crudObjClazz = objInfoService.getEntityClassByType(crudObj);

			EntityProperty entityProperty = ReflectUtil.getEntityProperty(
					crudObjClazz, request.getParameter("fieldFilter"),
					request.getParameter("isNeeded"));
			if (entityProperty != null) {
				result.put("success", true);
				result.put("result", entityProperty);
			} else {
				result.put("success", false);
			}
		} catch (Exception e) {
			logger.error("Exception Throwable", e);
			result.put("success", false);

		}
		logger.debug("Leaving  getFieldList(): {\"success\":{}}",
				result.get("success"));
		return result;
	}

	// 保存
	@RequestMapping(value = "/{crudObj}/save", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> saveObject(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();

		try {
			Class<?> crudObjClazz = objInfoService
					.getEntityClassByType(crudObj);
			Map<String, String> paramMap = request.getParameterMap();
			HashMap<String, String> hmParam = new HashMap<String, String>();
			for (String key : paramMap.keySet()) {
				hmParam.put(key, request.getParameter(key));
			}
			Object obj = JacksonMapper.convert(hmParam, crudObjClazz);
			if (hmParam.containsKey("id")) {
				Object queryObj = genericService.executeMethod(crudObj,
						"findById", new Class[] { Integer.class },
						new Object[] { Integer.valueOf(hmParam.get("id")) });
				obj = ReflectUtil.setUpdateValue2Object(crudObjClazz, queryObj,
						obj, hmParam.keySet());
			}

			obj = genericService.executeMethod(crudObj, "save",
					new Class[] { Object.class }, new Object[] { obj });
			result.put("success", true);
			result.put("result", obj);
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("Exception Throwable", e);
			result.put("success", false);
		}
		return result;
	}

	// 逻辑删除接口
	@RequestMapping(value = "/{crudObj}/del/{id}", method = {
			RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> delObject(
			@PathVariable("crudObj") String crudObj,
			@PathVariable("id") Integer id) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {

			Integer successNum = (Integer) genericService.executeMethod(
					crudObj, "removeById", new Class[] { Integer.class },
					new Object[] { id });
			if (successNum > 0) {
				result.put("success", true);
			} else {
				result.put("success", false);
			}
		} catch (Exception e) {
			logger.error("Exception Throwable", e);
			// e.printStackTrace();
			result.put("success", false);
		}

		return result;
	}

	// 查询单个记录
	@RequestMapping(value = "/{crudObj}/get/{id}", method = {
			RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> findById(
			@PathVariable("crudObj") String crudObj,
			@PathVariable("id") Integer id) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {

			Object obj = genericService.executeMethod(crudObj, "findById",
					new Class[] { Integer.class }, new Object[] { id });
			result.put("success", true);
			result.put("result", obj);
		} catch (Exception e) {
			// e.printStackTrace();
			logger.error("Exception Throwable", e);
			result.put("success", false);
		}

		return result;
	}

	@RequestMapping(value = "/{crudObj}/all", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> findAll(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Class<?> crudObjClazz = objInfoService.getEntityClassByType(crudObj);
		Object qr = queryData("findAll", crudObjClazz, request);

		if (qr == null) {
			result.put("success", false);
		} else {
			result.put("success", true);
			result.put("result", qr);
		}
		return result;
	}

	// 按条件查询（分页，排序）
	@RequestMapping(value = "/{crudObj}/page", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> findByPage(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Class<?> crudObjClazz = objInfoService.getEntityClassByType(crudObj);
		Object qr = queryData("findByPage", crudObjClazz, request);

		if (qr == null) {
			result.put("success", false);
		} else {
			result.put("success", true);
			result.put("result", qr);
		}
		return result;
	}
	
	// 按条件自定义查询（分页，排序）
	@RequestMapping(value = "/{crudObj}/page2", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public HashMap<String, Object> findByPage2(
			@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Class<?> crudObjClazz = objInfoService.getEntityClassByType(crudObj);
		Object qr = queryData("findByPageWithWhereHql", crudObjClazz, request);

		if (qr == null) {
			result.put("success", false);
		} else {
			result.put("success", true);
			result.put("result", qr);
		}
		return result;
	}

	public Object queryData(String method, Class<?> crudObjClazz,
			HttpServletRequest request) {
		Object returnObj = null;
		try {
			String sort = request.getParameter("sort");
			LinkedHashMap<String, String> hmSort = new LinkedHashMap<String, String>();
			if (sort != null) {
				String[] sorts = sort.split(",");

				for (int i = 0; i < sorts.length; i++) {
					String[] order = sorts[i].split(" ");
					hmSort.put(order[0], order[1]);
				}
			}
			if ("findAll".equalsIgnoreCase(method)) {
				returnObj = genericService.executeMethod(
						StringUtils.uncapitalize(crudObjClazz.getSimpleName()),
						"findAll",
						new Class[] { HashMap.class, LinkedHashMap.class },
						new Object[] {
								ReflectUtil.formatQueryParam(request,
										crudObjClazz), hmSort });

			} else if ("findByPage".equalsIgnoreCase(method)) {
				int pageNum = 0, pageSize = 0;

				String sPageSize = request.getParameter("pageSize");
				if (sPageSize != null && sPageSize.matches("[0-9]+")) {
					pageSize = Integer.valueOf(sPageSize);
				}
				String sPageNum = request.getParameter("pageNum");
				if (sPageNum != null && sPageNum.matches("[0-9]+")) {
					pageNum = Integer.valueOf(sPageNum);
				}

				returnObj = genericService.executeMethod(
						StringUtils.uncapitalize(crudObjClazz.getSimpleName()),
						"findByPage",
						new Class[] { HashMap.class, LinkedHashMap.class,
								Integer.class, Integer.class },
						new Object[] {
								ReflectUtil.formatQueryParam(request,
										crudObjClazz), hmSort, pageSize,
								pageNum });
				
				
				
			} else if ("findByPageWithWhereHql".equalsIgnoreCase(method)) {
				int pageNum = 0, pageSize = 0;

				String sPageSize = request.getParameter("pageSize");
				if (sPageSize != null && sPageSize.matches("[0-9]+")) {
					pageSize = Integer.valueOf(sPageSize);
				}
				String sPageNum = request.getParameter("pageNum");
				if (sPageNum != null && sPageNum.matches("[0-9]+")) {
					pageNum = Integer.valueOf(sPageNum);
				}

				returnObj = genericService.executeMethod(
						StringUtils.uncapitalize(crudObjClazz.getSimpleName()),
						"findByPageWithWhereHql",
						new Class[] { String.class,HashMap.class, 
								Integer.class, Integer.class },
						new Object[] {request.getParameter("hql"),
								ReflectUtil.formatQueryParam(request,
										crudObjClazz), pageSize,
								pageNum });
				
				
			}

		} catch (Exception e) {
			logger.error("Exception Throwable", e);
		}
		return returnObj;
	}

	/**
	 * @author mengjie
	 * 
	 *         导出数据Excel
	 * @param projectPlan
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/{crudObj}/export2Excel", method = {
			RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public void export2Excel(@PathVariable("crudObj") String crudObj,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String type = request.getParameter("type");
		Class<?> crudObjClazz = objInfoService.getEntityClassByType(crudObj);

		Object dataContent = queryData("findAll", crudObjClazz, request);

		JavaType javaType = JacksonMapper.getCollectionType(ArrayList.class,
				HashMap.class);
		List<HashMap> records = (List<HashMap>) JacksonMapper.convert(dataContent, javaType);

		String exportFields = getExcelExportField(type);

		List<FieldProperty> FieldProperties = ReflectUtil.getFieldProperties(
				crudObjClazz, exportFields, "true");

		LinkedHashMap<String, String> hmFieldCnName = new LinkedHashMap<String, String>();
		HashMap<String, LinkedHashMap<String, String>> hmFieldOption = new HashMap<String, LinkedHashMap<String, String>>();
		//获取FieldProperty的codes
		HashMap<String, HashMap<String,LinkedHashMap<String,String>>> hmFieldCodes = new HashMap<String, HashMap<String,LinkedHashMap<String,String>>>();
		for (FieldProperty fieldProperty : FieldProperties) {
			hmFieldCnName.put(fieldProperty.getPath(), fieldProperty.getName());
			hmFieldOption.put(fieldProperty.getPath(),fieldProperty.getOption());
			//将获取的codes设置到hmFieldCodes
			hmFieldCodes.put(fieldProperty.getPath(), fieldProperty.getCodes());
		}

		// 数据转换
		List<HashMap<String, String>> excelRecords = new ArrayList<HashMap<String, String>>();
		String[] keys = hmFieldCnName.keySet().toArray(new String[0]);
		for (int i = 1; i <= records.size(); i++) {
			HashMap<String, String> excelRowRecord = new HashMap<String, String>();

			for (int j = 0; j < keys.length; j++) {

				String fieldValue = records.get(i - 1).get(keys[j]) == null ? ""
						: records.get(i - 1).get(keys[j]).toString();
          
				fieldValue = convertExcelExportData(type, keys[j], fieldValue,hmFieldOption,hmFieldCodes);

				excelRowRecord.put(keys[j], fieldValue);

			}

			excelRecords.add(excelRowRecord);
		}

		ExcelUtil.createWorkBook("excel文件", excelRecords, hmFieldCnName,
				response);

	}

	public abstract String getExcelExportField(String type);

	/**
	 * @author taoweiwei
	 * 时间：2014-12-2
	 * 添加hmFieldCodes参数 ：取得字段属性codes
	 * @param type
	 * @param fieldName
	 * @param cellValue
	 * @param hmFieldOption
	 * @param hmFieldCodes
	 * @return
	 */
	public abstract String convertExcelExportData(String type,String fieldName, String cellValue,HashMap<String, LinkedHashMap<String, String>> hmFieldOption,HashMap<String, HashMap<String,LinkedHashMap<String,String>>> hmFieldCodes);


	/**
	 * taoweiwei 附件新增界面，此界面需要获取当前实体的附件列表
	 * 
	 * @param crudObj
	 * @param id
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/{crudObj}/toExcelUpload", method = { RequestMethod.GET })
	public String toExcelUpload(HttpServletRequest request) throws Exception {
		return "common/excelUpload";
	}

	/**
	 * @author taoweiwei
	 * 作用：导入Excel数据
	 * @param crudObj 实体
	 * @param request
	 * @return
	 */
	@RequestMapping("/{crudObj}/importExcel")
	@ResponseBody
	public HashMap<String, Object> importExcel(@PathVariable("crudObj") String crudObj, HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String,Object> importResult=new HashMap<String,Object>();
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
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
					genericService.executeMethod("importConfigLog", "save",new Class[] { Object.class },new Object[] { importLog });
				}
			}
			result.put("success", true);
			result.put("importResult", importResult);
		} catch (IOException e) {
			logger.error("Exception Throwable", e);
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
			
			// 根据type查询Excel导入数据配置，该配置下的Excel只能是存在标题、不存在标题其中一种
			// 判断是否存在标题
			Integer hasTitle = ((ImportConfig) queryObj.get(0)).getHasTitle();
			if (hasTitle == 1) {// 存在标题
				for (int i = 1; i < list.size(); i++) {
					
					boolean isEmpty=isNotEmpty(list.get(i));
					if(isEmpty){
						continue;
					}
					
					Object obj = crudObjClazz.newInstance();
					for (int j = 0; j < queryObj.size(); j++) {
						String entityField = (String) ReflectUtil.invokeGet(queryObj.get(j), "entityField");
						String excelField = (String) ReflectUtil.invokeGet(queryObj.get(j), "excelField");
						// 遍历标题集合
						int flag = 0;
						for (int k = 0; k < list.get(0).length; k++) {
							if (excelField.equals(list.get(0)[k])) {
								flag = k;
								break;
							}
						}
						if (!list.get(i)[flag].equals("")) {
							Field field = crudObjClazz.getDeclaredField(entityField);
							String fieldExcelData = list.get(i)[flag];
							setData(type,field ,fieldExcelData,entityField,crudObjClazz,obj);
						}
					}
					genericService.executeMethod(crudObj, "save",new Class[] { Object.class }, new Object[] { obj });
					datas.add(obj);
				}
			} else {// 不存在标题,配置中列必须从1开始
				for (int i = 0; i < list.size(); i++) {
					
					boolean isEmpty=isNotEmpty(list.get(i));
					if(isEmpty){
						continue;
					}
					
					Object obj = crudObjClazz.newInstance();
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
					genericService.executeMethod(crudObj, "save",new Class[] { Object.class }, new Object[] { obj });
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
		System.out.println("[import]--Owner total：" + datas.size());
		System.out.println("[import]--parse excel use time:"+ (System.currentTimeMillis() - start) + " ms");
		return datas;
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
				List<FieldProperty> fieldProperties = ReflectUtil.getFieldProperties(crudObjClazz,field.getName(), "true");
				FieldProperty fieldProperty = fieldProperties.get(0);
				LinkedHashMap<String,String> option = fieldProperty.getOption();
				HashMap<String,LinkedHashMap<String,String>> code=fieldProperty.getCodes();
				fieldExcelData=convertExcelImportData(type,entityField ,fieldExcelData,option,code);
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

	/**
	 * @author taoweiwei
	 * 转换Excel导入数据
	 * @param type  
	 * @param fieldName  
	 * @param fieldValue 
	 * @param option 
	 * @param code
	 * @return
	 */
	public abstract String convertExcelImportData(String type,String fieldName ,String fieldValue,LinkedHashMap<String,String> option,HashMap<String,LinkedHashMap<String,String>> code);
	
}
