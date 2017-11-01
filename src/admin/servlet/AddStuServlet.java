package admin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class AddStuServlet extends HttpServlet {

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

		
		String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		String num = request.getParameter("stuNum");
		String stuName = request.getParameter("stuName");
		String stuSex = request.getParameter("stuSex");
		String grade = request.getParameter("stuGrade");
		String stuForm = request.getParameter("stuForm");
		String phone = request.getParameter("stuPhone");
		String stuRemarks = request.getParameter("stuRemarks");
		if(num.length()==0 || num==null){
			response.sendRedirect("admin/addStuInfo.jsp");
		}
		
		int stuNum = Integer.parseInt(num);
		int stuGrade = Integer.parseInt(grade);
		int stuPhone = Integer.parseInt(phone);
		String condition = "insert into stuInfo values(?,?,?,?,?,?,?)";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, stuNum);
			pre.setString(2, stuName);
			pre.setString(3, stuSex);
			pre.setInt(4, stuGrade);
			pre.setString(5, stuForm);
			pre.setInt(6, stuPhone);
			pre.setString(7, stuRemarks);
			pre.executeUpdate();
		} catch (SQLException e) {
			System.out.print("≤Â»Î ß∞‹!");
			e.printStackTrace();
		}finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/addStuInfo.jsp");
		dispatcher.forward(request, response);
	}

}
