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


//判断新增的数据是否已存在
   function isExistsRelationRule(){
       var isExist;
       var PType=$("#PType").val();
       var NType=$("#NType").val();
       var ptype = PType.substring(PType.indexOf("_")+1);
       var ntype = NType.substring(NType.indexOf("_")+1);
       var type=$("#type").val();
       $.ajax({
		        type: 'POST',
		        async: false,
				url: getBasePath()+'/relationRule/api/isExistsRelationRule',
				data:'ptype='+ptype+'&ntype='+ntype+'&type='+type,
				dataType:'json',
				error:function(){alert('系统连接失败，请稍后再试！')},
				success: function(data){
					if(data.success==true){
					   if(data.result==null || data.result.length<=0){
					      isExist=true;//允许添加
					   }else{
					      isExist=false;//不允许添加
					   }
					}
				}	 
		   });
		   return isExist;
   }
 //根据规则名查找相关实体id
   function getRelationObjs(){
	   var $name = $("#type").val();
	   var ids=0;
	   $.ajax({
		   type: 'POST',
	       async: false,
	       url: getBasePath()+'/relationRuleType/api/isExistsRelationRuleType',
	       data:{'name':$name},
	       dataType:'json',
	       error:function(){alert('系统连接失败，请稍后再试！');},
	       success: function(data){
	    	   if(data.success==true){
	    		   ids = data.result.relationObj;
				}
			}	
	   });
	   return ids;
   }

   //初始化上级联、下级联对象下拉框,按规则类型查找
   function initRelationObjInfoSelect(){
	   var ids = getRelationObjs();
       $.ajax({
        type: 'POST',
		url: getBasePath()+'/objInfo/api/findObjInfosByIds',
		data:{'ids':ids},
		dataType:'json',
		async:false,
		error:function(){alert('系统连接失败，请稍后再试！')},
		success: function(obj){
			if(obj.success){
				$("#PType").append("<option value=''select='selected'>请选择</option>");
				$("#NType").append("<option value=''select='selected'>请选择</option>");
				for(var i=0;i<obj.result.length;i++){
					$("#PType").append("<option value='"+obj.result[i].id+"_"+obj.result[i].type+"'>"+obj.result[i].name+"</option>");	
					$("#NType").append("<option value='"+obj.result[i].id+"_"+obj.result[i].type+"'>"+obj.result[i].name+"</option>");	
//				     trItem+="<td><input type=\"checkBox\" name=\"id\" value=\""+dataContent.id+"\"/></td>";
				}
			}
		}	 
       });
   }
   //初始化上级联、下级联对象下拉框
   function initObjectInfoSelect(){
       $.ajax({
        type: 'POST',
		url: getBasePath()+'/objInfo/api/all',
		dataType:'json',
		async:false,
		error:function(){alert('系统连接失败，请稍后再试！')},
		success: function(obj){
			if(obj.success){
				$("#PType").append("<option value=''select='selected'>请选择</option>");
				$("#NType").append("<option value=''select='selected'>请选择</option>");
				for(var i=0;i<obj.result.length;i++){
					$("#PType").append("<option value='"+obj.result[i].type+"'>"+obj.result[i].name+"</option>");	
					$("#NType").append("<option value='"+obj.result[i].type+"'>"+obj.result[i].name+"</option>");	
				}
			}
		}	 
       });
   }
   
 
   //加载历史的配置规则到列表显示
   function listHistoryRelationRule(page){
      $("#relationRuleHistoryData tbody").html("");
      var pageSize=$("#pageSizeSelectorHistory").val();
      if(pageSize==undefined){
    	  pageSize=20;
      }
      var type=$("#type").val();
      var sort=$("#sort").val();
      var pType=changeToValue($("#pType").val());
	  var nType=changeToValue($("#nType").val());
      $.ajax({
		        type: 'POST',
		        url: getBasePath()+'/relationRule/api/page',
				data:{
					   'pageSize':pageSize,
					   'pageNum':page,
					   'type':type,
					   'sort':sort,
					   'ptype':pType,
					   'ntype':nType
				     },
				dataType:'json',
				async:false,
				error:function(){alert('系统连接失败，请稍后再试！')},
				success: function(data){
					if(data.success==true){
					   if(data.result.content!=null && data.result.content.length>0){
					      for(var i=0;i<data.result.content.length;i++){
					        var dataContent=data.result.content[i]; 
					        var trItem="<tr>";  
					        trItem+="<td><input type=\"checkBox\" name=\"id\" value=\""+dataContent.id+"\"/></td>";
					        trItem+="<td>"+(i+1)+"</td>";
					        trItem+="<td>"+change(""+dataContent.ptype)+"</td>";
					        trItem+="<td>"+change(""+dataContent.ntype)+"</td>";
					        trItem+="<td>"+dataContent.type+"</td>";
					        trItem+="<td><a href=\"javascript:void(0);\" onclick=\"javascript:del('"+dataContent.id+"');\" title=\"删除\"><img src=\"images/icons2/delete_16.png\"/></a></td>";
					        trItem+="</tr>";
					        $("#relationRuleHistoryData tbody").append(trItem);
					      }
					   }
					   setPage(data.result.pageInfo);
					}
				}	 
	  });
   }
  
   //全选
   function allSelect(e){
	   if(e.value=="全选"){
		   $(":checkbox").attr("checked",true);
		   e.value="全不选";
	   }else{
		   $(":checkbox").attr("checked",false);
		   e.value="全选";
	   }
   }
   
   //删除所有被选中的选项
   function delAllSelect(){
	   if($("#allSelect").val()=="全不选"){
		   $("#allSelect").val("全选");
	   }
	   var checkboxs=$("input:checked");
	   for(var i=0;i<checkboxs.length;i++){
		   $.ajax({
			   url:getBasePath()+'/relationRule/api/del/'+$(checkboxs[i]).val(),
			   type:'post',
			   dataType:'json',
			   async:false,
			   error:function(){alert('系统连接失败，请稍后再试！')},
			   success:function(data){
				   if(data.success==false){
					   alert('系统异常，删除失败！');
				   }
			   }
		   });
	   }
	   listHistoryRelationRule(1);
   }
   
   
   //删除指定id的数据
   function del(id){
	   var pageStr=$(".current").text();
	   if(pageStr.substring(0,3)=="上一页"){
		   pageStr=pageStr.substring(3,4);
	   }else{
		   pageStr=pageStr.substring(0,1);
	   }
	   $.ajax({
		   url:getBasePath()+'/relationRule/api/del/'+id,
		   type:'post',
		   dataType:'json',
		   async:false,
		   error:function(){alert('系统连接失败，请稍后再试！')},
		   success:function(data){
			   if(data.success==false){
				   alert('系统异常，删除失败！');
			   }
		   }
	   });
	   listHistoryRelationRule(pageStr);
   }
   
   //转换显示信息为文本消息
   function change(content){
      var options=$("#PType option");
      for(var i=0;i<options.length;i++){
         if($(options[i]).val()==content){
             content=$(options[i]).text();
             break;
         }
      }
      return content;
   }
   
   //转换查询数据为value
   function changeToValue(content){
	   var options=$("#PType option");
	   for(var i=0;i<options.length;i++){
		   if(content==$(options[i]).text()){
			   content=$(options[i]).val();
			   break;
		   }
	   }
	   return content;
   }
   
   
   //设置分页
   function setPage(pageInfo){
      $("#paginationHistory").html("");
      var pageContent="";
      pageContent+="<a href=\"javascript:void(0)\" onclick=\"javascript:onSubmit(1)\">&laquo; 第一页</a>";
      if(pageInfo.hasPrevious==true){
         pageContent+="<a href=\"javascript:void(0)\" onclick=\"javascript:onSubmit("+(pageInfo.currentPage-1)+")\" class=\"number current\">上一页</a>";
      }
      for(var i=1;i<=pageInfo.totalPages;i++){
         if(i==pageInfo.currentPage){
            pageContent+="<a href=\"javascript:void(0)\" class=\"number current\">"+i+"</a>";
         }else{
            pageContent+="<a href=\"javascript:void(0)\" onclick=\"javascript:onSubmit("+i+")\" class=\"number\">"+i+"</a>";
         }
      }
      if(pageInfo.hasNext==true){
          pageContent+="<a href=\"javascript:void(0)\" onclick=\"javascript:onSubmit("+(pageInfo.currentPage+1)+")\" class=\"number current\">下一页</a>";
      }
      pageContent+="<a href=\"javascript:void(0)\" onclick=\"javascript:onSubmit("+pageInfo.totalPages+")\" title=\"Last Page\">最后一页 &raquo;</a>";
	  pageContent+="<span> 共"+pageInfo.totalPages+"页/"+pageInfo.totalRecord+"条 </span>";
	  pageContent+="<span> 每页</span>";
	  pageContent+="<select id=\"pageSizeSelectorHistory\" onchange=\"javascript:onSubmit(1)\">";
	  if(pageInfo.pageSize==1){
	    pageContent+="<option value=\"1\" selected=\"selected\">1</option>";
	  }else{
	    pageContent+="<option value=\"1\">1</option>";
	  }
	  if(pageInfo.pageSize==5){
	    pageContent+="<option value=\"5\" selected=\"selected\">5</option>";
	  }else{
	    pageContent+="<option value=\"5\">5</option>";
	  }
	  if(pageInfo.pageSize==10){
	    pageContent+="<option value=\"10\" selected=\"selected\">10</option>";
	  }else{
	    pageContent+="<option value=\"10\">10</option>";
	  }
	  if(pageInfo.pageSize==20){
	    pageContent+="<option value=\"20\" selected=\"selected\">20</option>";
	  }else{
	    pageContent+="<option value=\"20\">20</option>";
	  }
	  pageContent+="</select><span>条</span>";
	  $("#paginationHistory").html(pageContent);
   }
   
   //分页查看
   function onSubmit(page){  
	    listHistoryRelationRule(page);  
   }
   
   
   //显示与隐藏查询界面
   function showQuery(){
	   if($("#query").css("display")=="none"){ 
		   $("#query").css("display","block");
	   }else{
		   $("#query").css("display","none");
	   }
   }
   
   //查询
   function retrievalList(){
	   listHistoryRelationRule(1);
   }
   
   