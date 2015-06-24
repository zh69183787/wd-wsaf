package com.wonders.frame.core.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wonders.frame.core.model.bo.ObjInfo;
import com.wonders.frame.core.model.bo.Relation;
import com.wonders.frame.core.model.bo.RelationRule;
import com.wonders.frame.core.model.bo.RelationRuleType;
import com.wonders.frame.core.service.ObjInfoService;
import com.wonders.frame.core.service.RelationObjectService;
import com.wonders.frame.core.service.RelationRuleService;
import com.wonders.frame.core.service.RelationRuleTypeService;
import com.wonders.frame.core.service.RelationService;
import com.wonders.frame.core.utils.ReflectUtil;

@Controller
@RequestMapping("/relationRule/api")
public class RelationRuleApiController extends AbstractGenericApiController<RelationRule>{
	
	@Resource
	RelationRuleService relationRuleService;
	   
	@Resource
	private RelationService relationService;
	
	@Resource
	private RelationObjectService relationObjectService;
	
	@Resource
	private ObjInfoService objInfoService;
	
	@Resource
	RelationRuleTypeService relationRuleTypeService;
	/**
	 * @param rulePath 规则
	 * @param type
	 * @return
	 */
	@RequestMapping(value="/findRule/{type}/{pid}",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public HashMap<String,Object> findRule(@PathVariable("type") String type, @PathVariable("pid") Integer pid){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			List<String> relationRules = relationRuleService.findRuleByPIdAndType(pid, type);
//			getRules(relationRules);
			result.put("success",true);
//			result.put("result", relationRules);
			result.put("resultRule", getRules(relationRules));
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success",false);
		}
		return result;
	}	
	
	public  HashMap<Integer, String> getRules(List<String> list){
        Collections.sort (list);
        HashMap<Integer, String> map = new HashMap<Integer, String> ();
        int key = 0;
        for ( int i = 0; i < list.size (); i++ ){
            String temp = list.get (i);
            if (null == map.get (key)) {
                map.put (key, temp);
            }else if (temp.indexOf (map.get (key)) != -1){
                map.put (key, temp);
            }else{
                key++;
                map.put (key, temp);
            }
        }
        System.out.println (map.get(key));
        return map;
	}
	@RequestMapping("/getRelationRules")
	@ResponseBody
	public HashMap<String,Object> getRelationRules(String ptype,String type){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			if(ptype==null || "".equals(ptype)){
				
				RelationRuleType relationRuleType =relationRuleTypeService.findByName(type);
				String[] temp = relationRuleType.getRelationObj().split(",");
				Integer[] intIds = new Integer[temp.length];
				for(int i=0;i<temp.length;i++)
				{
					intIds[i] = Integer.parseInt(temp[i]);
				}
				List<ObjInfo> objInfos=new ArrayList<ObjInfo>();
				objInfos=this.objInfoService.findByIdIn(intIds);
//				Set<String> objs=new HashSet<String>();
//				for(RelationRule rule:relationRules){
//					objs.add(rule.getPtype());
//					objs.add(rule.getNtype());
//				}
				result.put("success",true);
				result.put("result", objInfos);
				
			}else{
				List<RelationRule> relationRules=this.relationRuleService.findByPtypeAndType(ptype, type);
				result.put("success",true);
				result.put("result", relationRules);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success",false);
		}
		return result;
	}
	
