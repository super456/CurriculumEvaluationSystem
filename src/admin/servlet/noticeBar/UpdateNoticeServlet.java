package admin.servlet.noticeBar;

import java.io.IOException;
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

public class UpdateNoticeServlet extends HttpServlet{

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

		request.setCharacterEncoding("gb2312");
		Connection con = null;
		PreparedStatement pre = null;
		
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		String num1 = request.getParameter("noticeBarInfoNum");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		String num2 = request.getParameter("noticeBarLimit");
		int noticeBarInfoNum = Integer.parseInt(num1);
		int noticeBarLimit = Integer.parseInt(num2);
		
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR); 
		int month = calendar.get(Calendar.MONTH); 
		int day = calendar.get(Calendar.DATE); 
		calendar.set(year, month,day);
		Date releaseTime = new java.sql.Date(calendar.getTimeInMillis());
		
		String condition = "update noticeBarInfo set title=?,releaseTime=?,author=?,content=?,noticeBarInfoLimit=? where noticeBarInfoNum="+noticeBarInfoNum;
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setString(1, title);
			pre.setDate(2, releaseTime);
			pre.setString(3, author);
			pre.setString(4, content);
			pre.setInt(5, noticeBarLimit);
			pre.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/noticeBar/showNoticeBarInfo.jsp");
		dispatcher.forward(request, response);
	}

}
