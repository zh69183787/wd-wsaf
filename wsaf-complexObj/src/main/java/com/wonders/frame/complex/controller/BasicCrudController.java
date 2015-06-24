/** 
* @Title: BasicCOntroller.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.complex.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.wonders.frame.complex.model.bo.UserOld;
import com.wonders.frame.core.controller.AbstractSimpleCrudJspController;
import com.wonders.frame.core.model.vo.EntityProperty;
import com.wonders.frame.core.service.GenericService;
import com.wonders.frame.core.service.ObjInfoService;
import com.wonders.frame.core.utils.ExcelUtil;
import com.wonders.frame.core.utils.JacksonMapper;
import com.wonders.frame.core.utils.ReflectUtil;

/** 
 * @ClassName: BasicCrudController 
 * @Description: 提供基本的增删改查的controller 
 */
@Controller
@RequestMapping("/basicCrud")
public class BasicCrudController extends AbstractSimpleCrudJspController{
	
	@Resource
	GenericService genericService;
	@Resource
	ObjInfoService objInfoService;
	
	
//	@RequestMapping("/{crudObj}/importExcel"	)
//	public HashMap<String,Object> importExcel(@PathVariable("crudObj") String crudObj, HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
//	     response.setCharacterEncoding("UTF-8");
//	 	HashMap<String,Object> result=new HashMap<String,Object>();
//		//创建一个通用的多部分解析器
//		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
//		//判断 request 是否有文件上传,即多部分请求
//		if(multipartResolver.isMultipart(request)){
//			//转换成多部分request  
//			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
//			//取得request中的所有文件名
//			Iterator<String> iter = multiRequest.getFileNames();
//			
//			while(iter.hasNext()){
//				//记录上传过程起始时的时间，用来计算上传时间
//				int pre = (int) System.currentTimeMillis();
//				//取得上传文件
//				MultipartFile file = multiRequest.getFile(iter.next());
//				if(file != null){
//					
//					try{
//						Class crudObjClazz=objInfoService.getEntityClassByType(crudObj);
//					
//						EntityProperty entityProperty=ReflectUtil.getEntityProperty(crudObjClazz,
//								request.getParameter("fieldFilter"),request.getParameter("isNeeded"));
//						if(entityProperty!=null){
//							result.put("success", true);
//							result.put("result", entityProperty);
//						}else{
//							result.put("success", false);
//						}
//					}catch(Exception e){
////						logger.error("Exception Throwable", e);
//						result.put("success", false);
//
//					}
//					
//					List<UserOld> list = byteTranSterFile(file.getBytes());
//	                   //内部业务逻辑
//	                    for(UserOld user : list) {
////	                        projectPlanService.add(user);
//	                    	genericService.executeMethod("user","save", new Class[] {Object.class}, new Object[] {user});
//	                    }
//					//取得当前上传文件的文件名称
//					String myFileName = file.getOriginalFilename();
//					//如果名称不为“”,说明该文件存在，否则说明该文件不存在
//					if(myFileName.trim() !=""){
//						System.out.println(myFileName);
//						//重命名上传后的文件名
//						String fileName = "demoUpload" + file.getOriginalFilename();
//						//定义上传路径
//						String path = "H:/" + fileName;
//						File localFile = new File(path);
//						file.transferTo(localFile);
//					}
//				}
//				//记录上传该文件后的时间
//				int finaltime = (int) System.currentTimeMillis();
//				System.out.println(finaltime - pre);
//			}
//			
//		}
////		   final Writer writer = response.getWriter();
////           writer.write("000000");
////           writer.flush();        
////           writer.close();
//		return result;
//	}
//	
//	
//    protected List<UserOld> byteTranSterFile(byte[] file) {
//        try {
//            //把二进制字节流转化成File对象
//            File tempFile=File.createTempFile("excel", ".xls");
//            FileOutputStream ots=new FileOutputStream(tempFile);
//            
//            ots.write(file);
//            ots.flush();
//            ots.close();
//            
//            List<UserOld> result = importProjectPlan(tempFile);
//            tempFile.delete();
//            return result;
//            
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//
//
//	
//	public static List<UserOld> importProjectPlan(File file){
//        Long start=System.currentTimeMillis();
//        List<UserOld> projectPlans=new ArrayList<UserOld>();
////        Set<String> phoneSet=new HashSet<String>();
//        List<String[]> list = ExcelUtil.getExcelData(file);
//        if(list==null||list.size()<1){
//            return projectPlans;
//        }
//        for(int i=1;i<list.size();i++){
//            UserOld user = new UserOld();
//            user.setName(list.get(i)[0]);
//            if(!list.get(i)[7].equals(""))
//                user.setTelephone(list.get(i)[7]);
//            projectPlans.add(user);
//        }
//        System.out.println("[importOwnerByPhone]--Owner total："+projectPlans.size());
//        System.out.println("[importOwnerByPhone]--parse excel use time:"+(System.currentTimeMillis()-start)+" ms");
////        logger.info("[importOwnerByPhone]--Owner total："+projectPlans.size());
////        logger.info("[importOwnerByPhone]--parse excel use time:"+(System.currentTimeMillis()-start)+" ms");
//        return projectPlans;
//    }
	
	@Override
	public String convertExcelExportData(String type,String fieldName,String cellValue,HashMap<String, LinkedHashMap<String, String>> hmFieldOption){
		LinkedHashMap<String,String> hmOption=hmFieldOption.get(fieldName);
		
		StringBuffer newValue=new StringBuffer("");
		
		if(fieldName.equalsIgnoreCase("line") && !cellValue.equals("")){				
			
			String[] values=cellValue.split(",");
			for(String value:values){
				newValue.append(hmOption.get(value)).append("/");
			}
			
			cellValue=newValue.toString().substring(0,newValue.length()-1);
			
		}else if(fieldName.equalsIgnoreCase("resourceRequirement") && !cellValue.equals("")){

			HashMap<String,String> cellValueMap  = (HashMap<String,String>)JacksonMapper.readValue(cellValue, HashMap.class);
			
			Set<String> keySet = cellValueMap.keySet();
			
			for(Iterator iterator = keySet.iterator();iterator.hasNext();){
			
				String key = (String)iterator.next();
				String value = (String) cellValueMap.get(key);
				
				HashMap<String,String> subValueMap  = (HashMap<String,String>)JacksonMapper.readValue(value, HashMap.class);
				
				Set<String> subValuekeySet = subValueMap.keySet();
				for(Iterator subValueIterator = subValuekeySet.iterator();subValueIterator.hasNext();){
					String subKey = (String)subValueIterator.next();
					String subValue = (String) subValueMap.get(subKey);
					
					newValue.append(hmOption.get(key)).append(":").append(subKey).append("[").append(subValue).append("]").append("/");
				}
			}
			
			cellValue=newValue.toString().substring(0,newValue.length()-1);


		}else if(hmOption!=null && !cellValue.equals("")){
			cellValue = hmOption.get(cellValue);
		}
		
		return cellValue;
	}

	@Override
	public String getExcelExportField(String type) {	
			return "year,projectName,mainContent,yearTarget,totalInvestEstimate,projectType,resourceRequirement,securityLevel,planStartDate,planEndDate,remarks";
		
	}
	
	
}
	
