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
<script type="text/javascript" src="/chuantongwenhuakpsys/layer/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/chuantongwenhuakpsys/layer/layer.js"></script>
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
HashMap s = (HashMap)session.getAttribute("admin");
String key = request.getParameter("key")==null?"":request.getParameter("key");
//key=Info.getUTFStr(key);
String hql="select * from img where 1=1";
String url="/chuantongwenhuakpsys/admin/imglist.jsp?1=1";
if(!key.equals("")){hql+=" and title like '%"+key+"%' ";url+="&key="+key;}
hql+=" order by id desc";
CommDAO dao = new CommDAO();
PageManager pageManager = PageManager.getPage(url,10, request);
pageManager.doList(hql);
PageManager bean= (PageManager)request.getAttribute("page");
ArrayList<HashMap> list=( ArrayList<HashMap>)bean.getCollection();
%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 轮播图片<span class="c-gray en">&gt;</span> 轮播图片 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<form action="">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	    <span class="l"> 
	                      <a href="javascript:;" onclick="admin_add('添加公告','/chuantongwenhuakpsys/admin/noticeadd.jsp','600','300')" class="btn btn-primary radius">
	                      <i class="Hui-iconfont">&#xe600;</i>  添加信息</a>
	                      </span>
	                     <span class="r">
	                     <div class="panel-foot text-center">
	                     <!-- 分页 -->
	                     ${page.info }
                         </div>
	                     
	                     
	                     </span> </div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr class="text-c">
				<th width="240">略缩图片</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<%
		for(HashMap map:list){
			
		 %>
		 <tr class="text-c">
				<td><img alt="" src="/chuantongwenhuakpsys/upfile/<%=map.get("filename") %>" style="width: 600px;height: 300px;"> </td>
				<td class="td-manage">
				 <a title="删除" href="javascript:void(0)"  class="ml-5" style="text-decoration:none" onclick="if(confirm('是否删除？')){location.replace('<%=path %><%=path %>?ac=imgDel&id=<%=map.get("id") %>');}"><i class="Hui-iconfont"></i>删除</a>
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

function deleteAll(){

	layer.confirm('是否确认删除？', {
  	  btn: ['是','否'] //按钮
  	}, function(){

  	  var len = $("input[name='checked']:checked").length;	
  	  if(len!=0){
  	  var checkedbox = $("input[name='checked']:checked");
  	  var arr = new Array();
        $(checkedbox).each(function(i){
            arr[i] = $(this).val();
        });
        var vals = arr.join(",");
        $.ajax({
  		type:"post",
  		url:"/chuantongwenhuakpsys/chuantongwenhuakpsys?ac=delAllxinwen&vals="+vals,
  		date:"",
  		success:function(msg){
  			location.replace("/chuantongwenhuakpsys/admin/xinwenlist.jsp");
  		  }
        })
  	  }else{
			layer.msg("请选择要删除的项");
      	  }
        
        
  	}, function(){
  	});
  //var $checkbox = $("input[name='checked']");
  //var len = $("input[name='checked']:checked").length;
  
}


</script>
<script type="text/javascript">
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	window.location.href="/chuantongwenhuakpsys/admin/imgadd.jsp"
}
/*管理员-删除*/
function admin_del(id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		/* 
		$(obj).parents("tr").remove();
		
		
		layer.msg('已删除!',{icon:1,time:1000}); */
		window.location.href=ctx+"/special_delSpecial.do?id="+id;
	});
}
/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
}

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
</body>
</html>
