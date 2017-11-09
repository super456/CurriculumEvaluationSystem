package admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddComCon extends HttpServlet{

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
		
		String theFirstCon = request.getParameter("theFirstCon");
		String theSecondtCon = request.getParameter("theSecondCon");
		String theThirdCon = request.getParameter("theThirdCon");
		String theFourthCon = request.getParameter("theFourthCon");
		String theFifthCon = request.getParameter("theFifthCon");
		String theSixthCon = request.getParameter("theSixthCon");
		String theSeventhCon = request.getParameter("theSeventhCon");
		String theEighthCon = request.getParameter("theEighthCon");
		String theNinthCon = request.getParameter("theNinthCon");
		String theTenthCon = request.getParameter("theTenthCon");
		String comConRemarks = request.getParameter("comConRemarks");

		String condition = "insert into commentContent(theFirstCon,theSecondCon,theThirdCon,theFourthCon,theFifthCon," +
		"theSixthCon,theSeventhCon,theEighthCon,theNinthCon,theTenthCon,comConRemarks) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setString(1, theFirstCon);
			pre.setString(2, theSecondtCon);
			pre.setString(3, theThirdCon);
			pre.setString(4, theFourthCon);
			pre.setString(5, theFifthCon);
			pre.setString(6, theSixthCon);
			pre.setString(7, theSeventhCon);
			pre.setString(8, theEighthCon);
			pre.setString(9, theNinthCon);
			pre.setString(10,theTenthCon);
			pre.setString(11, comConRemarks);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/showComCon.jsp");
		dispatcher.forward(request, response);
	}
}
