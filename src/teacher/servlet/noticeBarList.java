package teacher.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import publicConnectSql.connectSql;

import teacher.bean.NoticeBarList;

public class noticeBarList extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		NoticeBarList nBL=null;
		try {
			nBL=(NoticeBarList)request.getAttribute("nBL");
			if (nBL==null) {
				nBL=new NoticeBarList();//创建javabean对象
				request.setAttribute("nBL", nBL);
				
			}
		} catch (Exception e) {
			nBL=new NoticeBarList();//创建javabean对象
			request.setAttribute("nBL", nBL);
		}
		
		connectSql conSql=new connectSql();
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
}
