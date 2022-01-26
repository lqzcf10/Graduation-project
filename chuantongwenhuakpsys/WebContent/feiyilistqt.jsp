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
<script type="text/javascript" src="/chuantongwenhuakpsys/layer/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/layer/layer.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/distpicker/distpicker.data.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/distpicker/distpicker.js"></script>
<link rel="stylesheet" href="/chuantongwenhuakpsys/css/font-awesome.css">

</head>
<body>
<%
CommDAO dao = new CommDAO();
String hql = "select * from feiyi where 1=1";
String url="/chuantongwenhuakpsys/feiyilistqt.jsp?1=1";
String f = request.getParameter("f");
String key = request.getParameter("key")==null?"":request.getParameter("key");
String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
String key3 = request.getParameter("key3")==null?"":request.getParameter("key3");
String key4 = request.getParameter("key4")==null?"":request.getParameter("key4");
String key5 = request.getParameter("key5")==null?"":request.getParameter("key5");
String key6 = request.getParameter("key6")==null?"":request.getParameter("key6");
if(!key.equals("")){
hql+=" and  title like '%"+key+"%'";
url+="&key="+key;
}
hql+=" order by id desc";
PageManager pageManager = PageManager.getPage(url,10, request);
pageManager.doList(hql);
PageManager bean= (PageManager)request.getAttribute("page");
ArrayList<HashMap> list=( ArrayList<HashMap>)bean.getCollection();
%>
	<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，手机网站一些效果暂不支持。 请 <a
  href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
	<jsp:include page="menu.jsp"></jsp:include><%--
	<input type="hidden" id="hiddensheng" value="<%=key%>">
	<input type="hidden" id="hiddenshi" value="<%=key1%>">
	--%><!--banner-->
	<!--banner end-->
     <div id="banner" class="dy-container" style=" margin-bottom: 10px;">
			<ol class="dy-breadcrumb">
      <li><a href="index.jsp" class="dy-icon-home">首页</a></li>
      <li class="dy-active">美图信息</li>
    </ol>
	</div>
	<!--公告-->
	<div id="banner" class="dy-container">
		<form action="/chuantongwenhuakpsys/feiyilistqt.jsp" method="post">
   				<div class="form-group" style="float: left">
   				<input type="text" class="input-text" style="height: 30px;width: 230px;" placeholder="输入名称" id="" name="key" value="<%=key %>">
   				</div>
			<input style="width: 10%; background: #198cc1; color: white; height: 30px; vertical-align: none;margin-left: 10px;border:1px solid #1780B0"
				type="submit" value="查找" id="submit" name="submit">
		</form>
	</div>
	<div id="news" class="dy-container" style="min-height: 300px;">
		<div class="dy-g news">
		<!-- 循环 -->
		<%
		int i=0;
		for(HashMap mem:list){
			String filename[] = mem.get("filename").toString().split(",");
		i++;
		%>
				<div  style="border:0px solid blue;width: 200px;height: 250px; float: left;margin-left: 20px;box-shadow: 2px 1px 5px 1px #888888;background: white;margin-top:10px;">
					<div style="width: 100px;height: 170px;border:0px solid orange;margin-left: 5px;margin-top:5px;">
                       <img alt="" src="/chuantongwenhuakpsys/upfile/<%=filename[0] %>"  style="width:190px;height: 170px;" onclick="selectphoto('<%=mem.get("id") %>')">
					</div>
					<div style="border:0px solid gray;margin-top: 10px;margin-bottom: 5px;text-align: center">
					   <ul>
					      <%if(Integer.valueOf(mem.get("title").toString().length())<13){%>
					      <%=mem.get("title") %> 
					      <%} else{%>
					      <%=mem.get("title").toString().substring(0,12) %> 
					      <%}%>
					      </li>
					     <li ><span style="font-weight:bold;text-align:center;padding-left: 10px;"></span><%=mem.get("savetime") %></li>
					   </ul>
					</div>
				</div>
			<!-- 循环结束-->
			<%} %>
			<!--  -->
		<!--  -->
		
		</div>
		
		
	</div>
	<div class="panel-foot text-center" style="text-align: center;">
       ${page.info }
       </div>
	<!--公告 end-->
	<!--公告 end-->
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
	  <%
		String suc = (String)request.getAttribute("suc");
		if(suc!=null){
		%>
		layer.msg('<%=suc%>');
		<%}%>
	
    $(function () { 
    	$("#save").click(function(){
    		$("#hh").submit();
    	});
    });
    </script>
    
    <script type="text/javascript">
  function showbig(url){
  var height = $("#displayimg").height();
  var width = $("#displayimg").width();
  layer.open({
    type: 1,
    title: false,
    closeBtn: 0,
    area: [width + '300', height + '200'],
    skin: 'layui-layer-nobg', //没有背景色
    shadeClose: true,
    content: "<img alt=" + name + " title=" + name + " src=" + url + " width='600' height='600' />"
  });
  }


  $(function(){
	    var hiddensheng = $("#hiddensheng").val();
	    var hiddenshi = $("#hiddenshi").val();
		$("#province2").val(hiddensheng);
		$("#city2").find("option").remove();
		$("#city2").append("<option value="+hiddenshi+" 'selected'>"+hiddenshi+"</option>")
		$("#city2").val(hiddenshi);
	})
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
