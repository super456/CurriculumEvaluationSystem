package teacher.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateTeaPwd extends HttpServlet{

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
		
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(true);
		int accountNum=(Integer)session.getAttribute("accountNum");//获取账号
		
		String tableName = request.getParameter("tableName");
		String[] mess = tableName.split("[-/]");
		String oldPassword = (String)session.getAttribute("oldPassword");
		String oldPwd = request.getParameter("oldPwd");
		String newPassword = request.getParameter("newPassword");
		String confirmNewPassword = request.getParameter("confirmNewPassword");
		
		String condition = "update userLogin set password=? where accountNum="+accountNum;
		
		if(!oldPassword.equals(oldPwd)){
			if(mess[0].equals("teacher"))
				 out.println("<SCRIPT language=javascript > alert('密码错误,请重新输入!');window.location='teacher/personInfo/changeTeaPwd.jsp';</script>"); 
			else
				 out.println("<SCRIPT language=javascript > alert('密码错误,请重新输入!');window.location='admin/personInfo/changeAdminPwd.jsp';</script>"); 
		}
		if(!newPassword.equals(confirmNewPassword)){
			if(mess[0].equals("teacher"))
				 out.println("<SCRIPT language=javascript > alert('密码错误,请重新输入!');window.location='teacher/personInfo/changeTeaPwd.jsp';</script>"); 
			else
				 out.println("<SCRIPT language=javascript > alert('密码错误,请重新输入!');window.location='admin/personInfo/changeAdminPwd.jsp';</script>"); 
		}
		
		try {			
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setString(1, newPassword);
			pre.executeUpdate();
			if(mess[0].equals("teacher"))
			 out.println("<SCRIPT language=javascript > alert('修改成功!');window.location='teacher/personInfo/changeTeaPwd.jsp';</script>"); 
			else if(mess[0].equals("admin"))
			 out.println("<SCRIPT language=javascript > alert('修改成功!');window.location='admin/personInfo/changeAdminPwd.jsp';</script>"); 
		} catch (SQLException e) {
			if(mess[0].equals("teacher"))
				 out.println("<SCRIPT language=javascript > alert('修改失败!');window.location='teacher/personInfo/changeTeaPwd.jsp';</script>"); 
			else if(mess[0].equals("admin"))
				 out.println("<SCRIPT language=javascript > alert('修改失败!');window.location='admin/personInfo/changeAdminPwd.jsp';</script>"); 
			e.printStackTrace();
		}finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		//RequestDispatcher dispatcher = request.getRequestDispatcher("teacher/personInfo/changeTeaPwd.jsp");
		//dispatcher.forward(request, response);
	}
}
