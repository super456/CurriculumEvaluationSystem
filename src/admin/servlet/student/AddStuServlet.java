package admin.servlet.student;

import java.io.IOException;
import java.io.PrintWriter;

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

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pre = null;

		PrintWriter out = response.getWriter();
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
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
			out.println("<SCRIPT language=javascript > alert('添加失败,请输入学生编号!');window.location='admin/student/addStuInfo.jsp';</script>");
			//response.sendRedirect("admin/student/addStuInfo.jsp");
		}
		
		int stuNum = Integer.parseInt(num);
		int stuGrade = Integer.parseInt(grade);
		int stuPhone = Integer.parseInt(phone);
		
		int pwd = 123456 ;
		String userType = "学生";
		int perLimit = 0;
		String condition = "insert into stuInfo values(?,?,?,?,?,?,?)";
		String sql = "insert into userLogin values(?,?,?,?,?)";
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
			pre = con.prepareStatement(sql);
			pre.setInt(1, stuNum);
			pre.setString(2, stuName);
			pre.setInt(3, pwd);
			pre.setString(4, userType);
			pre.setInt(5, perLimit);
			pre.executeUpdate();
			out.println("<SCRIPT language=javascript > alert('添加成功!');window.location='admin/student/showStuInfo.jsp';</script>");			
		} catch (SQLException e) {
			out.println("<SCRIPT language=javascript > alert('添加失败!');window.location='admin/student/addStuInfo.jsp';</script>");
			e.printStackTrace();
		}finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		//RequestDispatcher dispatcher = request.getRequestDispatcher("admin/student/showStuInfo.jsp");
		//dispatcher.forward(request, response);
	}

}
