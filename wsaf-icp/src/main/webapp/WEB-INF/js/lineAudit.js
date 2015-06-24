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
            	  $("#description").val(data.result.description);
             }

         }
     });
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


//条线领导审核通过，状态改为：通过
$.auditPass=function(){
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
        	"status":"pass"
        },
        async:false,
        success: function (data) {
        	if(data.success==true && data.result!=null){
        		alert("审核成功！");
        	}
        }
    });
}

//条线领导审核不通过，返回修改
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
        	"status":"lineBack"
        },
        async:false,
        success: function (data) {
        	if(data.success==true && data.result!=null){
        		alert("审核成功！");
        	}
        }
    });
	
}