package teacher.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import publicConnectSql.connectSql;

public class viewNoticeBarContent extends HttpServlet {

	public viewNoticeBarContent() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		
		String nBN=request.getParameter("noticeBarNum");//获取请求的通告栏文章编号
		int noticeBarNum=Integer.parseInt(nBN);
		
		String condition = "select * from noticeBarInfo where noticeBarInfoNum='"+noticeBarNum+"'";
		
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			rs = pre.executeQuery();
			while(rs.next()){
				request.setAttribute("title", rs.getString(2));
				request.setAttribute("releaseTime", rs.getDate(3));
				request.setAttribute("author", rs.getString(4));
				request.setAttribute("content", rs.getString(5));
			}
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("teacher/noticeBarList/index.jsp");
		dispatcher.forward(request, response);

		
		
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

}
