<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%  CommDAO dao = new CommDAO();
HashMap member  = (HashMap)session.getAttribute("member");

String key = request.getParameter("key")==null?"":request.getParameter("key");
%>
 

     <div class="header-top dys-show-md" >
    <div class="dy-container" >
      <div class="dy-g" style="height: 60px;border:0px solid red;margin-top: 10px;margin-bottom: 10px;">
      <h1 >
      <span style="color: black;font-size: 24px;">一方池塘诗词鉴赏系统</span>
      
     
      <span style="float: right;">
      <%if(member==null){ %>
      <a href="login.jsp">登录</a>
      <a href="reg.jsp">用户注册</a>
      <%}else{ 
    	 
    	  HashMap mmm = (HashMap)dao.select("select * from member where id="+member.get("id")).get(0);
      %>
      <font><%=mmm.get("tname") %>&nbsp;&nbsp;你好!&nbsp;&nbsp;
      <a href="<%=path %><%=path %>?ac=memberExit">退出</a>
      </font>
      <%} %>
      </span>
      </h1>
       <%--<div id="banner" class="dy-container" style="text-align: center;">
		<form action="/chuantongwenhuakpsys/xinwenlistdbss.jsp" method="post">
   				<input type="text" class="input-text" style="height: 30px;width: 25%;" placeholder="输入" id="" name="key" value="<%=key %>">
			<input style="width: 7%; background: #198cc1; color: white; height: 30px; vertical-align: none;margin-left: 10px;border:1px solid #1780B0"
				type="submit" value="查找" id="submit" name="submit">
		</form>
	</div>
      --%></div>
    </div>
  </div>
  
     
   <!-- header -->
  <header class="dy-topbar dy-topbar-inverse">
    <div class="dy-container">
      <h1 class="dy-topbar-brand dy-show-sm-only">
        <a class="dy-text-ir" href="#">一方池塘诗词鉴赏系统</a>
      </h1>
      
      <button data-dy-collapse="{target: '#doc-topbar-collapse-3'}" class="dy-topbar-btn dy-topbar-toggle dy-btn dy-btn-sm dy-btn-success dy-show-sm-only dy-collapsed">
        <span class="dy-sr-only">导航切换</span>
        <span class="dy-icon-bars"></span>
      </button>     
                                                    
      <div  class="dy-topbar-collapse dy-collapse">
        <ul class="dy-nav dy-nav-pills dy-topbar-nav">
           <li ><a href="/chuantongwenhuakpsys/index.jsp">首页</a></li>
            <li style="margin-left: 30px;cursor: pointer;"><a href="/chuantongwenhuakpsys/newslistqt.jsp">全部新闻</a></li>
            <li style="margin-left: 30px;cursor: pointer;"><a href="/chuantongwenhuakpsys/lishilistqt.jsp">名句赏析</a></li>
            <li style="margin-left: 30px;cursor: pointer;"><a href="/chuantongwenhuakpsys/tedianqt.jsp">作者模块</a></li>
           <li style="margin-left: 30px;cursor: pointer;"><a href="/chuantongwenhuakpsys/feiyilistqt.jsp">诗词美图</a></li>
            <li style="margin-left: 30px;cursor: pointer;"><a href="<%=member==null?"login.jsp":"chatlist.jsp" %>">在线留言</a></li>
           <li style="margin-left: 30px;cursor: pointer;"><a href="<%=member==null?"login.jsp":"memberedit.jsp" %>">个人信息</a></li>
           <li style="margin-left: 30px;cursor: pointer;"><a href="<%=member==null?"login.jsp":"passwdedit.jsp" %>">个人密码</a></li>
           
        </ul>
      </div>
      
    </div>
  </header>
  <!-- /header -->