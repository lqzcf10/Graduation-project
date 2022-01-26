<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/chuantongwenhuakpsys/resource/static/h-ui.admin/css/style.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href=""><span style="color:white;font-size: 20px;">一方池塘诗词鉴赏系统</span></a> 
			<%CommDAO dao = new CommDAO();

			HashMap admin = (HashMap)session.getAttribute("admin");
			HashMap map = dao.select("select * from sysuser where id="+admin.get("id")).get(0);
			
			 %>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>欢迎您：</li>
					<li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A"><%=map.get("realname") %>(<%=map.get("usertype") %>) <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="<%=path %><%=path %>?ac=tuichu">退出</a></li>
						</ul>
					</li>
					<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
	
	    <dl id="menu-attorney">
			<dt><i class="Hui-iconfont">&#xe620;</i> 网站管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
				<li><a _href="/chuantongwenhuakpsys/admin/imglist.jsp" data-title="轮播图片" href="javascript:void(0)">轮播图片</a></li>
				<li><a _href="/chuantongwenhuakpsys/admin/newslist.jsp" data-title="站内新闻" href="javascript:void(0)">站内新闻</a></li>
					<li><a _href="/chuantongwenhuakpsys/admin/yqljlist.jsp" data-title="友情链接" href="javascript:void(0)">友情链接</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-attorney">
			<dt><i class="Hui-iconfont">&#xe620;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
			<%-- 	<%if(map.get("usertype").equals("系统管理员")){%>
				<li><a _href="/chuantongwenhuakpsys/admin/adminlist.jsp" data-title="管理员信息" href="javascript:void(0)">管理员信息</a></li>
				<%} %> --%>
					<li><a _href="/chuantongwenhuakpsys/admin/memberlist.jsp" data-title="用户信息" href="javascript:void(0)">用户信息</a></li>
				</ul>
			</dd>
		</dl>
		
		
		<dl id="menu-attorney">
			<dt><i class="Hui-iconfont">&#xe620;</i> 诗词管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
				<li><a _href="/chuantongwenhuakpsys/admin/feiyilist.jsp" data-title="诗词美图" href="javascript:void(0)">诗词美图</a></li>
					<li><a _href="/chuantongwenhuakpsys/admin/lishilist.jsp" data-title="名句赏析" href="javascript:void(0)">名句赏析</a></li>
					<li><a _href="/chuantongwenhuakpsys/admin/tedianlist.jsp" data-title="作者模块" href="javascript:void(0)">作者模块</a></li>
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-attorney">
			<dt><i class="Hui-iconfont">&#xe620;</i> 在线留言<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="/chuantongwenhuakpsys/admin/chatlist.jsp" data-title="在线留言" href="javascript:void(0)">在线留言</a></li>
				</ul>
			</dd>
		</dl>
		
        <dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 个人信息<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="/chuantongwenhuakpsys/admin/myinfoedit.jsp" data-title="信息修改" href="javascript:void(0)">信息修改</a></li>
					<li><a _href="/chuantongwenhuakpsys/admin/upassedit.jsp" data-title="密码修改" href="javascript:void(0)">密码修改</a></li>
				</ul>
			</dd>
		</dl>
		
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="/chuantongwenhuakpsys/admin/welcome.jsp"></iframe>
		</div>
	</div>
</section>
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript">
/*公告-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function attorney_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
</script> 
<script type="text/javascript">
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s)})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>
