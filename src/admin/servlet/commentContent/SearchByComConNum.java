package admin.servlet.commentContent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.bean.commentContent.CommentContent;


public class SearchByComConNum extends HttpServlet{

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
		ResultSet rs = null;
		CommentContent comConBean = new CommentContent();
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		String num = request.getParameter("comConNum");
		int comConNum = Integer.parseInt(num);
		String condition = "select * from commentContent where comConNum=?";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, comConNum);
			rs = pre.executeQuery();
			while(rs.next()){
				comConBean.setComConNum(rs.getInt(1));
				comConBean.setTheFirstCon(rs.getString(2));
				comConBean.setTheSecondCon(rs.getString(3));
				comConBean.setTheThirdCon(rs.getString(4));
				comConBean.setTheFourthCon(rs.getString(5));
				comConBean.setTheFifthCon(rs.getString(6));
				comConBean.setTheSixthCon(rs.getString(7));
				comConBean.setTheSeventhCon(rs.getString(8));
				comConBean.setTheEighthCon(rs.getString(9));
				comConBean.setTheNinthCon(rs.getString(10));
				comConBean.setTheTenthCon(rs.getString(11));
				comConBean.setComConRemarks(rs.getString(12));
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
		request.setAttribute("comConBean", comConBean);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/commentContent/updateComCon.jsp");
		dispatcher.forward(request, response);
	}
}
