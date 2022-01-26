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
<script type="text/javascript" src="/chuantongwenhuakpsys/js/My97DatePicker/WdatePicker.js"></script> 
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
String id = request.getParameter("id");
HashMap y = (HashMap)dao.select("select * from yqlj where id="+id).get(0);
 %>
<article class="page-container">
	<div style="width: 400px;">
	 <form class="form form-horizontal" id="form-admin-add"  action="<%=path %><%=path %>?ac=yqljEdit&id=<%=id %>" method="post">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
		<div class="formControls col-xs-8 col-sm-9" >
		  <input type="text" class="input-text"  placeholder="名称"  id="name" name="name" value="<%=y.get("name") %>" required>
		</div>
	</div>
	
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>链接地址：</label>
		<div class="formControls col-xs-8 col-sm-9" >
		  <input type="text" class="input-text"  placeholder="链接地址"  value="<%=y.get("url") %>" id="url" name="url" required>
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
	
	$("#username").blur(function(){
	var username = $("#username").val();
	var re = /[^\u4e00-\u9fa5]/; 
    if(re.test(username)){  
		$.ajax({
			  type : 'post',
			  url : "checkUsername.action",
			  data:"username="+username,
			  success : function(msg){
			  if(msg==0){
			  $("#msgLi").html("<i class=\"Hui-iconfont\" style=\"font-size:15px;color:green;\">&#xe6a7;学号可用</i>");
			  }else{
			  $("#msgLi").html("<i class=\"Hui-iconfont\" style=\"font-size:15px;color:red;\">&#xe6a6;已存在学号</i>");
			  }
			}
		});
		}else{
		$("#msgLi").html("<i class=\"Hui-iconfont\" style=\"font-size:15px;color:red;\">学号不能为中文</i>");
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
