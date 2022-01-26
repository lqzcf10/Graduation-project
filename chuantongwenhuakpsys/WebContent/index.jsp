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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>首页</title>
<!-- Set render engine for 360 browser -->
<meta name="renderer" content="webkit">

<!-- No Baidu Siteapp-->
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="icon" type="image/png" href="i/favicon.png">

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="i/app-icon72x72@2x.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="apple-touch-icon-precomposed" href="i/app-icon72x72@2x.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage" content="app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#0e90d2">

<!-- css -->
<link rel="stylesheet" href="/chuantongwenhuakpsys/resource/web/css/doysu.min.css">
<link rel="stylesheet" href="/chuantongwenhuakpsys/resource/web/css/base.css">
<link rel="stylesheet" href="/chuantongwenhuakpsys/resource/web/css/app.css">
<link rel="stylesheet" href="/chuantongwenhuakpsys/css/font-awesome.css">
</head>
<body>
<%
CommDAO dao = new CommDAO();
ArrayList<HashMap> imglist = (ArrayList<HashMap>)dao.select("select * from img where 1=1 ");
ArrayList<HashMap> ilist = (ArrayList<HashMap>)dao.select("select * from news where 1=1 ");
ArrayList<HashMap> rdlist = (ArrayList<HashMap>)dao.select("select * from feiyi where 1=1  order by savetime desc");
%>
	<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，手机网站一些效果暂不支持。 请 <a
  href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
	<%--<%@ include file="menu.jsp"%>
	--%>
	<jsp:include page="menu.jsp"></jsp:include>
	<!--banner-->
	<div id="banner" class="dy-container">
	<!-- 查找form在这里 -->
	<!-- 查找form在这里 -->
	</div>
	<div id="banner" class="dy-container">
		<div class="dy-g">
			<div class="dy-u-md-8 dy-u-sm-12">
				<div class="dy-padding1 dy-bac-fff">
					<div data-dy-widget="slider" class="dy-slider dy-slider-c2"
						data-dy-slider='{&quot;directionNav&quot;:false}'>
						<ul class="dy-slides">
						<%for(HashMap map:imglist){ %>
								<li>
								<img src="/chuantongwenhuakpsys/upfile/<%=map.get("filename") %>"  height="295" alt="">
								</li>
						<%} %>
						</ul>
					</div>
				</div>
			</div>
			<div class="dy-u-md-4 dy-u-sm-12">
				<div class="dy-bac-fff dy-padding picc">
					<div class="dy-g" >
						<div class="dy-u-md-12 dy-u-sm-6" style="height: 295px;">
							<dl>
								<dt style="font-size:120%;">
									<a class="dy-text-center" href=""><span class="dy-icon-list"></span></a>&nbsp;&nbsp;站内新闻
								</dt>
								<%
								int a =0;
								for(HashMap note:ilist){ 
								a++;
								if(a==9){break;}
								%>
								<dd style="line-height: 30px;">
								  <p style="font-size:12px;">
								    <a href="newscx.jsp?id=<%=note.get("id") %>"><%=note.get("title") %></a>
								  </p>
							    </dd>
							    <%} %>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="banner" class="dy-container" style=" margin-bottom: 10px;border-bottom: 2px solid gray;">
    <a href="" >
			<span style="font-size: 20px;"><strong>诗词美图</strong></span>
			</a>
	</div>
	<!--公告-->
	<div id="news" class="dy-container">
		<div class="dy-g news" style="border:0px solid red">
		<!-- 循环 -->
		<%
		int i=0;
		for(HashMap map:rdlist){ 
		i++;
		String filename[] = map.get("filename").toString().split(","); 
		if(i==6){break;}
		%>
				<div  style="border:0px solid blue;width: 200px;min-height: 250px; float: left;margin-left: 20px;box-shadow: 2px 1px 5px 1px #888888;background: white;margin-top:10px;">
					<div style="width: 100px;height: 170px;border:0px solid orange;margin-left: 5px;margin-top:5px;">
                       <img alt="" src="/chuantongwenhuakpsys/upfile/<%=filename[0] %>" style="width:190px;height: 170px;" onclick="selectphoto('<%=map.get("id") %>')">
					</div>
					<div style="border:0px solid gray;margin-top: 10px;">
					   <ul style="text-align: center;">
					      
					      <li style="margin-bottom: 5px;">
					      <%if(Integer.valueOf(map.get("title").toString().length())<13){%>
					      <%=map.get("title") %> 
					      <%} else{%>
					      <%=map.get("title").toString().substring(0,12) %> 
					      <%}%>
					      </li>
					      <li style="margin-bottom: 5px;"><%=map.get("savetime")%> </li>
					     
					   </ul>
					</div>
				</div>
			<!-- 循环结束-->
			<%} %>
			<!--  -->
			
			
			<!--  -->
			<div class="index-more">
						<a href="javascript:void(0)"></a>
					</div>
		<!--  -->
		
		</div>
	</div>
	
	
	
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- js -->
	<!--[if lt IE 9]>

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="/chuantongwenhuakpsys/resource/web/js/jquery.min.js"></script>
	<script src="/chuantongwenhuakpsys/resource/web/js/doysu.min.js"></script>
	<!--<![endif]-->
	<script src="/chuantongwenhuakpsys/resource/web/js/app.js"></script>
	<script type="text/javascript" src="/chuantongwenhuakpsys/layer/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/layer/layer.js"></script>
	<script>
    $(function () { 
    	$("#save").click(function(){
    		$("#hh").submit();
    	});
    });

    <%
    String suc = (String)request.getAttribute("suc");
    if(suc!=null){
    %>
    layer.msg('<%=suc%>');
    <%}%>
    </script>
    
 <script type="text/javascript">

function selectphoto(id){
	$.getJSON('/chuantongwenhuakpsys/chuantongwenhuakpsys?ac=selectPhoto&id='+id, function(msg){
		  layer.photos({
			  area: ['800px','800px'],
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
</body>
</html>
