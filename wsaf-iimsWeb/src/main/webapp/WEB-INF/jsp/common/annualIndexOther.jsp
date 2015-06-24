<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>合同管理首页</title>
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
	<script src="js/annual.js"></script>
    <script type="text/javascript">
		$(document).ready(function () {
			$(".pt45").css("width","1696px");
			$(".main").css("width","1696px");
			$.tab();
			$("#searchbtn").click(function(){ 
				$.postSearchFormIndex_11("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
				$.postSearchFormIndex_22("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
				$.postSearchFormIndex_33("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
	        	  
	        $("#renewbtn").click(function(){ 
				$("#projectAppform input,#projectAppform select").not("input[type=button]").val("");
				$.postSearchFormIndex_11("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
				$.postSearchFormIndex_22("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
				$.postSearchFormIndex_33("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			});
			
			$.postSearchFormIndex_11("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			$.postSearchFormIndex_22("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			$.postSearchFormIndex_33("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
			
			window.onfocus = function(){
				  		
				  $.postSearchFormIndex_11("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
				  $.postSearchFormIndex_22("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
				  $.postSearchFormIndex_33("${pageContext.request.contextPath}","&pageSize=16&pageNum=1");
				  $("[name=edit]").css("display","none");	  	
		      };
		      
		      $(".closewindow").click(function(){
					$(".f_window").css("display","none");
					$("#bt").css("display","none");
				});
		      
		      $("[name=delete]").css("display","none");
				$("[name=add]").css("display","none");
				$("[name=edit]").css("display","none");
		     
		});
		function addService(firUrl){
			if($("#special").attr("class")=="selected"){
				$("#bt").height($(document).height());
		   	 	$(".f_window").css("margin-top",($(window).height() - $('.f_window').outerHeight())/2 + $(document).scrollTop());
		    	$(".f_window").css("margin-left",($(window).width() - $('.f_window').outerWidth())/2);
				$(".f_window").css("display","block");
				$("#bt").css("display","block");
				$("#btnSubmit2").click(function(){
					var otherData = "&year=" + $("[name=year]").val();
					var specialId = $.postsaveSpecial("${pageContext.request.contextPath}","",otherData);
					$(".f_window").css("display","none");
					$("#bt").css("display","none");
					window.open("/iims/special/specialAdd?specialId="+specialId);
					
				});
					
				
		    }else{
				window.open("/iims/annualCost/annualCostAddService");
		    }
		};
		function del(id){
			$.postDele("${pageContext.request.contextPath}",id);
		};
		
	</script>
  
</head>

<body class="Flow">
 <div class="f_window" style="display:none">

   	  <h3 class="clearfix mb10"><span class="fl">填写信息</span><div class="fr close"><a class="closewindow">关闭窗口</a></div></h3>

        <div class="con">

        	<table width="100%" border="0" cellspacing="0" cellpadding="0">

              <tr>

                <td class="td_1" colspan="2">年度</td>

              </tr>


              <tr>

                <td class="td_1">&nbsp;</td>

                <td><input  name="year"  placeholder="请输入年度" ></input></td>

              </tr>


              
            </table>

      </div>

      <div class="button t_c">

        	<input readonly type="button" id="btnSubmit2" value="确认" />



        </div>

    </div>
	<div class="main">
	 
		<div class="ctrl clearfix nwarp">
        	<div class="fl"><img src="css/default/images/sideBar_arrow_left.jpg" width="46" height="30" alt="收起"></div>
                <div class="posi fl nwarp">
            	   <ul>
                	  <li><a>首页</a></li>
                	  <li><a>信息管理</a></li>
                      <li><a>日常管理</a></li>
                	  <li class="fin">合同管理</li>
                    </ul>
                  </div>
   		    </div> 
        <div class="pt45">
		
         
                    <div class="tabs_2">
                        <ul>
                             <li id="service" class="selected"><a><span>年度成本（维保公司）</span></a></li>
                            <li id="organ"><a><span>年度成本（集团本部）</span></a></li>
                            <li id="special"><a><span>年度专项费用</span></a></li>
                        </ul>
        			</div>
                
          
      <div class="filter">
        	<div class="query">
            	<div class="filter_search p8"><!--这里根据内容做样式调整。1、筛选：filter_sandglass 2、搜索filter_search 3、提示：.filter_tips 背景图会改变。-->
                 <form id="projectAppform">
                  <table class="nwarp" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="t_r">计划年度</td>
                      <td><input  type="text"  id="lreportUnit" class="input_large" name="year"/></td>
                   	  
                      <tr>
                      <td colspan="10" class="t_c">
                       <input type="button"  id="searchbtn" value="搜 索" />&nbsp;<input type="button" id="renewbtn" value="重 置" />
                       </td>
                      </tr>
                    </table>
                </form>
            </div>
        </div>
         
        <div class="fn clearfix" >
           <!--xinxi-->
           <div class="fr">
           	 <input type="text" name="year" placeholder="请输入年度" style="display:none">
             <input type="button" id="addbtn" name="add" value="新 增"  onclick="addService();" >
             </div>
         </div>
      </div>
        <!--Filter End-->
        <!--Table-->
        <!-- 年度成本（维保公司） -->
        <div class="mb10" id="mb10_1" style="display:inline">
        	<table width="100%"  class="table_1" id="tableService" >
                <tbody>
                   <tr class="tit">
                       <td class="sort"><a><span class="fl">序号</span></a></td>
                       <td class="sort"><a><span class="fl">年度</span></a></td>
                       <td class="sort"><a ><span class="fl">总计预算金额</span></a></td>
                       <td class="sort"><a ><span class="fl">总计已签订合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">总计已支付合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">投资完成率</span></a></td>
                       <td class="sort"><a ><span class="fl">资金支付率</span></a></td>   
                       <td class="sort"><a ><span class="fl">总计未签订合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">总计未支付合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">操作</span></a></td>                      
                   </tr>
                 </tbody>
                  <tr class="tfoot">
                                <td colspan="10">
                        <div class="clearfix">
                            <span class="fl">当前无记录显示</span>
                            <ul id="page" class="fr clearfix pager">
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
        
        
        <!-- 年度成本（集团本部） -->
        <div class="mb10" id="mb10_2" style="display:none">
        	<table width="100%"  class="table_1" id="tableOrgan">
                <tbody>
                   <tr class="tit">
                       <td class="sort"><a><span class="fl">序号</span></a></td>
                       <td class="sort"><a><span class="fl">年度</span></a></td>
                       <td class="sort"><a ><span class="fl">总计预算金额</span></a></td>
                       <td class="sort"><a ><span class="fl">总计已签订合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">总计已支付合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">投资完成率</span></a></td>
                       <td class="sort"><a ><span class="fl">资金支付率</span></a></td>   
                       <td class="sort"><a ><span class="fl">总计未签订合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">总计未支付合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">操作</span></a></td>                      
                   </tr>
                 </tbody>
                  <tr class="tfoot">
                                <td colspan="10">
                        <div class="clearfix">
                            <span class="fl">当前无记录显示</span>
                            <ul id="page" class="fr clearfix pager">
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
      
      
      <!-- 年度专项费用 -->
      <div class="mb10" id="mb10_3" style="display:none">
        	<table width="100%"  class="table_1" id="tableSpecial">
                <tbody>
                   <tr class="tit">
                       <td class="sort"><a><span class="fl">序号</span></a></td>
                       <td class="sort"><a><span class="fl">年度</span></a></td>
                       <td class="sort"><a ><span class="fl">当年计划上报项目预算</span></a></td>
                       <td class="sort"><a ><span class="fl">当年已批复项目预算</span></a></td>
                       <td class="sort"><a ><span class="fl">当年未批复项目预算</span></a></td>
                       <td class="sort"><a ><span class="fl">批复率</span></a></td>
                       <td class="sort"><a ><span class="fl">去年项目资金预算</span></a></td>
                       <td class="sort"><a ><span class="fl">当年项目资金预算</span></a></td>
                       <td class="sort"><a ><span class="fl">当年计划签订合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">当年已签订合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">当年未签订合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">签订率</span></a></td>
                       <td class="sort"><a ><span class="fl">应支付合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">已支付合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">未支付合同金额</span></a></td>
                       <td class="sort"><a ><span class="fl">支付率</span></a></td>
                       <td class="sort"><a ><span class="fl">操作</span></a></td>
                       <td class="sort"><a ><span class="fl"></span></a></td>                      
                   </tr>
                 </tbody>
                  <tr class="tfoot">
                                <td colspan="18">
                        <div class="clearfix">
                            <span class="fl">当前无记录显示</span>
                            <ul id="page" class="fr clearfix pager">
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
      
     </div>
</div>
</body>
</html>
