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
 <script type="text/javascript" src="/chuantongwenhuakpsys/layer/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/layer/layer.js"></script>
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
<style type="text/css">
    input::-webkit-input-placeholder {
        /* placeholder颜色  */
        color: #aab2bd;
         /* placeholder字体大小  */
         font-size: 12px;
         
         /* placeholder位置  */
         text-align: left;
         padding-left: 20px;
     }
     
     
     textarea::-webkit-input-placeholder {
        /* placeholder颜色  */
        color: #aab2bd;
         /* placeholder字体大小  */
         font-size: 12px;
         
         /* placeholder位置  */
         text-align: left;
         padding-left: 20px;
     }
</style>

</head>
<body>
<% 
CommDAO dao = new CommDAO();
HashMap member = (HashMap)session.getAttribute("member");
ArrayList<HashMap> list = (ArrayList<HashMap>)dao.select("select * from chat where 1=1 order by savetime desc");
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
      <li class="dy-active">在线留言</li>
    </ol>

    <div class="dy-g">
      <div class="dy-u-md-8 dy-u-sm-12">
          <div class="tf-content" style="border:0px solid red">
              <h1 class="tf-title" style="border-bottom: 2px solid #198CC1;color: #198CC1">在线留言</h1>
              <%
              for(HashMap chat:list){ 
            	  HashMap mmm = (HashMap)dao.select("select * from member where id="+chat.get("mid")).get(0);
              %>
              <div style="font-size:12px;">
              <p class="tf-icon">
                  <span ></span>留言人&nbsp;&nbsp;:&nbsp;&nbsp;<%=mmm.get("tname") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <span class="dy-icon-clock-o"></span>&nbsp;&nbsp;时间&nbsp;&nbsp;:<%=chat.get("savetime") %>
               </p>
               <div class="neirong">
                    <%=chat.get("content") %>
               </div>
               <%if(!chat.get("hfcontent").equals("")){
            	   %>
               <div class="neirong" style="border-bottom: 2px solid #cccccc;">
               <div class="neirong">
                    <span style="color: black;font-weight: bold;">[回复内容]</span>&nbsp;&nbsp;&nbsp;&nbsp;<%=chat.get("hfcontent") %>
               </div>
               </div>
               <%} %>
               </div>
               <%} %>
               
               <form action="<%=path %><%=path %>?ac=chatAdd&mid=<%=member.get("id") %>" method="post">
               <div  style="border:px solid blue;margin-top: 300px;color:#aab2bd">
                 <ul>
                   <li style="margin-top: 10px;"><textarea rows="" cols="" placeholder="内容" name="content" required style="width: 300px;height: 70px;border-radius:3px 3px;border-color: #cccccc"></textarea></li>
                 </ul>
                 <ul>
                   <li style="margin-top: 10px;"><input type="submit" value="提交" style="width: 80px;height: 40px;color:white;border-radius:3px 3px; border-color:#198CC1; background: #198CC1" ></li>
                 </ul>
               </div>
               </form>
          </div>
      </div>
  <!-- e -->

      </div>
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
  <script>
  $(function(){
	  $('.dy-nav.dy-nav-pills.dy-topbar-nav li').removeClass('dy-active');
	  $('.dy-nav.dy-nav-pills.dy-topbar-nav li:nth-child(2)').addClass('dy-active')
  })
  
  <%
  String suc = (String)request.getAttribute("suc");
  if(suc!=null){
  %>
  layer.msg('<%=suc%>');
  <%}%>
  
  </script>
</body>
</html>
