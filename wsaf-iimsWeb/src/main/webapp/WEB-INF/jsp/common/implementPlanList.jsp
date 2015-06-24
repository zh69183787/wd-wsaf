<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>实施计划</title>
    <meta charset="utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <meta http-equiv="X-UA-Compatible" content="IE=8" />
	
    <link rel="stylesheet" href="css/formalize.css" />
    <link rel="stylesheet" href="css/page.css" />
    <link rel="stylesheet" href="css/default/imgs.css" />
    <link rel="stylesheet" href="css/reset.css" />
    <link type="text/css" href="css/flick/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
	
	<script src="js/html5.js"></script>
	<script src="js/jquery-1.7.1.min.js"></script>
	<script src="js/jquery-ui-1.8.18.custom.min.js"></script>
	<script src="js/jquery.formalize.js"></script>
	<script src="js/json2.js"></script>
	<script src="js/wirelessAccounting.js"></script>
    <script type="text/javascript">
		 $(document).ready(function () {
			 
//        	$.postSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
//        	window.onfocus = function(){
//        		var _page="1";
//        		if($(".selected a").length>0&&$(".selected a").text()!="")
//        			_page=$(".selected a").text();
//        		
//              $.postSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum="+_page); 
//          	 };
//        	$("#searchbtn").click(function(){ 		
//				$.postSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
//			});
        	  
//        	$("#renewbtn").click(function(){ 
//				$("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
//				$.postSearchForm("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
//			});
			
        	}); 	
		function add(firUrl){
			window.open("/iims/wirelessResourceBook/wirelessNetAdd");
		}
		
		function close(){
			var b = document.getElementById("iframe_gx");
			 b.style.display="none";
			}
			function open2(id){
				var a = document.getElementById("iframe_gx");
				a.style.display="";
				//$.findById("${pageContext.request.contextPath}",id);
				}
			function del(id){
				$.delById("${pageContext.request.contextPath}",id);
				}
			function save(id){
				var otherData="&status=finish";
           		 otherData+="&id="+id;
				$.postsave("${pageContext.request.contextPath}","targetPlan",otherData);
			}

		
	</script>
  
</head>

<body class="Flow">
<form id="targetPlan">
   <div id="iframe_gx"  class="f_window" style="width:690px;  display:none;  margin:10% 25% 0 25%;" >

   <div class="con">
   
   
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_2" id="table3">
<thead><th colspan="4"><h5 class="fl">实施计划填写</h5><span class="fr pt5 mr5"><a href="javascript:close();" >关闭</a></span></th></thead>
<tbody id="tb2">
	<tr>
		<td class="lableTd t_r">项目类型</td>
		<td>
			<select name="">
				<option value="">请选择</option>
			</select>
		</td>
		<td class="lableTd t_r">业务层级</td>
		<td>
			<select name="">
				<option value="">请选择</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="lableTd t_r">项目编号</td>
		<td><input name="" type="text" class="input_large" /></td>
		<td class="lableTd t_r">项目名称</td>
		<td><input name="" type="text" class="input_large" /></td>
	</tr>
	<tr>
		<td class="lableTd t_r">项目描述</td>
		<td><textarea name=""></textarea></td>
		<td class="lableTd t_r">实施内容</td>
		<td><textarea name=""></textarea></td>
	</tr>
	<tr>
		<td class="lableTd t_r">启动时间</td>
		<td><input name="" type="text" class="input_large" /></td>
		<td class="lableTd t_r">建设周期</td>
		<td><input name="" type="text" class="input_large" /></td>
	</tr>
	<tr>
		<td class="lableTd t_r">投资估算</td>
		<td><input name="" type="text" class="input_large" /></td>
		<td class="lableTd t_r">资金计划</td>
		<td><input name="" type="text" class="input_large" /></td>
	</tr>
	<tr>
		<td class="lableTd t_r">实施主体</td>
		<td>
			<select name="">
				<option value="">请选择</option>
			</select>
		</td>
		<td class="lableTd t_r">建议费用性质</td>
		<td>
			<select name="">
				<option value="">请选择</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="lableTd t_r">责任单位</td>
		<td>
			<select name="">
				<option value="">请选择</option>
			</select>
		</td>
		<td class="lableTd t_r">分管领导</td>
		<td>
			<select name="">
				<option value="">请选择</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="lableTd t_r">责任人</td>
		<td>
			<select name="">
				<option value="">请选择</option>
			</select>
		</td>
		<td class="lableTd t_r">项目目标</td>
		<td>
			<input name="" type="text" class="input_large" />
		</td>
	</tr>
	<tr>
		<td class="lableTd t_r">年度推进目标</td>
		<td>
			<select name="">
				<option value="">请选择</option>
			</select>
		</td>
		<td class="lableTd t_r">备注</td>
		<td>
			<textarea name=""></textarea>
		</td>
	</tr>

