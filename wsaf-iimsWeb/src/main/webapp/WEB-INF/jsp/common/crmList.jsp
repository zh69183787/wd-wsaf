<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title>上海申通地铁集团信息管理_设备台帐</title>
<meta charset="utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/formalize.css" />
<link rel="stylesheet" href="css/page.css" />
<link rel="stylesheet" href="css/default/imgs.css" />
<link rel="stylesheet" href="css/reset.css" />
<link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css"
	rel="stylesheet" />

<script src="js/html5.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script src="js/jquery.formalize.js"></script>
<script src="js/json2.js"></script>
<script src="js/projectPlan.js"></script>
<script src="js/crmList.js"></script>

<script type="text/javascript">
    $(function(){
       searchForm(1);
       initDeptSelect();
       
       $("#searchbtn").click(function(){
           searchForm(1);
       });
       
	});
   
</script>
<script src="js/equipMent.js"></script>
<style type="text/css">
	.red{
	 color: red;
	}
	.main{
	  height:100%;
	}
</style>
</head>
<body>
	<div class="main">
		<!--Ctrl-->
		<div class="ctrl clearfix nwarp">
			<div class="fl">
				<img src="css/default/images/sideBar_arrow_left.jpg" width="46"
					height="30" alt="收起">
			</div>
			<div class="posi fl nwarp">
				<ul>
					<li><a href="#">首页</a>
					</li>
					<li><a href="#">运维和质量管理</a>
					</li>
					<li class="fin">CRM设备台账</li>
				</ul>
			</div>
		</div>
		<!--Ctrl End-->
		<div class="pt45">
			<!--Filter-->
			<form id="searchform">
			<div class="filter">
				<div class="query">
					<div class="filter_search p8">
						<!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
						
							<table class="nwarp" width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tbody>
								    <tr><td colspan="6" ><p align="center">上海地铁PC终端设备台帐</p></td></tr>
								    <tr><td colspan="6" ></td></tr>
								    <tr><td colspan="6" ></td></tr>
								    <tr><td colspan="6" ></td></tr>
									<tr>
									  <td colspan="6">
									      <select style="width:200px;" name="dept" id="dept">
									          <option value="全部单位">全部单位</option>
									      </select>
									       <select name="sortItem" id="sortItem">
									          <option value="serialNo" selected="selected">设备编号</option>
									          <option value="department2">部门</option>
									          <option value="coreFire">cpu主频</option>
									          <option value="ram">内存容量</option>
									          <option value="hdSize">硬盘容量</option>
									          <option value="screenSize">显示器尺寸</option>   
									       </select>
									       <select name="sortStyle" id="sortStyle">
									          <option value="asc" selected="selected">升序</option>
									          <option value="desc">降序</option>
									      </select>
									      <input type="button"id="searchbtn" value="搜索" /> &nbsp; <input type="reset"id="renewbtn" value="重 置" />
									  </td>
							        </tr>
								</tbody>
							</table>
						
					</div>
				</div>
			</div>
			<!--Filter End-->
			<!--Table-->
			
			<div class="mb10">
				<table width="100%"  class="table_1" id="maintable">
					<thead>
						<tr style="background-color: #F1F1F4">
							<td rowspan="3" style="vertical-align:middle;"><span class="fl">序号</span><i></i></td>
							<td rowspan="3" style="vertical-align:middle;"><span class="fl">设备编号</span><i></i></td>
							<td  rowspan="3" style="vertical-align:middle;"><span class="fl">资产编号</span><i></i></td>
							<td colspan="4"><span class="fl">使用信息</span><i></i></td>
							<td colspan="2"><span class="fl">产品信息</span><i></i></td>
							<td colspan="6"><span class="fl">硬件配置</span><i></i></td>
							<td rowspan="2" style="vertical-align:middle;"><span class="fl">软件配置</span><i></i></td>
						</tr>
						<tr style="background-color: #F1F1F4">
						    <td rowspan="2">单位</td>
						    <td rowspan="2">部门</td>
						    <td rowspan="2">使用人</td>
						    <td rowspan="2">电话</td>
						    <td rowspan="2">品牌</td>
						    <td rowspan="2">型号</td>
						    <td>CPU</td>
						    <td>内存</td>
						    <td>硬盘</td>
						    <td>显示器</td>
						    <td colspan="2">网络</td>
						</tr>
						<tr style="background-color: #F1F1F4">
						    <td>主频</td>
						    <td>容量</td>
						    <td>容量</td>
						    <td>尺寸</td>
						    <td>mac地址</td>
						    <td>ip地址</td>
						    <td>操作系统</td>
						</tr>
					</thead>
					<tbody>
					   
					</tbody>
					<tfoot>
						<tr class="tfoot">
							<td colspan="17">
								<div class="clearfix">
									<span class="fl"></span>
									<ul id="page" class="fr clearfix pager"></ul>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>

			</div> 
			</form>
<!-- 			<div style="height: 430px;background-color: white"></div> -->
			<!--Table End-->
		</div>
	</div>
</body>
</html>
