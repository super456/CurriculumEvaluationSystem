package admin.servlet.teacher;

import java.io.IOException;
import java.io.PrintWriter;
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



public class UpdateTeaServlet extends HttpServlet {

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
		
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		String tableName = request.getParameter("tableName");
		String [] mess = tableName.split("[-/]");
		
		String num = request.getParameter("teaNum");
		
		String teaName = request.getParameter("teaName");
		String teaSex = request.getParameter("teaSex");
		String birthday = request.getParameter("teaBirthday");
		String teaForm = request.getParameter("teaForm");
		String phone = request.getParameter("teaPhone");
		String teaRemarks = request.getParameter("teaRemarks");
		
		int teaNum = Integer.parseInt(num);
		int teaPhone = Integer.parseInt(phone);
		String [] str = birthday.split("[-/]");
		int year = Integer.parseInt(str[0]);
		int month = Integer.parseInt(str[1]);
		int day = Integer.parseInt(str[2]);
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month-1,day);
		Date teaBirthday = new java.sql.Date(calendar.getTimeInMillis());

		PrintWriter out = response.getWriter();
		String sql = "update userLogin set userName=? where accountNum="+teaNum;
		String condition = "update teaInfo set teaName=?,teaSex=?,teaBirthday=?,teaFrom=?,teaPhone=?,teaRemarks=? where teaNum="+teaNum;
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setString(1, teaName);
			pre.setString(2, teaSex);
			pre.setDate(3, teaBirthday);
			pre.setString(4, teaForm);
			pre.setInt(5, teaPhone);
			pre.setString(6, teaRemarks);
			pre.executeUpdate();
			pre = con.prepareStatement(sql);
			pre.setString(1, teaName);
			pre.executeUpdate();
			if(mess[1].equals("teacher"))
			    out.println("<SCRIPT language=javascript > alert('修改成功!');window.location='admin/teacher/showTeaInfo.jsp';</script>");
			else
				out.println("<SCRIPT language=javascript > alert('修改成功!');window.location='teacher/personInfo/viewTeaInfo.jsp';</script>");
		} catch (SQLException e) {
			if(mess[1].equals("teacher"))
			    out.println("<SCRIPT language=javascript > alert('修改失败!');window.location='admin/teacher/showTeaInfo.jsp';</script>");
			else
				out.println("<SCRIPT language=javascript > alert('修改失败!');window.location='teacher/personInfo/viewTeaInfo.jsp';</script>");
			e.printStackTrace();
		}finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		//RequestDispatcher dispatcher = request.getRequestDispatcher(tableName);
		//dispatcher.forward(request, response);
	}

}
