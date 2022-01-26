<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
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
<title></title>
</head>
<body>
<%
String key = request.getParameter("key")==null?"":request.getParameter("key");
//key=Info.getUTFStr(key);
String hql="select * from chat where  1=1";
String url="/chuantongwenhuakpsys/admin/chatlist.jsp?1=1";
if(!key.equals("")){hql+=" and mid in (select id from Member where tname like '%"+key+"%')";url+="&key="+key;}
hql+=" order by savetime desc";
CommDAO dao = new CommDAO();
PageManager pageManager = PageManager.getPage(url,10, request);
pageManager.doList(hql);
PageManager bean= (PageManager)request.getAttribute("page");
ArrayList<HashMap> list=( ArrayList<HashMap>)bean.getCollection();
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>留言信息<span class="c-gray en">&gt;</span> 留言信息 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
   <form action="/chuantongwenhuakpsys/admin/chatlist.jsp">
   <div class="text-c"> 
		<input type="text" class="input-text" style="width:250px" placeholder="输入留言人..." id="" name="key" value="<%=key %>">
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
   </form>
	<form action="">
				<div class="cl pd-5 bg-1 bk-gray mt-20">
					<span class="l"> </span>
					<span class="r">
						<div class="panel-foot text-center">
							<!-- 分页 -->
							${page.info }
						</div> </span>
				</div>
				<table class="table table-border table-bordered table-bg">
		<thead>
			<tr class="text-c">
				<th width="90">留言人</th>
				<th width="90">内容</th>
				<th width="90">回复内容</th>
				<th width="90">日期</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<%
		for(HashMap map:list){
			HashMap pjmember = (HashMap)dao.select("select * from member where id="+map.get("mid")).get(0);
		 %>
		 <tr class="text-c">
		        <td><%=pjmember.get("tname") %></td>
		        <td><%=map.get("content") %></td>
		         <td><%=map.get("hfcontent") %></td>
				<td><%=map.get("savetime") %></td>
				<td class="td-manage">
				<%if(map.get("hfcontent").equals("")){%>
				<a  href="/chuantongwenhuakpsys/admin/chathf.jsp?id=<%=map.get("id") %>" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont"></i>回复</a>
				<%} %>
				 <a title="删除" href="javascript:void(0)"  class="ml-5" style="text-decoration:none" onclick="if(confirm('是否删除？')){location.replace('<%=path %><%=path %>?ac=jiaoliuDel&id=<%=map.get("id") %>');}"><i class="Hui-iconfont"></i>删除</a>
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
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*用户-增加*/
function admin_add(title,url,w,h){
	window.location.href="memberadd.jsp"
}
/*用户-删除*/
function admin_del(id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		/* 
		$(obj).parents("tr").remove();
		
		
		layer.msg('已删除!',{icon:1,time:1000}); */
		window.location.href=ctx+"/special_delSpecial.do?id="+id;
	});
}
/*用户-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*用户-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
}



function showcontent(id){
    var content = $("#content"+id).val();
	  layer.open({
		  title: '联系方式',
		  area: ['500px', '300px'],
		  offset: 'rb',
		  content: content
		});
}
</script>
</body>
</html>
