<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<html>
 <head></head>
 <body>
   <!--link-->
  <div id="news" class="dy-container" style="margin-top: 20px;">
    <div class="dy-g link">
       <div class="dy-u-md-12 dy-u-sm-12">
       <% 
       CommDAO dao = new CommDAO();
       ArrayList<HashMap> ylist = (ArrayList<HashMap>)dao.select("select * from yqlj where 1=1");
       %>
          <div class="dy-bac-fff">
              <dl>
                <dt style="color: black;"><a class="dy-text-center" href=""><span class="dy-icon-link"></span></a>&nbsp;&nbsp;友情链接</dt>
                <dd style="font-size:12px;">
                <%for(HashMap y:ylist){ %>
                  <a href="http://<%=y.get("url") %>" target="block"><%=y.get("name") %></a>
                  <%} %>
                </dd>
              </dl>
          </div>
       </div>
    </div>
  </div>
  <!--link end-->

  <!--footer-->
  <div id="footer" >
        <div class="footer-bottom">
          <div class="dy-g">
            <div class="dy-u-md-12 dy-u-sm-12 dy-text-center">
                Copyright All rights reserved  
              <!--   <a href="/chuantongwenhuakpsys/reg.jsp" target="_blank">管理员注册</a> -->
                <a href="/chuantongwenhuakpsys/admin/login.jsp" target="_blank">管理员登录</a>
                  
            </div>
            
          </div>
       </div>
  </div>
  <!--footer end-->

<div data-dy-widget="gotop"  class="dy-gotop dy-gotop-fixed">
  <a class="dy-icon-btn dy-icon-arrow-up dy-active dy-top" title="回到顶部" href="#top"></a>
</div>
 </body>
 <script type="text/javascript">
function go(no){
	alert(no);
	//location.replace(no);
	window.location.href=no;
}
</script>
</html>

