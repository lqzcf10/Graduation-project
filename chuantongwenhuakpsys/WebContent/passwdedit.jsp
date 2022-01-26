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
 <script type="text/javascript" src="/chuantongwenhuakpsys/layer/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/layer/layer.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/static/h-ui/js/H-ui.js"></script> 
 <style type="text/css">
  input{
    width: 45%;
    height: 3em;
    border-radius: 5px;
    /*margin: auto;*/
    opacity: 1;
    outline-style:none;
    border: 1px solid #e1e1e2;
    font-size: 1em;
    font-family: "微软雅黑";
} 
.top{
margin-top: 40px;
}
   </style>
</head>
<body>

<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，手机网站一些效果暂不支持。 请 <a
  href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
<jsp:include page="menu.jsp"></jsp:include>
  <!--content-->
  <% CommDAO dao = new CommDAO();
  HashMap member = (HashMap)session.getAttribute("member");
  HashMap map = dao.select("select * from member where id="+member.get("id")).get(0);
  
  %>
  <div class="dy-container">
   <ol class="dy-breadcrumb">
      <li><a href="/chuantongwenhuakpsys/index.jsp" class="dy-icon-home">首页</a></li>
      <li class="dy-active">修改密码</li>
    </ol>
    <form  action="<%=path %><%=path %>?ac=grupassEdit&id=<%=map.get("id") %>"  method="post">
   <div  style="text-align:left; border:0px solid red;background: white;">
                 <input type="hidden" name="hiddenold" id="hiddenold" value="<%=map.get("upass") %>"/>
                 
                 <div class="top" style="border:0px solid blue;">
					<h2 style="text-align: center;height: 100px;line-height: 100px;font-weight: bold;font-size:28px;letter-spacing: 10px;">修改密码</h2>
				</div>
				
				<div class="top"> 	
					<label style="border:0px solid red;width: 100px;"></label>
					<input type="password" id="oldpwd" name="oldpwd"   placeholder="原密码" style="height: 40px;border-radius:2px 2px;border:1px solid #DCDCDC;width: 70%;padding-left: 10px;" required> 
				</div>
				
				<div class="top"> 	
					<label style="border:0px solid red;width: 100px;"></label>
					<input type="password" id="userpwd" name="userpwd"  placeholder="新密码" pattern="(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}" oninvalid="setCustomValidity('密码字母或数字组成长度6位以上')" oninput="setCustomValidity('');" style="height: 40px;border-radius:2px 2px;border:1px solid #DCDCDC;width: 70%;padding-left: 10px;" required>
				</div>
				
				<div class="top"> 	
					<label style="border:0px solid red;width: 100px;"></label>
					<input type="password" id="newpwd1" name="newpwd1" placeholder="确认新密码" pattern="(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}" oninvalid="setCustomValidity('密码字母或数字组成长度6位以上')" oninput="setCustomValidity('');" style="height: 40px;border-radius:2px 2px;border:1px solid #DCDCDC;width: 70%;padding-left: 10px;" required> 
				</div>
					<input class="top" style="width: 12%;height:40px; background:#198cc1; margin-left: 10%;color:white;margin-bottom: 10%;" type="submit"   value="提交"  >
<%-- 					 <div  class="top" style="margin-left: 243px;margin-bottom: 17%;"><a href="/chuantongwenhuakpsys/login_forgetPassWord.do" style="margin-left: 222px;">忘记密码</a> --%>
<%-- 		             <a href="/chuantongwenhuakpsys/login_login.do?role=2" style="margin-left: 42px;"  target="_blank">管理员登录</a></div> --%>
		</div>
		</form>
  </div>
  <!--content end-->

  <jsp:include page="footer.jsp"></jsp:include>

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/chuantongwenhuakpsys/resource/web/js/jquery.min.js"></script>
<script src="/chuantongwenhuakpsys/resource/web/js/doysu.min.js"></script>
<script src="<%=path %>/layer/jquery-2.0.3.min.js"></script>
    <script src="<%=path %>/layer/layer.js"></script>

<!--<![endif]-->
<script src="/chuantongwenhuakpsys/resource/web/js/app.js"></script>
</body>
		<script type="text/javascript">

	$("#oldpwd").blur(function(){
		var oldpwd = $(this).val();
		var hiddenold = $("#hiddenold").val();
		if(oldpwd!=hiddenold){
			layer.msg('原密码输入错误');
			$("#oldpwd").val("");
			}
		})
		
		$("#newpwd1").blur(function(){
		var newpwd1 = $(this).val();
		var userpwd = $("#userpwd").val();
		if(newpwd1!=userpwd){
			layer.msg('两次密码输入不一致');
			$("#newpwd1").val("");
			$("#userpwd").val("");
			}
		})
		
		
    </script>
	
	<script type="text/javascript">
 <%String suc= (String)request.getAttribute("suc");
    if(suc!=null){%>
    	layer.msg('<%=suc %>');   
    <%}%>
</script> 



<script>
	//登录验证
	var random = 0;
	//此checkcode()方法是更换验证码图片的要点  
	function checkcode(){  
		random++;
	    document.getElementById("yzm").src = "login_img.do?"+random;//改变验证码图片 
	}  	


	</script>
</html>
