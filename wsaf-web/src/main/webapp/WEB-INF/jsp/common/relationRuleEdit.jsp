<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<base href="<%=basePath%>" />
	<title>FRAME-2222</title>

	<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />

	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
	<!--
	<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
	<script type="text/javascript" src="js/facebox.js"></script>
	<script type="text/javascript" src="js/jquery.wysiwyg.js"></script>
	-->
	<script type="text/javascript" src="js/me.js"></script>
	<script type="text/javascript" src="js/relationRuleEdit.js"></script>
	<script type="text/javascript">
	   $(function(){  
// 	     initObjectInfoSelect();
	     initRelationObjInfoSelect();
	     listHistoryRelationRule(1);
	     
	     //新增事件
	     $("#add").click(function(){
	         var PType=$("#PType").val();
	         var NType=$("#NType").val();
	         var pid = PType.substring(0,PType.indexOf("_"));
	         var nid = NType.substring(0,PType.indexOf("_"));
	         var ptype = PType.substring(PType.indexOf("_")+1);
	         var ntype = NType.substring(NType.indexOf("_")+1);
	         var _date = $("#relationRule").serialize();
	         var warnNotice="";
	         if(PType==""){
	            warnNotice+="请选择上级联对象！\n";
	         }
	         if(NType==""){
	            warnNotice+="请选择下级联对象！\n";
	         }
	         if(warnNotice!=""){
	           alert(warnNotice);
	         }else{
	           var isExist=isExistsRelationRule();
	           if(!isExist){
	              alert("该配置规则已存在！");
	           }else{
	                $.ajax({
			        type: 'POST',
					url: '<%=basePath%>relationRule/api/save',
					data:{
						'pid':pid,
						'nid':nid,
						'ptype':ptype,
						'ntype':ntype,
						'sort':sort,
						'type':$("#type").val(),
					},
					dataType:'json',
					error:function(){alert('系统连接失败，请稍后再试！')},
					success: function(data){
						if(data.success==true){
						   alert("新增成功！");
						   listHistoryRelationRule(1);
						}
					}	 
			      });
	           }
	         } 
	     });
	     
	   });
	</script>
</head>

<body id="关联规则配置-form">
<div id="main-content">
	<div class="clear"></div>
	<div class="content-box">
		<div class="content-box-content">
			<div class="content-box-header">
				<h3>&nbsp;关联规则配置</h3>
				<div class="clear"></div>
			</div>
	        
	        <form id="relationRule">
	        <input type="hidden" name="sort" id="sort" value="id desc"/>
			<table id="table1" border="0">
				<tbody>
					<tr>
						<td>上级联对象
						    <select id="PType" name="ptype">
						    </select>
						</td>
						<td>
						           下级联对象 
						    <select id="NType" name="ntype">
						    </select>
						</td>
						<td>
						   <input type="button" name="add" id="add" value="新增"/>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
						     <input type="text" id="type"  name="type"  value="${type}"/>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		    <div style="height: 20px"></div>
		     &nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="javascript:showQuery()">查询条件</a>
              <div style="height: 180px;display: none;" id="query">
                 <form id="query">
	                  <table >
	                    <thead></thead>
	                    <tbody>
	                      <tr>
	                          <td>上级联对象</td>
	                          <td><input type="text"  id="pType" class="text-input small-input"/></td>
	                          <td></td>
	                          <td></td>
	                      </tr>
	                       <tr>
	                          <td>下级联对象</td>
	                          <td><input type="text"  id="nType" class="text-input small-input"/></td>
	                          <td></td>
	                          <td></td>
	                      </tr>
	                      <tr>
	                          <td colspan="2">
	                              <input type="button" value="检索" name="retrieval" id="retrieval" onclick="retrievalList()"/>
	                              &nbsp;&nbsp;&nbsp;
	                              <input type="reset" value="重置"/>
	                          </td>
	                          <td></td>
	                          <td></td>
	                      </tr>
	                     </tbody>
	                     <tfoot></tfoot>
	                </table>
                </form>
              </div>   
             
		    <table id="relationRuleHistoryData">
		        <thead>
		           <tr>
		              <td colspan="6"><h3>&nbsp;&nbsp;&nbsp;历史配置规则</h3></td>
		           </tr>
		           <tr style="background-color: #D8C655">
		              <th><img src="images/icons2/flag_16.png"/></th>
		              <th>序号</th>
		              <th>上级联对象</th>
		              <th>下级联对象</th>
		              <th>配置规则类型</th>
		              <th>操作</th>
		           </tr>
		        </thead>
		        <tbody></tbody>
		        <tfoot>
		           <tr>
		              <td>
		                 <input type="button" value="全选"  id="allSelect" onclick="allSelect(this)"/>
		                 <input type="button" value="确认删除" onclick="delAllSelect()"/>
		              </td>
		              <td colspan="5" align="right">
			                <div class="pagination" id="paginationHistory"></div>
		              </td>
		           </tr>
		        </tfoot>
		    </table>
		</div>
		    
	</div>
	<div class="clear"></div>
	<div id="footer">
		<small>
			Powered by <a href="#" target="_blank">lsf</a> | <a href="mailto:mengjie@wondersgroup.com">联系我</a>
		</small>
	</div>
</div>
</body>
</html>
