/** 
* @Title: UserEditController.java 
* @Package com.wonders.frame.core.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author lushuaifeng
* @version V1.0 
*/
package com.wonders.frame.core.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.wonders.frame.core.model.bo.Relation;
import com.wonders.frame.core.model.vo.NodeObj;
import com.wonders.frame.core.service.RelationService;

@Controller
@RequestMapping("/relation/api")
public class RelationApiController extends AbstractGenericApiController<Relation>{
	@Resource
	RelationService relationService;
	
	@RequestMapping(value="/findPrevious",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody 
	public HashMap<String,Object> listAllLv1Previous(@RequestParam("nId") Integer nId,@RequestParam("nType") String nType) {		
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			List<Relation> lr= relationService.findByNIdAndNType(nId, nType);
			result.put("success", true);
			result.put("result", lr);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping(value="/findNext",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody 
	public HashMap<String,Object> listAllLv1Next(@RequestParam("pId") Integer pId,@RequestParam("pType") String pType) {		
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			List<Relation> lr= relationService.findByPIdAndPType(pId, pType);
			result.put("success", true);
			result.put("result", lr);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
    
//	@RequestMapping(value="/saveBind",method={RequestMethod.POST,RequestMethod.GET})
//	@ResponseBody 
//	public HashMap<String,Object> saveBind(@RequestParam("pId") String pId,@RequestParam("pType") String pType,@RequestParam("nId") String nId,@RequestParam("nType") String nType) {
//		HashMap<String,Object> result=new HashMap<String,Object>();
//		try{
//			String[] pIds=pId.split(",");
//			String[] nIds=nId.split(",");
//			for(String bindPid:pIds){
//				for(String bindNid:nIds){				
//					relationService.save(pType,Integer.valueOf(bindPid),nType,Integer.valueOf(bindNid));
//				}
//			}
//			result.put("success", true);
//		}catch(Exception e){
//			e.printStackTrace();
//			result.put("success", false);
//		}
//		return result;
//	}
	/**
	 * @author taoweiwei
	 * @param pId  
	 * @param pType
	 * @param nId
	 * @param nType
	 * @param type
	 * @return
	 */
	@RequestMapping(value="/saveBind",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody 
	public HashMap<String,Object> saveBind(@RequestParam("pId") String pId,@RequestParam("pType") String pType,
			                               @RequestParam("nId") String nId,@RequestParam("nType") String nType,
			                               @RequestParam("type") String type) {
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			String[] pIds=pId.split(",");
			String[] nIds=nId.split(",");
			for(String bindPid:pIds){
				for(String bindNid:nIds){				
					relationService.save(pType,Integer.valueOf(bindPid),nType,Integer.valueOf(bindNid),type);
				}
			}
			result.put("success", true);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
//	@RequestMapping(value="/removeBind",method=RequestMethod.POST)
//	@ResponseBody 
//	public HashMap<String,Object> removeBind(@RequestParam("pId") Integer pId,@RequestParam("pType") String pType,@RequestParam("nId") Integer nId,@RequestParam("nType") String nType, @RequestParam("type") String type) {
//		HashMap<String,Object> result=new HashMap<String,Object>();
//		try{
//				
//			Integer rs=relationService.remove(pType,pId,nType,nId,type);
//
//			result.put("success", true);
//			result.put("result", rs+" records removed!");
//		}catch(Exception e){
//			e.printStackTrace();
//			result.put("success", false);
//		}
//		return result;
//	}
	
	@RequestMapping(value="/removeBind",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody 
	public HashMap<String,Object> removeBind(@RequestParam("pId") String pId,@RequestParam("pType") String pType,@RequestParam("nId") String nId,@RequestParam("nType") String nType, @RequestParam("type") String type) {
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			String[] pIds=pId.split(",");
			String[] nIds=nId.split(",");
			for(String bindPid:pIds){
				for(String bindNid:nIds){				
					Integer rs=relationService.remove(pType,Integer.valueOf(bindPid),nType,Integer.valueOf(bindNid),type);
					result.put("result", rs+" records removed!");
				}
			}
			result.put("success", true);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping(value="/removeBind/{path}",method=RequestMethod.GET)
	@ResponseBody 
	public HashMap<String,Object> removeBindByPath(@PathVariable("path") String path) {
		HashMap<String,Object> result=new HashMap<String,Object>();
		String pType=null,pId=null,nType=null,nId=null;
		try{
			if(path==null||path.equals("")||(path.indexOf(">")<0 && path.indexOf("<")<0)){
				result.put("success", false);
				return result;
			}
			HashMap<String,List<String>> hmPath=relationService.convertPath(path);
			
			List<String> objList=hmPath.get("objList");
			List<String> opList=hmPath.get("opList");

			String[] beginObj=objList.get(0).split("_");
			String[] endObj=objList.get(1).split("_");
			if(beginObj.length>1&&endObj.length>1){
				if(opList.get(0).equals(">")){
					pType=beginObj[0];
					pId=beginObj[1];
					nType=endObj[0];
					nId=endObj[1];
				}else{
					nType=beginObj[0];
					nId=beginObj[1];
					pType=endObj[0];
					pId=endObj[1];
				}
			}else{
				result.put("success", false);
			}
			Integer rs=relationService.remove(pType,Integer.valueOf(pId),nType,Integer.valueOf(nId));
			if(rs>0){
				result.put("success", true);
				result.put("result", rs+" records removed!");
			}else{
				result.put("success", false);
			}
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
/*	url参数path格式:"objType_objId>(<)objType_objId...，其中关联符“>”表示前面的对象是后面对象的上级节点；关联符“<”表示前面的对象是后面对象的下级节点
*/	
	@RequestMapping(value="/findPath/{path}",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody 
	public HashMap<String,Object> findObjectPaths(@PathVariable("path") String path) {
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			if(path==null||path.equals("")||(path.indexOf(">")<0 && path.indexOf("<")<0)){
				result.put("success", false);
				return result;
			}
			HashMap<String,List<String>> hmPath=relationService.convertPath(path);
			
			List<String> pathResults=relationService.getPathResult(hmPath);
						
			result.put("success", true);
			result.put("result", pathResults);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	
	@RequestMapping(value="/findTree/{path}",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody 
	public HashMap<String,Object> findObjectTrees(@PathVariable("path") String path) {
		HashMap<String,Object> result=new HashMap<String,Object>();
		try{
			if(path==null||path.equals("")||(path.indexOf(">")<0 && path.indexOf("<")<0)){
				result.put("success", false);
				return result;
			}
			
			HashMap<String,List<String>> hmPath=relationService.convertPath(path);
			
			List<String> opList=hmPath.get("opList");
			
			List<String> pathResults=relationService.getPathResult(hmPath);
			
			HashMap<String,Object> hmKeyOp=new HashMap<String,Object>();
			for(int i=opList.size()-1;i>=0;i--){
				String op=opList.get(i);
				String nodeType=op.equals(">")?"next":"previous";
				
				HashMap<String,Object> hmKeyOpTmp=new HashMap<String,Object>();
				
				if(i==opList.size()-1){
					for(String pathResult:pathResults){
						relationService.convertPath2Map(pathResult,op,nodeType,null,hmKeyOpTmp);
					}
				}else{
					for(String key:hmKeyOp.keySet()){
						Object nextNodes=hmKeyOp.get(key);
						relationService.convertPath2Map(key,op,nodeType,nextNodes,hmKeyOpTmp);
					}
					
				}
				hmKeyOp=hmKeyOpTmp;
				
			}
			HashMap<String,List<NodeObj>> hm=new HashMap<String,List<NodeObj>>();
			
			for(String key:hmKeyOp.keySet()){
				Object nextNodes=hmKeyOp.get(key);
				String[]curNode=key.split("_");
				relationService.bindNode2ObjDataMap(curNode,nextNodes,hm);
			}
			result.put("success", true);
			result.put("result", hm);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", false);
		}
		return result;
	}
	/*
	private void bindNode2ObjDataMap(String[] curNode,Object relatedNode,HashMap<String,List<NodeObj>> hmObjData){
		if(!hmObjData.containsKey(curNode[0])){
			List<NodeObj> dataList=new ArrayList<NodeObj>();//对象数据队列：存放对象数据队列
			NodeObj obj=new NodeObj();
			obj.setData(curNode[1]);
			if(relatedNode!=null){
				obj.setRelatedNode(relatedNode);
			}
			dataList.add(obj);
			
			hmObjData.put(curNode[0], dataList);
		}else{
			List<NodeObj> dataListTmp=(List<NodeObj>)hmObjData.get(curNode[0]);
			NodeObj obj=new NodeObj();
			obj.setData(curNode[1]);
			if(relatedNode!=null){
				obj.setRelatedNode(relatedNode);
			}
			dataListTmp.add(obj);
		}
	}
	private void convertPath2Map(String pathResult,String op,String nodeType,Object relatedNode,HashMap<String,Object> hmKeyOp){
		
		int opIndex=pathResult.lastIndexOf(op);
		
		String key=pathResult.substring(0,opIndex);
		
		String[] curNode=pathResult.substring(opIndex+1).split("_");
		
		if(!hmKeyOp.containsKey(key)){
			List<NodeObj> dataList=new ArrayList<NodeObj>();//对象数据队列：存放对象数据队列
			NodeObj obj=new NodeObj();
			obj.setData(curNode[1]);
			if(relatedNode!=null){
				obj.setRelatedNode(relatedNode);
			}
			dataList.add(obj);

			HashMap<String,List<NodeObj>> hmObjData=new HashMap<String,List<NodeObj>>();//对象数据映射：存放对象类型与ID队列的映射关系		
			hmObjData.put(curNode[0], dataList);
			
			HashMap<String,Object> hmOpObj=new HashMap<String,Object>();//存放关系类型与对象数据映射的对应关系
			hmOpObj.put(nodeType, hmObjData);
			
			hmKeyOp.put(key, hmOpObj);
		}else{
			HashMap<String,Object> hmOpObjTmp=(HashMap<String,Object>)hmKeyOp.get(key);
			if(!hmOpObjTmp.containsKey(nodeType)){
				List<NodeObj> dataList=new ArrayList<NodeObj>();//对象数据队列：存放对象数据队列
				NodeObj obj=new NodeObj();
				obj.setData(curNode[1]);
				dataList.add(obj);
				if(relatedNode!=null){
					obj.setRelatedNode(relatedNode);
				}
				
				HashMap<String,List<NodeObj>> hmObjData=new HashMap<String,List<NodeObj>>();//对象数据映射：存放对象类型与ID队列的映射关系		
				hmObjData.put(curNode[0], dataList);
				
				HashMap<String,Object> hmOpObj=new HashMap<String,Object>();//存放关系类型与对象数据映射的对应关系
				hmOpObjTmp.put(nodeType, hmObjData);

			}else{
				HashMap<String,List<NodeObj>> hmObjDataTmp=(HashMap<String,List<NodeObj>>)hmOpObjTmp.get(nodeType);
				bindNode2ObjDataMap(curNode,relatedNode,hmObjDataTmp);
				
			}
		}

		
	
	}
	//从path参数中获取关联对象和关联符
	private HashMap<String,List<String>> convertPath(String path){
		List<String> pathObjList=new ArrayList<String>();//存放关联对象
		List<String> pathOpList=new ArrayList<String>();//存放关联符
		
		StringBuffer sb=new StringBuffer("");	
		
		for(int i=0;i<path.length();i++){//按字符遍历查询路径，
			String subStr=path.substring(i, i+1);
			if(subStr.equals(">")||subStr.equals("<")){//当前字符为关联符>或<时
				pathObjList.add(sb.toString());
				pathOpList.add(subStr);
				sb.setLength(0);
			}else{					
				sb.append(subStr);					
			}
			
		}
		pathObjList.add(sb.toString());
		HashMap<String,List<String>> hmPath=new HashMap<String,List<String>>();
		hmPath.put("objList", pathObjList);
		hmPath.put("opList", pathOpList);
		return hmPath;
	}
	//通过递归查询，获得与url入参path格式一致的结果集
	private List<String> getPathResult(HashMap<String,List<String>> hmPath){
		List<String> queryResult=new ArrayList<String>();	

		String[] beginObj = hmPath.get("objList").get(0).split("_");//获取关联符之前的对象
		
		loopQuery(beginObj,hmPath.get("objList"),hmPath.get("opList"),"",0,queryResult);//递归查询
		
		return queryResult;
	}
	//递归查询，以一个前置对象，一个后置对象进行一次查询，前置后置对象的前后关系由关联符号决定
	private void loopQuery(String[] beginObj,List<String> pathObjList,List<String> pathOpList,String prefixValue,int index,List<String> queryResult){
		
		String op=pathOpList.get(index);
		
		String[] endObj = pathObjList.get(index+1).split("_");//获取关联符之后的对象
				
		String[] pObj=op.equals(">")?beginObj:endObj;//根据关联符获得上级节点对象
		String[] nObj=op.equals(">")?endObj:beginObj;//根据关联符获得下级节点对象		
		
		List<Relation> relationList=findListByPObjAndNObj(pObj,nObj);//根据前置和后置对象查询关连表

		for(Relation r:relationList){
			StringBuffer curPreFixValue=new StringBuffer("");
			if(index<pathOpList.size()-1){//非最后一次递归（操作到最后一组对象之前）时，取path中位于前面的对象数据拼接到返回的字符串上
				String[] nextBeginObj=new String[2];				
				if(op.equals(">")){
					curPreFixValue=curPreFixValue.append(prefixValue).append(r.getPType()).append("_").append(r.getPId().toString()).append(op);
					nextBeginObj[0]=r.getNType();
					nextBeginObj[1]=r.getNId().toString();
					
				}else{
					curPreFixValue=curPreFixValue.append(prefixValue).append(r.getNType()).append("_").append(r.getNId().toString()).append(op);
					nextBeginObj[0]=r.getPType();
					nextBeginObj[1]=r.getPId().toString();
				}
				
				loopQuery(nextBeginObj,pathObjList,pathOpList,curPreFixValue.toString(),index+1,queryResult);
			}else{//最后一次递归时，将查询结果中的前置和后置数据都拼接到要返回的字符串上
				if(op.equals(">")){
					curPreFixValue=curPreFixValue.append(prefixValue)
					.append(r.getPType()).append("_").append(r.getPId().toString()).append(op)
					.append(r.getNType()).append("_").append(r.getNId().toString());
					
				}else{
					curPreFixValue=curPreFixValue.append(prefixValue)
					.append(r.getNType()).append("_").append(r.getNId().toString()).append(op)
					.append(r.getPType()).append("_").append(r.getPId().toString());
				}
				queryResult.add(curPreFixValue.toString());
			}
			
		}

	}
	//根据前置和后置对象所包含的数据，确定调用那一个接口
	private List<Relation> findListByPObjAndNObj(String[] pObj,String[] nObj){
		List<Relation> relationList=new ArrayList<Relation>();
		switch(pObj.length){//判断上级对象长度
					case 1://长度为1，则上级对象不包含具体ID
						switch(nObj.length){//判断下级对象长度
							case 1://长度为1，则下级对象不包含具体ID
								relationList=relationService.findByPTypeAndNType(pObj[0], nObj[0]);
								break;
							case 2://长度为2，则下级对象包含具体ID
								relationList=relationService.findByPTypeAndNTypeAndNId(pObj[0], nObj[0], Integer.valueOf(nObj[1]));
								break;
							default:break;
						};
						break;
					case 2://长度为2，则上级对象包含具体ID
						switch(nObj.length){//判断下级对象长度
							case 1://长度为1，则下级对象不包含具体ID
								relationList=relationService.findByPTypeAndPIdAndNType(pObj[0], Integer.valueOf(pObj[1]), nObj[0]);
								break;
							case 2://长度为2，则下级对象包含具体ID
								relationList=relationService.findByPTypeAndPIdAndNTypeAndNId(pObj[0], Integer.valueOf(pObj[1]), nObj[0], Integer.valueOf(nObj[1]));
								break;
							default:break;
						};
						break;
					default:break;
				}
		return relationList;
		
	}
	*/
	@RequestMapping(value="/test",method=RequestMethod.GET)
	@ResponseBody 
	public HashMap<String,Object> test() {
		HashMap<String,Object> result=new HashMap<String,Object>();
		result.put("success", true);
		return result;
	}
}
