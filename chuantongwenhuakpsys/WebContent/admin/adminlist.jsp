<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%@page import="util.Info"%>
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
<title>????????????</title>
</head>
<body>
<%
CommDAO dao = new CommDAO();
String key = request.getParameter("key")==null?"":request.getParameter("key");
//key=Info.getUTFStr(key);
String hql="select * from sysuser where  delstatus='0' and username!='admin'";
String url="/chuantongwenhuakpsys/admin/adminlist.jsp?1=1";
if(!key.equals("")){hql+=" and (realname like '%"+key+"%' or username like '%"+key+"%')";url+="&key="+key;}
String qxid = request.getParameter("qxid");
if(qxid!=null){
	dao.commOper("update sysuser set qx='???' where id="+qxid);
}
hql+=" order by id desc";

String kid = request.getParameter("kid");
if(kid!=null){dao.commOper("update sysuser set qx='???' where id="+kid);}
PageManager pageManager = PageManager.getPage(url,10, request);
pageManager.doList(hql);
PageManager bean= (PageManager)request.getAttribute("page");
ArrayList<HashMap> list=( ArrayList<HashMap>)bean.getCollection();
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> ?????? <span class="c-gray en">&gt;</span>???????????????<span class="c-gray en">&gt;</span> ???????????????<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="??????" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
   <form action="/chuantongwenhuakpsys/admin/adminlist.jsp">
   <div class="text-c"> 
		<input type="text" class="input-text" style="width:250px" placeholder="????????????????????????..." id="" name="key" value="<%=key %>">
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> ??????</button>
	</div>
   </form>
	<form action="">
				<div class="cl pd-5 bg-1 bk-gray mt-20">
					<span class="l"> 
					<a href="javascript:;" onclick="admin_add('??????','/chuantongwenhuakpsys/admin/noticeadd.jsp','600','300')" class="btn btn-primary radius">
	                      <i class="Hui-iconfont">&#xe600;</i>  ????????????</a>
					</span>
					<span class="r">
						<div class="panel-foot text-center">
							<!-- ?????? -->
							${page.info }
						</div> </span>
				</div>
				<table class="table table-border table-bordered table-bg">
		<thead>
			<tr class="text-c">
				<th width="90">?????????</th>
				<th width="90">??????</th>
				<th width="90">??????</th>
				<th width="90">??????</th>
				<th width="90">??????</th>
				<th width="90">????????????</th>
				<th width="100">??????</th>
			</tr>
		</thead>
		<tbody>
		<%
		for(HashMap map:list){
		 %>
		 <tr class="text-c">
				<td><%=map.get("username") %></td>
				<td><%=map.get("userpwd") %></td>
				<td><%=map.get("realname") %></td>
				<td><%=map.get("sex") %></td>
				<td><%=map.get("tel") %></td>
				<td><%=map.get("savetime") %></td>
				<td class="td-manage">
				<a title="??????" href="/chuantongwenhuakpsys/admin/adminedit.jsp?id=<%=map.get("id") %>"  class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">??????</i></a>
				 <a title="??????" href="javascript:void(0)"  class="ml-5" style="text-decoration:none" onclick="if(confirm('???????????????')){location.replace('<%=path %><%=path %>?ac=adminDel&id=<%=map.get("id") %>');}">??????</a>
				 </td>
			</tr>
	   <%} %>
		</tbody>
		
	</table>
	</form>
</div>
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/jquery/1.9.1/jquery.min.js"></script>  
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="/chuantongwenhuakpsys/resource/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript">

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
/*
	???????????????
	title	??????
	url		?????????url
	id		?????????????????????id
	w		???????????????????????????????????????
	h		???????????????????????????????????????
*/
/*??????-??????*/
function admin_add(title,url,w,h){
	window.location.href="/chuantongwenhuakpsys/admin/adminadd.jsp"
}
/*??????-??????*/
function admin_del(id){
	layer.confirm('?????????????????????',function(index){
		//??????????????????????????????????????????????????????????????????
		/* 
		$(obj).parents("tr").remove();
		
		
		layer.msg('?????????!',{icon:1,time:1000}); */
		window.location.href=ctx+"/special_delSpecial.do?id="+id;
	});
}
/*??????-??????*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*??????-??????*/
function admin_stop(obj,id){
	layer.confirm('?????????????????????',function(index){
		//??????????????????????????????????????????????????????????????????
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="??????" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">?????????</span>');
		$(obj).remove();
		layer.msg('?????????!',{icon: 5,time:1000});
	});
}

/*??????-??????*/
function admin_start(obj,id){
	layer.confirm('?????????????????????',function(index){
		//??????????????????????????????????????????????????????????????????
		
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="??????" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">?????????</span>');
		$(obj).remove();
		layer.msg('?????????!', {icon: 6,time:1000});
	});
}
</script>
</body>
</html>
