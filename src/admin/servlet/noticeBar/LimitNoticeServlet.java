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

public class LimitNoticeServlet extends HttpServlet{

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
		
		PrintWriter out = response.getWriter();
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		String num1 = request.getParameter("noticeBarInfoNum");
		String num2 = request.getParameter("noticeBarLimit");
		int noticeBarInfoNum = Integer.parseInt(num1);
		int noticeBarLimit = Integer.parseInt(num2);
		
		
		String condition = "update noticeBarInfo set noticeBarInfoLimit=? where noticeBarInfoNum="+noticeBarInfoNum;
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, noticeBarLimit);
			pre.executeUpdate();
			out.println("<SCRIPT language=javascript > alert('设置成功!');window.location='admin/noticeBar/noticeBarInfoLimit.jsp';</script>");			
		} catch (SQLException e) {
			out.println("<SCRIPT language=javascript > alert('设置失败!');window.location='admin/noticeBar/noticeBarInfoLimit.jsp';</script>");			
			e.printStackTrace();
		}finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/noticeBar/noticeBarInfoLimit.jsp");
		dispatcher.forward(request, response);
	}
}