</tbody>
	                           
</table>
      </div>
	<div class="button t_c" id="div1">
	<input type='submit' value='保 存' onclick=""/>
            </div>
        </div>

    </form>
	




	<div class="main">
	 
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
                <div class="posi fl nwarp">
            	   <ul>
                	  <li><a>首页</a></li>
                	  <li><a>项目进度管理</a></li>
                	  <li class="fin">实施计划</li>
                    </ul>
                  </div>
   		    </div> 
        <div class="pt45">
		
         
                    <div class="tabs_2">
                        <ul>
                            <li><a><span>年度实施计划</span></a></li>
                            <!--
                            <li><a href="/iims/netResourceBook/netAccounting"><span>网络接入台帐</span></a></li>
                            <li><a href="/iims/accountResourceBook/accountAccounting"><span>系统账户台帐</span></a></li>
                            <li><a href="/iims/vpnResourceBook/vpnAccounting"><span>VPN台帐</span></a></li>
                            <li><a href="/iims/internetResourceBook/internetAccounting"><span>特定互联网台帐</span></a></li>
                            <li><a href="/iims/virtualResourceBook/virtualAccounting"><span>虚拟化资源台帐</span></a></li>
                              -->
                            
                        </ul>
        			</div>
                
          
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                 <form id="projectAppform">
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                    	<td class="t_r">年度</td>
                      	<td><input  type="text" class="input_large" name="year"/></td>
                      	
                       <td><input type="button"  id="searchbtn" value="搜 索" />&nbsp;<input type="button" id="renewbtn" value="重 置" /></td>
                     
                    </tr>
                    </table>
                </form>
            </div>
        </div>
         
        <div class="fn clearfix">
        	 <h5 class="fl"><a class="fl">实施计划申报表</a></h5>
           <!--xinxi-->
             <input type="button" id="outBtn" value="导 出" onclick="add()" class="fr" style="margin:0 15px">   &nbsp;
             
         </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <div class="mb10">
        	<table width="100%"  class="table_1" id="table1">
                <tbody>
                   <tr class="tit">
                       <td class="sort"><a><span class="fl">序号</span></a></td>
                       <td class="sort"><a><span class="fl">年度</span></a></td>
                       <td class="sort"><a ><span class="fl">计划名称</span></a></td>
                       <td class="sort"><a ><span class="fl">编制单位</span></a></td>
                       <td class="sort"><a ><span class="fl">编制人</span></a></td>
                       <td class="sort"><a ><span class="fl">状态</span></a></td>
                       <td class="sort"><a ><span class="fl">操作</span></a></td>
                   </tr>
                   <tr class="tableItem">
                   	   <td>1</td>
                       <td>2015</td>
                       <td>2015信息化项目实施推进计划</td>
                       <td>信息管理中心</td>
                       <td>胡波</td>
                       <td>待填报</td>
                       <td>
                       	<input type="button" value="详 情" id="detail" onclick="open2()">
                       	<input type="button" value="编 辑" id="edit">
                       	<input type="button" value="删 除" id="delete">
                       </td>
                   </tr>
                 </tbody>
                  <tr class="tfoot">
                                <td colspan="7">
                        <div class="clearfix">
                            <span class="fl">共0条记录，当前显示0条</span>
                            <ul class="fr clearfix pager">
                              <li>Pages:1/1
                                  <input type="number" id="number" name="number" min="0" max="999" step="1" class="input_tiny" />
                                  <input type="submit" name="button" id="button" value="Go">
                                </li>
                                <li><a>&gt;&gt;</a></li>
                              
                                <li class="selected"><a>1</a></li>
                                <li><a>&lt;&lt;</a></li>
                            </ul>
                        </div>
                                </td>
                              </tr>
           </table>
      </div>
        <!--Table End-->
     </div>
</div>
</body>
</html>
