<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="描述">
  <meta name="keywords" content="关键词">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>一方池塘诗词鉴赏系统</title>

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="/chuantongwenhuakpsys/resource/web/image/png" href="/chuantongwenhuakpsys/resource/web/i/favicon.png">

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="/chuantongwenhuakpsys/resource/web/i/app-icon72x72@2x.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="/chuantongwenhuakpsys/resource/web/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">
  
  <!-- css -->
  <link rel="stylesheet" href="/chuantongwenhuakpsys/resource/web/css/doysu.min.css">
  <link rel="stylesheet" href="/chuantongwenhuakpsys/resource/web/css/base.css">
 <link rel="stylesheet" href="/chuantongwenhuakpsys/resource/web/css/app.css">
 <link rel="stylesheet" href="/chuantongwenhuakpsys/resource/css/tips.css" type="text/css"/>
 <script src="/chuantongwenhuakpsys/resource/web/js/jquery.min.js"></script>
  <script src="<%=path %>/layer/jquery-2.0.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path %>/layer/layer.js"></script>
 <script>

function saveCart(){
	document.getElementById("cartForm").submit();
}
//弹出框
var nId=null;
function showDialog(id){
	nId=id;
	$('#tip_newComment').show();
}
//取消弹出框
function cancel(){
	 var comment= $("#comment").val('');
	$('#tip_newComment').hide();
}

</script>
</head>
<body>
<% 
HashMap mmm = (HashMap)session.getAttribute("member");
String id = request.getParameter("id");
CommDAO dao = new CommDAO();
HashMap ac = (HashMap)dao.select("select * from feiyi where id="+id).get(0);
String filename[] = ac.get("filename").toString().split(","); 
%>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，手机网站一些效果暂不支持。 请 <a
  href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
<jsp:include page="menu.jsp"></jsp:include>
  <!--content-->
  <div class="dy-container">

    <ol class="dy-breadcrumb">
      <li><a href="/chuantongwenhuakpsys/index.jsp" class="dy-icon-home">首页</a></li>
      <li class="dy-active">美图详情</li>
    </ol>

    <div class="dy-g">
      <div class="dy-u-md-8 dy-u-sm-12" style="width: 1100px;">
          <div class="tf-content" >
          <div style="text-align: center;">
              <h1 class="tf-title" style="margin-top: 10px;"><%=ac.get("title") %></h1>
              <p class="tf-icon">
                  <span class="dy-icon-clock-o"></span><%=ac.get("savetime") %>&nbsp;&nbsp;
                  
                 <!--   <span class="dy-icon-eye"></span> 1,012-->
               </p>
               <img  alt="" src="/chuantongwenhuakpsys/upfile/<%=filename[0] %>" onclick="selectphoto('<%=ac.get("id") %>')" style="width: 660px;height: 300px;">
               </div>
          </div>
      </div>
      
  <!-- e -->

      </div>
    </div>
  			<!-- 弹框-新增评论-->
  <!--content end-->

  <jsp:include page="footer.jsp"></jsp:include>

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/chuantongwenhuakpsys/resource/web/js/jquery.min.js"></script>
<script src="/chuantongwenhuakpsys/resource/web/js/doysu.min.js"></script>
<!--<![endif]-->
<script src="/chuantongwenhuakpsys/resource/web/js/app.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/layer/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/layer/layer.js"></script>
  <script>
  $(function(){
	  $('.dy-nav.dy-nav-pills.dy-topbar-nav li').removeClass('dy-active');
	  $('.dy-nav.dy-nav-pills.dy-topbar-nav li:nth-child(2)').addClass('dy-active')
  })
  </script>
</body>
 <script type="text/javascript">
    <%String suc= (String)request.getAttribute("suc");
    if(suc!=null){%>
    	layer.msg('<%=suc %>');   
    <%}%>
    </script>
    <script type="text/javascript">

function selectphoto(id){
	$.getJSON('/chuantongwenhuakpsys/chuantongwenhuakpsys?ac=selectPhoto&id='+id, function(msg){
		  layer.photos({
			  area: ['800px','500px'],
		    photos: {
				  "title": "今日天气晴朗,庐山一日游", //相册标题
				  "id": 123, //相册id
				  "start": 0, //初始显示的图片序号，默认0
				  "data":eval(msg)
				}
			//格式见API文档手册页img/xc_img3.jpg
		    ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机
		  });
		});
}


</script>
</html>
