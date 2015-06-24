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
   function isExistsRelationRuleType(){
       var isExist=false;
       var name=$("#name").val();
       $.ajax({
		        type: 'POST',
		        async: false,
				url: getBasePath()+'/relationRuleType/api/isExistsRelationRuleType',
				data:'name='+name,
				dataType:'json',
				error:function(){alert('系统连接失败，请稍后再试！');},
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
   
   //初始化上级联、下级联对象下拉框
   function initObjectInfoSelect(){
       $.ajax({
        type: 'POST',
		url: getBasePath()+'/objInfo/api/all',
		dataType:'json',
		async:false,
		error:function(){alert('系统连接失败，请稍后再试！');},
		success: function(obj){
			if(obj.success){
				for(var i=0;i<obj.result.length;i++){
					$("#relationObj").append("<option value= '"+obj.result[i].id+"'>"+obj.result[i].name+"</option>");	
//					$("#relationObj").append("<option value= '{id:"+obj.result[i].id+",entity:"+obj.result[i].type+"}'>"+obj.result[i].name+"</option>");	
				}
				$("#relationObj").multiSelect({
					selectAllText: '全选',  
					noneSelected: '请选择',
//					oneOrMoreSelected: '% options checked',
					oneOrMoreSelected: '*',
				});
			}
		}	 
       });
   }
 
   //加载历史的配置规则到列表显示
   function listHistoryRelationRuleType(page){
      $("#relationRuleHistoryData tbody").html("");
      var pageSize=$("#pageSizeSelectorHistory").val();
      if(pageSize==undefined){
    	  pageSize=20;
      }
      var sort=$("#sort").val();
      $.ajax({
		        type: 'POST',
		        url: getBasePath()+'/relationRuleType/api/page',
				data:{
					   'pageSize':pageSize,
					   'pageNum':page,
					   'sort':sort,
				     },
				dataType:'json',
				async:false,
				error:function(){alert('系统连接失败，请稍后再试！');},
				success: function(data){
					if(data.success==true){
					   if(data.result.content!=null && data.result.content.length>0){
					      for(var i=0;i<data.result.content.length;i++){
					        var dataContent=data.result.content[i]; 
					        var trItem="<tr>";  
					        trItem+="<td><input type=\"checkBox\" name=\"id\" value=\""+dataContent.id+"\"/></td>";
					        trItem+="<td>"+(i+1)+"</td>";
					        trItem+="<td>"+dataContent.name+"</td>";
					        trItem+="<td>"+dataContent.relationObj+"</td>";
					        trItem+="<td><a href=\"javascript:void(0);\" onclick=\"javascript:del('"+dataContent.id+"');\" title=\"删除\"><img src=\"images/icons2/delete_16.png\"/></a>&nbsp;&nbsp;" +
					        		"<a href=\"http://localhost:8080/wsaf-web/relationRule/toRelationRuleEdit/"+dataContent.name+"\" target=\"_blank\" title=\"配置规则\">配置规则</a></td>";
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
			   url:getBasePath()+'/relationRuleType/api/del/'+$(checkboxs[i]).val(),
			   type:'post',
			   dataType:'json',
			   async:false,
			   error:function(){alert('系统连接失败，请稍后再试！');},
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
		   url:getBasePath()+'/relationRuleType/api/del/'+id,
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
	   listHistoryRelationRuleType(pageStr);
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
   
   