<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
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
</head>
<body>
<%
CommDAO dao = new CommDAO();
String hql="select * from news where 1=1 ";
String url="/chuantongwenhuakpsys/newslistqt.jsp";
String f = request.getParameter("f");
String key = request.getParameter("key")==null?"":request.getParameter("key");
if(f!=null){
key=Info.getUTFStr(key);
}
if(!key.equals("")){
hql+=" and jieduan like '%"+key+"%'";
url+="&key="+key;
}
hql+="  order by savetime desc";
PageManager pageManager = PageManager.getPage(url,10, request);
pageManager.doList(hql);
PageManager bean= (PageManager)request.getAttribute("page");
ArrayList<HashMap> alist=( ArrayList<HashMap>)bean.getCollection();
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
      <li><a href="index.jsp" class="dy-icon-home">首页</a></li>
      <li class="dy-active">站内新闻</li>
    </ol>
    
   <div class="dy-g" style="border:0px solid red;min-height: 330px; ">
      <div class="dy-u-md-12 dy-u-sm-12 tf-lists">
      <!-- 循环 -->
      <%for(HashMap av:alist){ %>
          <div class="dy-cf item">
            <a title="" href="/chuantongwenhuakpsys/news_findByNewsId.do">
              <div class="dy-u-sm-12 dy-u-md-12">
              <div class="jd-item-left">
              </div>
              <div class="jd-item-right">
             	 <h1 style="overflow:hidden;"><a href="/chuantongwenhuakpsys/newscx.jsp?id=<%=av.get("id") %>" class="jd-item-title"><%=av.get("title") %></a>
             	 
             	 <div class="jd-item-date" > <span > <span class="dy-icon-clock-o"></span> <%=av.get("savetime") %> </div>
             	 
             	
             	 </h1>
<%--                   <p>${news.content}</p> --%>
              </div>
                  
              </div>
            </a>
          </div>
          <%} %>
          <!-- 循环结束 -->
      </div>
    </div>
       <div class="panel-foot text-center" style="text-align: center;">
       ${page.info }
       </div>
  </div>
  <!--content end-->

  <jsp:include page="footer.jsp"></jsp:include>

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/chuantongwenhuakpsys/resource/web/js/jquery.min.js"></script>
<script src="/chuantongwenhuakpsys/resource/web/js/doysu.min.js"></script>
<!--<![endif]-->
<script src="/chuantongwenhuakpsys/resource/web/js/app.js"></script>
</body>
</html>