	@RequestMapping("/isExistsRelationRule")
	@ResponseBody
	public HashMap<String,Object> isExistsRelationRule(String ptype,String ntype,String type){
		HashMap<String,Object> result=new HashMap<String,Object>();
		try {
			RelationRule relationRule=relationRuleService.findByPTypeAndNTypeAndType(ptype, ntype, type);
			result.put("success", true);
			result.put("result", relationRule);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	   
	   @RequestMapping("/findObjects")
		@ResponseBody
		public HashMap<String,Object> findObjects(Relation relation){
			HashMap<String,Object> result=new HashMap<String,Object>();
			String[] preNode=null;
			String[] nextNode=null;
		    if(relation.getPid()!=null && !"".equals(relation.getPid())){
				preNode=new String[]{relation.getPtype(),relation.getPid().toString()};
			}else{
				preNode=new String[]{relation.getPtype()};
			}
		    if(relation.getNid()!=null && !"".equals(relation.getNid())){
		    	nextNode=new String[]{relation.getNtype(),relation.getNid().toString()};
		    }else{
		    	nextNode=new String[]{relation.getNtype()};
		    }
		    List<Object> objs=null;
			try {
				objs=relationObjectService.findNodeObjs(preNode, nextNode, relation.getType());
				result.put("success", true);
				result.put("result", objs);
			} catch (Exception e) {
				e.printStackTrace();
				result.put("success", false);
			}
			return result;
		}

	   
		@RequestMapping(value="/findObjectsByPath/{path}",method={RequestMethod.POST,RequestMethod.GET})
		@ResponseBody
		public HashMap<String,Object> findObjectsByPath(@PathVariable("path") String path,String type){
			HashMap<String,Object> result=new HashMap<String,Object>();
			try {
				if(path==null || "".equals(path) || (path.indexOf("<")<0 && path.indexOf(">")<0)){
					result.put("success", false);
					return result;
				}
				
				HashMap<String,List<String>> hmPath=relationService.convertPath(path);
				List<String> pathResults=relationService.getPathResult(hmPath,type);
				
				if(pathResults==null || pathResults.size()<=0){
					result.put("success",true);
					result.put("result", "");
					return result;
				}
				
				String nodeObj="";//记录查询的节点对象
				Set<String> ids=new HashSet<String>();//记录查询节点对象的id集合
				
	           if(pathResults.get(0).indexOf("<")>0 && pathResults.get(0).indexOf(">")>0){
	           	//"organ_1>role_101<user_189"
	           	//opList=[>, <], objList=[organ_1, role_101, user_189]
	           	for(String pathStr:pathResults){
	           		HashMap<String,List<String>> hmPathStr=relationService.convertPath(pathStr);
	                   List<String> opList=hmPathStr.get("opList");
	                   for(int i=0;i<opList.size()-1;i++){
	                   	if((opList.get(i).equals(">")&&opList.get(i+1).equals("<"))
	                   			||(opList.get(i).equals("<")&&opList.get(i+1).equals(">"))){
	                   		String[] nodeData=hmPathStr.get("objList").get(i+1).split("_");
	                   		if("".equals(nodeObj)){
	                   			nodeObj=nodeData[0];
	                   		}
	                   		ids.add(nodeData[1]);
	                   	}
	                   }
	           	}
	           }else if(pathResults.get(0).indexOf("<")>0){
	           	//"privilege_5<role_101<user_187",
	           	for(String pathStr:pathResults){
	           		String[] nodeData=pathStr.split("<")[0].split("_");
	           		if("".equals(nodeObj)){
	           			nodeObj=nodeData[0];
	           		}
	           		ids.add(nodeData[1]);
	           	}
	           }else if(pathResults.get(0).indexOf(">")>0){
	           	//"user_187>role_101>privilege_5"
	           	for(String pathStr:pathResults){
	           		String[] pathResult=pathStr.split(">");
	           		String[] nodeData=pathResult[pathResult.length-1].split("_");
	           		if("".equals(nodeObj)){
	           			nodeObj=nodeData[0];
	           		}
	           		ids.add(nodeData[1]);
	           	}
	           }
	           
	           String nodeIds = ids.toString().replaceFirst("^\\[", "").replaceAll("\\]$", "");
	           List<Object> objs=relationObjectService.findObjectsByNextNodeIds(nodeObj, nodeIds);
	           result.put("success",true);
	           result.put("result", objs);
			} catch (Exception e) {
				e.printStackTrace();
				result.put("success",false);
			}
			return result;
		}	
		
		
		/**
		 * @param rulePath 规则
		 * @param type
		 * @return
		 */
		@RequestMapping(value="/findObjByRule/{rulePath}",method={RequestMethod.POST,RequestMethod.GET})
		@ResponseBody
		public HashMap<String,Object> findObjByRule(@PathVariable("rulePath") String rulePath,String type){
			HashMap<String,Object> result=new HashMap<String,Object>();
			try {
				if(rulePath==null || "".equals(rulePath) || (rulePath.indexOf("<")<0 && rulePath.indexOf(">")<0)){
					result.put("success", false);
					return result;
				}
				//对rulePath进行切割
				String firstOper;
				if((rulePath.indexOf("<")<0 || rulePath.indexOf(">")<0)){
					firstOper = (rulePath.indexOf("<")<rulePath.indexOf(">"))?">":"<";	
				}else{
					firstOper = (rulePath.indexOf("<")<rulePath.indexOf(">"))?"<":">";	
				}
				String[] firstNodeData=rulePath.substring(0,rulePath.indexOf(firstOper)).split("_");
				
				if(firstNodeData.length>1){
					boolean isNum = firstNodeData[1].matches("[0-9]+");
					if(!isNum){
						List firtObj = relationObjectService.findObjsByFieldName(firstNodeData[0], firstNodeData[1]);
						if(firtObj.size()!=0){
							int id = (Integer) ReflectUtil.invokeGet(firtObj.get(0), "id");
							rulePath = rulePath.replace(firstNodeData[1], String.valueOf(id));
						}else{
							result.put("success",false);
							return result;
						}
						
					}
				}
				
				HashMap<String,List<String>> hmPath=relationService.convertPath(rulePath);
				List<String> pathResults=relationService.getPathResult(hmPath,type);
				
				if(pathResults==null || pathResults.size()<=0){
					result.put("success",true);
					result.put("result", "");
					return result;
				}
				
				String nodeObj="";//记录查询的节点对象
				Set<String> ids=new HashSet<String>();//记录查询节点对象的id集合
				
				for(String pathStr:pathResults){
					String lastOper = (pathStr.lastIndexOf("<")<pathStr.lastIndexOf(">"))?">":"<";
					String[] nodeData=pathStr.substring(pathStr.lastIndexOf(lastOper)+1).split("_");
					if("".equals(nodeObj)){
						nodeObj=nodeData[0];
					}
					ids.add(nodeData[1]);
				}
				String nodeIds = ids.toString().replaceFirst("^\\[", "").replaceAll("\\]$", "");
				List<Object> objs=relationObjectService.findObjectsByNextNodeIds(nodeObj, nodeIds);
				result.put("success",true);
				result.put("result", objs);
			} catch (Exception e) {
				e.printStackTrace();
				result.put("success",false);
			}
			return result;
		}	
		
		@RequestMapping("/findDepts")
		@ResponseBody 
		public HashMap<String,Object> findDeptsByUser(String username){
			HashMap<String,Object> result=new HashMap<String,Object>();
			try {
				List<Object> depts=relationObjectService.findDeptsByUsername(username);
				result.put("success", true);
				result.put("result", depts);
			} catch (Exception e) {
				e.printStackTrace();
				result.put("success", false);
			}
			return result;
		}
		
		@RequestMapping("/findPrivileges")
		@ResponseBody
		public HashMap<String,Object> findPrililegesByUser(String username){
			HashMap<String,Object> result=new HashMap<String,Object>();
			try {
				List<Object> prilileges=relationObjectService.findPrivilegesByUsername(username);
				result.put("success", true);
				result.put("result", prilileges);
			} catch (Exception e) {
				e.printStackTrace();
				result.put("success", false);
			}
			return result;
		}
}
