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

import admin.bean.CourseInfo;


public class SearchByCouNum extends HttpServlet{

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
		response.setCharacterEncoding("gb2312");
		CourseInfo couBean = new CourseInfo();
		
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		String num = request.getParameter("couNum");		
		int couNum = Integer.parseInt(num);
		
		String condition = "select * from courseInfo where couNum=?";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, couNum);
			rs = pre.executeQuery();
			while(rs.next()){
				couBean.setCouNum(rs.getInt(1));
				couBean.setTeaNum(rs.getInt(2));
				couBean.setCouName(rs.getString(3));
				couBean.setCouTerm(rs.getInt(4));
				couBean.setCouFrom(rs.getString(5));
				couBean.setCouTime(rs.getString(6));
				couBean.setCouPlace(rs.getString(7));
				couBean.setCouCredit(rs.getInt(8));
				String couRemarks = rs.getString(9);
				if(couRemarks==null){
					couRemarks="";
				}
				couBean.setCouRemarks(couRemarks);
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
		request.setAttribute("courseBean", couBean);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/updateCouInfo.jsp");
		dispatcher.forward(request, response);
	}
}
