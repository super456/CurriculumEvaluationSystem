package admin.servlet;

import java.io.IOException;
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

import admin.bean.NoticeBarInfo;

public class SearchByNoticeNum extends HttpServlet{

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
		NoticeBarInfo noticeBean = new NoticeBarInfo();
		
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		String num = request.getParameter("noticeBarInfoNum");		
		int noticeBarInfoNum = Integer.parseInt(num);
		String tableName = request.getParameter("tableName");
		
		String condition = "select * from noticeBarInfo where noticeBarInfoNum=?";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, noticeBarInfoNum);
			rs = pre.executeQuery();
			while(rs.next()){
				noticeBean.setNoticeBarInfoNum(rs.getInt(1));
				noticeBean.setTitle(rs.getString(2));
				noticeBean.setReleaseTime(rs.getDate(3));
				noticeBean.setAuthor(rs.getString(4));
				noticeBean.setContent(rs.getString(5));
				noticeBean.setNoticeBarInfoLimit(rs.getInt(6));
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
		request.setAttribute("noticeBean", noticeBean);
		RequestDispatcher dispatcher = request.getRequestDispatcher(tableName);
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.sendRedirect("admin/showNoticeBarInfo.jsp");
	}
}
