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


<script type="text/javascript" src="/chuantongwenhuakpsys/distpicker/distpicker.data.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/distpicker/distpicker.js"></script>
 <style type="text/css">
.top{
margin-top: 20px;
}
   </style>
</head>
<body>
<% 
CommDAO dao = new CommDAO();
HashMap member = (HashMap)session.getAttribute("member");
HashMap mem = (HashMap)dao.select("select * from member where id="+member.get("id")).get(0);
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
      <li class="dy-active">个人信息</li>
    </ol>
    <form action="<%=path %><%=path %>?ac=xsgredit&id=<%=mem.get("id") %>" method="post">
   <div  style="text-align:left; border:0px solid red;background: white;">
   
                 <div class="top" style="border:0px solid blue;">
					<h2 style="text-align: center;height: 100px;line-height: 100px;font-weight: bold;font-size:28px;letter-spacing: 10px;">编辑个人信息</h2>
				 </div>
				 <%--<div  style="height: 150px;padding-top: 5px;margin-left: 100px;">
					   <table border="0">
					    <tr>
					      <td width="120">
					       <img alt="" id="imgfilename" src="/chuantongwenhuakpsys/upfile/<%=mem.get("filename") %>" width="100" height="100">
			               <input  name="filename"  type='hidden' value="<%=mem.get("filename") %>" class="form-control" placeholder="点击按钮上传图片"  required    id='url'  size='40'  />&nbsp;
						   <div style="margin-top: 10px;">
						   <input type='button' value='上传头像'  class="layui-input" onClick="up('url')" style="width: 70px;height: 20px;border:1px solid #cccccc;background: white;border-radius:20px 20px;outline:none;"/>
							</div>
			               </td>
					    </tr>
					  </table>
					</div>

				--%><div class="top" style="border:0px solid blue">
					<label style="border:0px solid red;width: 100px;"></label>
					<input type="text" name="uname" id="uname" placeholder="用户名" value="<%=mem.get("uname") %>"  readonly="readonly" style="height: 40px;border-radius:2px 2px;border:1px solid #DCDCDC;width: 70%;padding-left: 10px;" required>
				</div> 	
				
				
				<div class="top"> 	
					<label style="border:0px solid red;width: 100px;"></label>
					<input type="text" name="tname" id="tname" placeholder="姓名" value="<%=mem.get("tname") %>" style="height: 40px;border-radius:2px 2px;border:1px solid #DCDCDC;width: 70%;padding-left: 10px;" required> 
				</div>
				
					<div class="top" > 	
					<label style="border:0px solid red;width: 100px;"></label>
					<select name="sex" id="sex" style="height: 40px;border-radius:2px 2px;border:1px solid #DCDCDC;width: 70%;padding-left: 10px;" required>
					  <option value="男" <%=mem.get("sex").equals("男")?"selected":"" %>>男</option>
					  <option value="女" <%=mem.get("sex").equals("女")?"selected":"" %>>女</option>
					</select>
				</div>
				
				<div class="top"> 	
					<label style="border:0px solid red;width: 100px;"></label>
					<input type="text" name="tel" id="tel" placeholder="联系方式" value="<%=mem.get("tel") %>" style="height: 40px;border-radius:2px 2px;border:1px solid #DCDCDC;width: 70%;padding-left: 10px;" required> 
				</div>
				
				
					<input class="top" style="width: 12%;height:40px; background:#198cc1; margin-left: 10%;color:white;margin-bottom: 10%;" type="submit" value="更新" id="submit" name="submit" onclick="check()">
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
<!--<![endif]-->
<script src="/chuantongwenhuakpsys/resource/web/js/app.js"></script>
</body>
<script>
function validatorloginName(){     
	 var uname=f1.uname.value;
	 $.ajax({  
	        type: "POST",      
	         url: "membercheck.action", //servlet的名字     
	          data: "uname="+uname, 
	         success: function(data){   
	    if(data==0){     
	    }else{    
	     	layer.msg('用户名已存在');
	     	f1.uname.value = "";
	    }     
	 }     
	}); 
	}  




	</script>
	<script src="/chuantongwenhuakpsys/uploadifyv3.1/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="/chuantongwenhuakpsys/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
<link href="/chuantongwenhuakpsys/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function up(tt)
{
layer.open({
  type: 2,
  title: '上传文件',
  shadeClose: true,
  shade: false,
  maxmin: true, //开启最大化最小化按钮
  area: ['450px', '200px'],
  content: 'upload.jsp?Result='+tt
});
}

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
	
</html>
