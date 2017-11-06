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

import admin.bean.StuInfo;

public class SearchByStuNum extends HttpServlet{

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
		StuInfo stuBean = new StuInfo();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		String num = request.getParameter("stuNum");		
		int stuNum = Integer.parseInt(num);
		String tableName = request.getParameter("tableName");
		String condition = "select * from stuInfo where stuNum=?";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, stuNum);
			rs = pre.executeQuery();
			while(rs.next()){
				request.setAttribute("stuNum",rs.getInt(1));
				request.setAttribute("stuName", rs.getString(2));
				request.setAttribute("stuSex", rs.getString(3));
				request.setAttribute("stuGrade", rs.getInt(4));
				request.setAttribute("stuForm", rs.getString(5));
				request.setAttribute("stuPhone", rs.getInt(6));
				String stuRemarks = rs.getString(7);
				if(stuRemarks==null){
					stuRemarks="";
				}
				request.setAttribute("stuRemarks", stuRemarks);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher(tableName);
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("admin/showCouClassStuInfo.jsp");
	}
}
