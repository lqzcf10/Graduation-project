<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	CommDAO dao = new CommDAO();

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
<link rel="stylesheet" href="../themes/default/default.css" />
<link rel="stylesheet" href="../plugins/code/prettify.css" />
<script charset="utf-8" src="../plugins/code/prettify.js"></script>

<script charset="utf-8" src="/chuantongwenhuakpsys/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="/chuantongwenhuakpsys/kindeditor/lang/zh-CN.js"></script>
<script>
KindEditor.ready(function(K) {
window.editor = K.create('#editor_id');
});
</script>
<script>
KindEditor.ready(function(K) {
K.create('textarea[name="content"]', {
uploadJson : '/chuantongwenhuakpsys/kindeditor/jsp/upload_json.jsp',
fileManagerJson : '/chuantongwenhuakpsys/kindeditor/jsp/file_manager_json.jsp',
allowFileManager : true,
allowImageUpload : true, 
autoHeightMode : true,
afterCreate : function() {this.loadPlugin('autoheight');},
afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
});
});
</script>
<body>
<article class="page-container">
	<div style="width: 400px;">
	 <form class="form form-horizontal" id="form-admin-add"  action="<%=path %><%=path %>?ac=lishiadd" method="post">
	 <input type="hidden" name="type" value=""/>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片：</label>
		<div class="formControls col-xs-8 col-sm-9" >
		<img alt="" src="/chuantongwenhuakpsys/upfile/no.jpg" id="imgfilename" width="100" height="100">
		<input name='filename' type="hidden" class="col-xs-10 col-sm-5"required  id='url'/>&nbsp;<br>
		<input type='button' value='上传'  class="layui-input"onClick="up('url')" style="width: 70px;height: 20px;border:1px solid #cccccc;background: white;border-radius:20px 20px;outline:none;"/>
		</div>
	</div>
	
	
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>作者名称：</label>
		<div class="formControls col-xs-8 col-sm-9" >
		<ul>
		  <li><input type="text" class="input-text"  placeholder="名称"  id="name" name="name"  required></li>
		  <li id="msgLi"></li>
		</ul>
		</div>
	</div>
	
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>详情：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<textarea style="width:700px;height:300px;" name="content" id="editor_id"></textarea>
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
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
