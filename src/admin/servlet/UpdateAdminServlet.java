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

public class UpdateAdminServlet extends HttpServlet{

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
		
		String num = request.getParameter("adminNum");
		String adminName = request.getParameter("adminName");
		String limit = request.getParameter("adminLimit");
		String phone = request.getParameter("adminPhone");
		String adminRemarks = request.getParameter("adminRemarks");
		
		int adminNum = Integer.parseInt(num);
		int adminPhone = Integer.parseInt(phone);
		int adminLimit = Integer.parseInt(limit);

		String sql = "update userLogin set userName=? where accountNum="+adminNum;
		String condition = "update adminInfo set adminName=?,adminPhone=?,adminLimit=?,adminRemarks=? where adminNum="+adminNum;
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setString(1, adminName);
			pre.setInt(2, adminPhone);
			pre.setInt(3, adminLimit);
			pre.setString(4, adminRemarks);
			pre.executeUpdate();
			pre = con.prepareStatement(sql);
			pre.setString(1, adminName);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/showAdminInfo.jsp");
		dispatcher.forward(request, response);
	}
}
