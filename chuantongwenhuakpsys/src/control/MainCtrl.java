package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import com.google.gson.Gson;
import com.mysql.jdbc.EscapeTokenizer;


import sun.misc.Perf.GetPerfAction;
import util.Info;
import util.StrUtil;

import dao.CommDAO;

public class MainCtrl extends HttpServlet {

	public MainCtrl() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	this.doPost(request, response);
	}

		public void go(String url,HttpServletRequest request, HttpServletResponse response)
		{
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
		
		public void gor(String url,HttpServletRequest request, HttpServletResponse response)
		{
			try {
				response.sendRedirect(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		HashMap user = (HashMap)session.getAttribute("admin");
		HashMap membe = (HashMap)session.getAttribute("member");
		String ac = request.getParameter("ac");
		if(ac==null)ac="";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0,10);
		String tomonth = date.substring(0,7);
		
		//登录
		if(ac.equals("longin"))
		{
			String username = request.getParameter("username");
			String userpwd = request.getParameter("userpwd");
			String yzm = request.getParameter("yzm");
			String validc = (String) request.getSession().getAttribute("validcode");
			if (validc.equals(yzm)) {
			String sql = "select * from sysuser where username='"+username+"' and userpwd='"+userpwd+"' and delstatus=0 and qx='开'";
			List<HashMap> userlist = dao.select(sql);
			if(userlist.size()!=1)
			{
				request.setAttribute("suc","用户名或密码错误");
				go("admin/login.jsp", request, response);
			}else{
				request.getSession(). setAttribute("admin", userlist.get(0));
				gor("/chuantongwenhuakpsys/admin/index.jsp", request, response);
			}
			}else {
				request.setAttribute("suc","验证码错误");
				go("admin/login.jsp", request, response);
			}
		}
		
		//后台退出
		if(ac.equals("tuichu")){
			session.removeAttribute("admin");
			go("admin/login.jsp", request, response);
		}
		
		//友情链接新增
		if (ac.equals("yqljadd")) {
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			dao.commOper("insert into yqlj values(null,'"+name+"','"+url+"')");
			request.setAttribute("suc", "操作成功");
			go("admin/yqljlist.jsp", request, response);
		}
		//删除友情链接
		if (ac.equals("yqljDel")) {
			String id = request.getParameter("id");
			dao.commOper("delete from yqlj where id="+id);
			//request.setAttribute("suc", "操作成功");
			go("admin/yqljlist.jsp", request, response);
		}
		
		
		//友情链接编辑
		if (ac.equals("yqljEdit")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			dao.commOper("update yqlj set name='"+name+"',url='"+url+"' where id="+id);
			request.setAttribute("suc", "操作成功");
			go("admin/yqljlist.jsp", request, response);
		}
		//轮播图片新增
				if (ac.equals("imgAdd")) {
					String filename = request.getParameter("filename");
					dao.commOper("insert into img values(null,'"+filename+"')");
					request.setAttribute("suc", "操作成功");
					go("admin/imglist.jsp", request, response);
				}
				//轮播图片删除
				if (ac.equals("imgDel")) {
					String id = request.getParameter("id");
					dao.commOper("delete from img where id="+id);
					go("admin/imglist.jsp", request, response);
				}
		
		
		//站内新闻新增
		if (ac.equals("newsAdd")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String savetime = Info.getDateStr();
			dao.commOper("insert into news values(null,'"+title+"','"+content+"','"+savetime+"')");
			request.setAttribute("suc", "操作成功");
			go("admin/newslist.jsp", request, response);
		}
		
		//站内新闻编辑
		if (ac.equals("newsedit")) {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String savetime = Info.getDateStr();
			dao.commOper("update news set title='"+title+"',content='"+content+"',savetime='"+savetime+"' where id="+id);
			request.setAttribute("suc", "操作成功");
			go("admin/newslist.jsp", request, response);
		}
		
		//站内新闻删除
		if (ac.equals("newsDel")) {
			String id = request.getParameter("id");
			dao.commOper("delete from news where id="+id);
			go("admin/newslist.jsp", request, response);
		}
		
		//历史新增
		if (ac.equals("lishiadd")) {
			String filename = request.getParameter("filename");
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			String savetime = Info.getDateStr();
			dao.commOper("insert into lishi values(null,'"+filename+"','"+name+"','"+content+"','"+savetime+"')");
			request.setAttribute("suc", "操作成功");
			go("admin/lishilist.jsp", request, response);
		}
		
		//历史编辑
		if (ac.equals("lishiedit")) {
			String id = request.getParameter("id");
			String filename = request.getParameter("filename");
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			String savetime = Info.getDateStr();
			dao.commOper("update lishi set filename='"+filename+"',name='"+name+"',content='"+content+"',savetime='"+savetime+"' where id="+id);
			request.setAttribute("suc", "操作成功");
			go("admin/lishilist.jsp", request, response);
		}
		
		//历史删除
		if (ac.equals("lishiDel")) {
			String id = request.getParameter("id");
			dao.commOper("delete from lishi where id="+id);
			go("admin/lishilist.jsp", request, response);
		}
		
		//作者模块新增
		if (ac.equals("tedianadd")) {
			String filename = request.getParameter("filename");
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			String savetime = Info.getDateStr();
			dao.commOper("insert into tedian values(null,'"+filename+"','"+name+"','"+content+"','"+savetime+"')");
			request.setAttribute("suc", "操作成功");
			go("admin/tedianlist.jsp", request, response);
			
		}
		
		//特点编辑
		if (ac.equals("tedianedit")) {
			String id = request.getParameter("id");
			String filename = request.getParameter("filename");
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			String savetime = Info.getDateStr();
			dao.commOper("update tedian set filename='"+filename+"',name='"+name+"',content='"+content+"',savetime='"+savetime+"' where id="+id);
			request.setAttribute("suc", "操作成功");
			go("admin/tedianlist.jsp", request, response);
		}
		
		//历史删除
		if (ac.equals("tedianDel")) {
			String id = request.getParameter("id");
			dao.commOper("delete from tedian where id="+id);
			go("admin/tedianlist.jsp", request, response);
		}
		
		
		
		
		
		//诗词美图新增
		if (ac.equals("feiyiAdd")) {
			String filename = request.getParameter("filename");
			String title = request.getParameter("title");
			String savetime = Info.getDateStr();
			dao.commOper("insert into feiyi values(null,'"+filename+"','"+title+"','"+savetime+"')");
			request.setAttribute("suc", "操作成功");
			go("admin/feiyilist.jsp", request, response); 
		}
		//诗词美图编辑
		if (ac.equals("feiyiedit")) {
			String id = request.getParameter("id");
			String filename = request.getParameter("filename");
			String title = request.getParameter("title");
			String savetime = Info.getDateStr();
			dao.commOper("update feiyi set filename='"+filename+"',title='"+title+"',savetime='"+savetime+"' where id="+id);
			request.setAttribute("suc", "操作成功");
			go("admin/feiyilist.jsp", request, response); 
		}
		//诗词美图删除
		if (ac.equals("feiyiDel")) {
			String id = request.getParameter("id");
			dao.commOper("delete from feiyi where id="+id);
			go("admin/feiyilist.jsp", request, response);
		}
		
		//美图后台
		
		if (ac.equals("jqselectPhoto")) {
			String id = request.getParameter("id");
			
			String xml = "[";
			//Photo photo = (Photo) commonDAO.findById(id, "Photo");
			HashMap map = dao.select("select * from feiyi where id="+id).get(0);
			String filenamestr[] = map.get("filename").toString().split(",");
			for (int i=0;i<filenamestr.length;i++) {
				xml+="{\"alt\":\"\",";
				xml+="\"pid\": 666,";
				xml+="\"src\":\"../upfile/"+filenamestr[i]+"\",";
				xml+="\"thumb\":\"../upfile/"+filenamestr[i]+"\"},";
			}
			xml+="]";
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
	 		Gson gson = new Gson();
	 		String flag = gson.toJson(xml);
			out.write(flag);
			out.flush();
			out.close();
		}
		
		
		//美图看前台
		if (ac.equals("selectPhoto")) {
			String id = request.getParameter("id");
			
			String xml = "[";
			//Photo photo = (Photo) commonDAO.findById(id, "Photo");
			HashMap map = dao.select("select * from feiyi where id="+id).get(0);
			String filenamestr[] = map.get("filename").toString().split(",");
			for (int i=0;i<filenamestr.length;i++) {
				xml+="{\"alt\":\"\",";
				xml+="\"pid\": 666,";
				xml+="\"src\":\"upfile/"+filenamestr[i]+"\",";
				xml+="\"thumb\":\"upfile/"+filenamestr[i]+"\"},";
			}
			xml+="]";
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
	 		Gson gson = new Gson();
	 		String flag = gson.toJson(xml);
			out.write(flag);
			out.flush();
			out.close();
		}
		
		
		//用户删除
		if (ac.equals("memberDel")) {
			String id = request.getParameter("id");
			dao.commOper("update member set delstatus='1' where id="+id);
			go("admin/memberlist.jsp", request, response);
		}
		
		
		
		 
		//用户名的唯一性
		if(ac.equals("membercheck")){
			String uname = request.getParameter("uname");
			List<HashMap> list = dao.select("select * from member where uname='"+uname+"'");
			if(list.size()==0){
				out.print("0");
			}else{
				out.print("1");
			}
		}
		
		//修改密码
		if(ac.equals("upassEdit"))
		{
			String oldpass = request.getParameter("oldpass");
			String userpwd = request.getParameter("userpwd");
			String newpass = request.getParameter("newpass");
			String id = request.getParameter("id"); 
				dao.commOper("update sysuser set userpwd='"+newpass+"' where id="+id);
				request.setAttribute("suc", "修改成功");
			go("admin/upassedit.jsp", request, response);
		}
		
		//用户名的唯一性
		if(ac.equals("admincheck")){
			String username = request.getParameter("username");
			List<HashMap> list = dao.select("select * from sysuser where username='"+username+"'");
			if(list.size()==0){
				out.print("0");
			}else{
				out.print("1");
			}
		}
		
		
		//管理员信息新增
		if (ac.equals("adminAdd")) {
			String usertype = "管理员";
			String username = request.getParameter("username");
			String userpwd = request.getParameter("userpwd");
			String realname = request.getParameter("realname");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");
			String qx = "开";
			String delstatus = "0";
			String savetime = Info.getDateStr();
			dao.commOper("insert into sysuser values(null,'"+usertype+"','"+username+"','"+userpwd+"','"+realname+"'," +
					"'"+sex+"','"+tel+"','"+qx+"','"+delstatus+"','"+savetime+"')");
			request.setAttribute("suc", "操作成功");
			go("admin/adminlist.jsp", request, response);
			
		}
		
		//管理员信息编辑
		if (ac.equals("adminEditgly")) {
			String id = request.getParameter("id");
			String realname = request.getParameter("realname");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");
			String savetime = Info.getDateStr();
			dao.commOper("update sysuser set realname='"+realname+"',sex='"+sex+"',tel='"+tel+"',savetime='"+savetime+"' where id="+id);
			request.setAttribute("suc", "操作成功");
			go("admin/adminlist.jsp", request, response);
			
		}
		
		//管理员信息删除
		if (ac.equals("adminDel")) {
			String id = request.getParameter("id");
			dao.commOper("update sysuser set delstatus=1 where id="+id);
			go("admin/adminlist.jsp", request, response);
		}
		
		//个人信息修改
		if (ac.equals("adminEdit")) {
			String id = request.getParameter("id");
			String realname = request.getParameter("realname");
			String tel = request.getParameter("tel");
			String sex = request.getParameter("sex");
			dao.commOper("update sysuser set realname='"+realname+"',tel='"+tel+"',sex='"+sex+"' where id="+id);
			request.setAttribute("suc", "修改成功");
			go("admin/myinfoedit.jsp", request, response);
		}
		
		
		
		//批量删除申请
		if (ac.equals("delAllxinwen")) {
			String vals= request.getParameter("vals");
			String[] val = vals.split(",");
			for (int i = 0; i < val.length; i++) {
				dao.commOper("delete from xiangmu where id="+val[i]);
			}
			return;
		}
		
		
		
		
		
		if (ac.equals("pd")) {
			HashMap member = (HashMap)session.getAttribute("member");
			if (member==null) {
				request.setAttribute("suc", "请先登录或注册");
				go("/index.jsp", request, response);
			}else {
				go("/chatlist.jsp", request, response);
			}
		}
		
		//前台登录
		if (ac.equals("memberLogin")) {
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass");
			String yzm = request.getParameter("yzm");
			String validc = (String) request.getSession().getAttribute("validcode");
			if (validc.equals(yzm)) {
			ArrayList hylist = (ArrayList)dao.select("select * from member where uname='"+uname+"' and upass='"+upass+"' and delstatus='0'");
			if (hylist.size()>0) {
				session.setAttribute("member", hylist.get(0));
				go("/index.jsp", request, response);
			}else {
				request.setAttribute("suc", "用户名或密码错误");
				go("/login.jsp", request, response);
			}
			}else {
				request.setAttribute("suc", "验证码错误");
				go("/login.jsp", request, response);
			}
		}
		
		//前台退出
		if(ac.equals("memberExit")){
			session.removeAttribute("member");
			go("/index.jsp", request, response);
		}
		
		
		//用户注册
		if (ac.equals("memberReg")) {
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass");
			String tname = request.getParameter("tname");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");
			String delstatus = "0";
			String filename = "";
			String savatime = Info.getDateStr();
			String sql ="insert into member values(null,'"+uname+"','"+upass+"','"+tname+"','"+sex+"','"+tel+"','"+delstatus+"','"+filename+"','"+savatime+"')";
			dao.commOper(sql);
			request.setAttribute("suc", "注册成功,请登录");
			go("/login.jsp", request, response);
			
		}
		
		//用户个人信息编辑
		if (ac.equals("xsgredit")) {
			String id = request.getParameter("id");
			//String uname = request.getParameter("uname");
			String tname = request.getParameter("tname");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");
			String sql ="update member set tname='"+tname+"',sex='"+sex+"',tel='"+tel+"'  where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "操作成功");
			go("/memberedit.jsp", request, response);
		
		}
		
		//修改密码
		if(ac.equals("grupassEdit"))
		{
			String userpwd = request.getParameter("userpwd");
			String id = request.getParameter("id"); 
				dao.commOper("update member set upass='"+userpwd+"' where id="+id);
				request.setAttribute("suc", "修改成功");
			go("/passwdedit.jsp", request, response);
		}
		
		
		

		//找回密码
		if (ac.equals("mimazh")) {
			String suc="";
			String uname = request.getParameter("uname");
			String wenti = request.getParameter("wenti");
			String daan = request.getParameter("daan");
			ArrayList<HashMap> list = (ArrayList<HashMap>)dao.select("select * from member where uname='"+uname+"' and wenti='"+wenti+"' and daan='"+daan+"'");
			if(list.size()==1){
				suc="找回密码:&nbsp;&nbsp;"+list.get(0).get("upass").toString()+"&nbsp;&nbsp;请牢记";
				request.setAttribute("zhmm", suc);
				go("/login.jsp", request, response);
			}else{
				request.setAttribute("suc", "输入的信息不正确");
				go("/zhmm.jsp", request, response);
			}
		}
		
		
		//在线留言
		if (ac.equals("chatAdd")) {
			String mid = membe.get("id").toString();
			String content = request.getParameter("content");
			String savetime = Info.getDateStr();
			dao.commOper("insert into chat values(null,'"+mid+"','"+content+"','','"+savetime+"')");
			request.setAttribute("suc", "操作成功");
			go("/chatlist.jsp", request, response);
		}
		//留言回复
		if (ac.equals("chathf")) {
			String id = request.getParameter("id");
			String hfcontent = request.getParameter("hfcontent");
			dao.commOper("update chat set hfcontent='"+hfcontent+"' where id="+id);
			go("admin/chatlist.jsp", request, response);
		}
		
		//留言信息删除
		if (ac.equals("jiaoliuDel")) {
			String id = request.getParameter("id");
			dao.commOper("delete from chat where id="+id);
			go("admin/chatlist.jsp", request, response);
		}
		
		
		
		
		//AJAX根据父类查子类
		if(ac.equals("searchsontype")){
			String xml_start = "<selects>";
	        String xml_end = "</selects>";
	        String xml = "";
	        String nmap = request.getParameter("nmap");
	        ArrayList<HashMap> list = (ArrayList<HashMap>)dao.select("select * from kechengleibie where fatherid='"+nmap+"' and delstatus='0' ");
			if(list.size()>0){
		        for(HashMap map:list){
					xml += "<select><value>"+map.get("id")+"</value><text>"+map.get("leibie")+"</text><value>"+map.get("id")+"</value><text>"+map.get("leibie")+"</text></select>";
				}
			}
			String last_xml = xml_start + xml + xml_end;
			response.setContentType("text/xml;charset=GB2312"); 
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(last_xml);
			response.getWriter().flush();
			
		}

              //sysuserxg.jsp请求处理结束


//--业务层代码块结束--
		dao.close();
		out.flush();
		out.close();
	}


	public void init() throws ServletException {
		// Put your code here
	}
	
	

}
