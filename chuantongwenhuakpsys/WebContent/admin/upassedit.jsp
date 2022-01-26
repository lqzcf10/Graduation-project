<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <link href="/chuantongwenhuakpsys/resource/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="/chuantongwenhuakpsys/resource/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="/chuantongwenhuakpsys/resource/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="/chuantongwenhuakpsys/resource/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/static/h-ui/js/H-ui.js"></script> 
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui.admin/css/style.css" />


<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui/css/style.css" />
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
<head>
<style>
#doc-topbar-collapse-3 a{
font-weight: bold;
font-size: 14px;
}
.headers{
height: 30px;width: 200px;
z-index:999;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script charset="utf-8" src="/chuantongwenhuakpsys/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/chuantongwenhuakpsys/kindeditor/Kind.js"></script>
<script charset="utf-8" src="/chuantongwenhuakpsys/kindeditor/lang/zh-CN.js"></script>
<body>
<% 
CommDAO dao = new CommDAO();
HashMap s = (HashMap)session.getAttribute("admin");
HashMap sysuser = (HashMap)dao.select("select * from sysuser where id="+s.get("id")).get(0);
%>
<article class="page-container">
	<div style="width: 400px;">
	 <form class="form form-horizontal" id="form-admin-add"  action="<%=path %><%=path %>?ac=upassEdit&id=<%=sysuser.get("id") %>" method="post">
	 <input type="hidden" name="hiddenpass" id="hiddenpass" value="<%=sysuser.get("userpwd") %>"/>
	<div class="row cl">
		<div class="formControls col-xs-8 col-sm-9" >
		<ul>
		  <li><input type="password" class="input-text"  placeholder="旧密码"   id="oldpass" name="oldpass" required></li>
		</ul>
		<ul style="margin-top: 5px;">
		  <li><input type="password" class="input-text"  placeholder="新密码"  id="userpwd" name="userpwd" required></li>
		</ul>
		<ul style="margin-top: 5px;">
		  <li><input type="password" class="input-text"  placeholder="重复新密码"   id="newpass" name="newpass" required></li>
		</ul>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="dd" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
	</form>
	</div>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/jquery.validation/1.14.0/messages_zh.min.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer /作为公共模版分离出去--> 

<!--请在下方写此页面业务相关的脚本--> 

<script type="text/javascript">
		
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#dd").click(function(){
	if($("#hiddenpass").val()!=$("#oldpass").val()){
	alert("原密码错误");
	return false;
	}else if($("#userpwd").val()!=$("#newpass").val()){
	alert("两次密码输入不一致");
	return false;
	}else{
	$("#form-admin-add").submit();
	}
	});
});
</script> 

<script type="text/javascript">

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
alert("修改密码成功");
location.replace("/chuantongwenhuakpsys/admin/upassedit.jsp");
<%
}
%>
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
