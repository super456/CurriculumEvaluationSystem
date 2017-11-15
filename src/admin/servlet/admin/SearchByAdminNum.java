package admin.servlet.admin;

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

import admin.bean.admin.AdminInfo;

public class SearchByAdminNum extends HttpServlet{

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
		
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		String num = request.getParameter("adminNum");		
		int adminNum = Integer.parseInt(num);
		AdminInfo adminbean = new AdminInfo();
		String condition = "select * from adminInfo where adminNum=?";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, adminNum);
			rs = pre.executeQuery();
			while(rs.next()){
				request.setAttribute("adminNum", rs.getInt(1));
				request.setAttribute("adminName", rs.getString(2));
				request.setAttribute("adminPhone", rs.getInt(3));
				request.setAttribute("adminLimit", rs.getInt(4));
				request.setAttribute("adminRemarks", rs.getString(5));
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/adminInfo/updateAdminInfo.jsp");
		dispatcher.forward(request, response);
	}
}
