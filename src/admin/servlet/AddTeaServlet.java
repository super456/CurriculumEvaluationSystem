package admin.servlet;

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

public class AddTeaServlet extends HttpServlet {

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
		
		String num = request.getParameter("teaNum");
		String teaName = request.getParameter("teaName");
		String teaSex = request.getParameter("teaSex");
		String birthday = request.getParameter("teaBirthday");
		String teaForm = request.getParameter("teaForm");
		String phone = request.getParameter("teaPhone");
		String teaRemarks = request.getParameter("teaRemarks");
		if(num.length()==0 || num==null){
			response.sendRedirect("admin/addTeaInfo.jsp");
		}
		
		int teaNum = Integer.parseInt(num);
		int teaPhone = Integer.parseInt(phone);
		String [] str = birthday.split("[-/]");
		int year = Integer.parseInt(str[0]);
		int month = Integer.parseInt(str[1]);
		int day = Integer.parseInt(str[2]);
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month-1,day);
		Date teaBirthday = new java.sql.Date(calendar.getTimeInMillis());
		String condition = "insert into teaInfo values(?,?,?,?,?,?,?)";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, teaNum);
			pre.setString(2, teaName);
			pre.setString(3, teaSex);
			pre.setDate(4, teaBirthday);
			pre.setString(5, teaForm);
			pre.setInt(6, teaPhone);
			pre.setString(7, teaRemarks);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/addTeaInfo.jsp");
		dispatcher.forward(request, response);
	}

}
