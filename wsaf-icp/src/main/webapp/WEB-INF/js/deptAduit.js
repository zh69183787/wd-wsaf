/**
 * js获取系统的根路径
 * @returns
 */
function getBasePath(){
	var obj=window.location;
	var contextPath=obj.pathname.split("/")[1];
	var basePath=obj.protocol+"//"+obj.host+"/"+contextPath;
	return basePath;
}; 


//第一步：根据mainId获取问卷信息
$.getQteMain=function(mainId){
	 $.ajax({
         url: getBasePath()+"/basicCrud/qteMain/get/"+mainId,
         type: 'post',
         dataType: 'json',
         async:false,
         success: function (data) {
             if(data.success==true && data.result!=null){
            	  $("#title").val(data.result.title);
            	  $("#startTime").val(data.result.startTime);
            	  $("#endTime").val(data.result.endTime);
            	  $("#participants").val(data.result.participants);
            	  if(data.result.isOpend=="yes"){
            		  $("#isOpend").val("开放");
            	  }else{
            		  $("#isOpend").val("不开放");
            	  }
            	  var lineHead=$.getLineHead1(data.result.mainType);
            	  var arr=lineHead.split(",")
            	  $("#lineHeadName").val(arr[1]);
            	  $("#lineHeadLoginName").val(arr[0]);
            	  $("#description").val(data.result.description);
             }

         }
     });
}


//根据条线获取条线领导
$.getLineHead1=function(mainType){
	var json=$.getLineHead();
	var lineStr="";
    for(var i=0;i<json.length;i++){
    	if(mainType==json[i].mainType){
    		lineStr=json[i].loginName+","+json[i].name;
    		break;
    	}
    }	
    return lineStr;
}

//第二步：根据mainId查询该问卷id的流转记录QteMainWorkFlow
$.getQteMainWorkFlow=function(mainId){
	$.ajax({
        url: getBasePath()+"/qteMainWorkflow/findByQteId/"+mainId,
        type: 'post',
        dataType: 'json',
        async:false,
        success: function (data) {
        	if(data.success==true && data.result!=null){
        		$("#workFlowId").val(data.result.id);
        	}
        }
    });
}


//部门领导审核通过，状态改为：待条线领导审核
$.auditPass=function(){

	var lineHeadName=$("#lineHeadName").val();
	var lineHeadLoginName=$("#lineHeadLoginName").val();
	var workFlowId=$("#workFlowId").val();
	var suggestion=$("#suggestion").val();
	
	$.ajax({
        url: getBasePath()+"/basicCrud/qteMainWorkflow/save",
        type: 'post',
        dataType: 'json',
        data:{
        	"id":workFlowId,
        	"suggestion":suggestion,
        	"handler":lineHeadName,
        	"handlerLoginname":lineHeadLoginName,
        	"handleTime":"",
        	"status":"inLineAudit"
        },
        async:false,
        success: function (data) {
        	if(data.success==true && data.result!=null){
        		alert("审核成功！");
        	}
        }
    });
}

//部门领导审核不通过，返回修改
$.deptBack=function(){
	var workFlowId=$("#workFlowId").val();
	var suggestion=$("#suggestion").val();
	$.ajax({
        url: getBasePath()+"/basicCrud/qteMainWorkflow/save",
        type: 'post',
        dataType: 'json',
        data:{
        	"id":workFlowId,
        	"suggestion":suggestion,
        	"handleTime":new Date().getTime(),
        	"status":"deptBack"
        },
        async:false,
        success: function (data) {
        	if(data.success==true && data.result!=null){
        		alert("审核成功！");
        	}
        }
    });
	
}
