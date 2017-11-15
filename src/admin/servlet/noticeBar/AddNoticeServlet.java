package admin.servlet.noticeBar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddNoticeServlet extends HttpServlet{

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pre = null;

		
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		PrintWriter out = response.getWriter();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		String num = request.getParameter("noticeBarLimit");
		int noticeBarLimit = Integer.parseInt(num);
		
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR); 
		int month = calendar.get(Calendar.MONTH); 
		int day = calendar.get(Calendar.DATE); 
		calendar.set(year, month,day);
		Date releaseTime = new java.sql.Date(calendar.getTimeInMillis());
		
		String condition = "insert into noticeBarInfo(title,releaseTime,author,content,noticeBarInfoLimit) values(?,?,?,?,?)";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setString(1, title);
			pre.setDate(2, releaseTime);
			pre.setString(3, author);
			pre.setString(4, content);
			pre.setInt(5, noticeBarLimit);
			pre.executeUpdate();
			out.println("<SCRIPT language=javascript > alert('添加成功!');window.location='admin/noticeBar/showNoticeBarInfo.jsp';</script>");			
		} catch (SQLException e) {
			out.println("<SCRIPT language=javascript > alert('添加失败!');window.location='admin/noticeBar/addNoticeBarInfo.jsp';</script>");			
			e.printStackTrace();
		}finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		//RequestDispatcher dispatcher = request.getRequestDispatcher("admin/noticeBar/showNoticeBarInfo.jsp");
		//dispatcher.forward(request, response);
	}
}
