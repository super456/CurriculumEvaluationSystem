package admin.servlet.student;

import java.io.IOException;
import java.io.PrintWriter;
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


public class DeleteStuServlet extends HttpServlet {

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
		
		String num = request.getParameter("stuNum");	
		int stuNum = Integer.parseInt(num);

		PrintWriter out = response.getWriter();
		String condition = "delete from stuInfo where stuNum=?";
		String sql = "delete from userLogin where accountNum=?";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, stuNum);
			pre.executeUpdate();
			pre = con.prepareStatement(sql);
			pre.setInt(1, stuNum);
			pre.executeUpdate();
			out.println("<SCRIPT language=javascript > alert('删除成功!');window.location='admin/student/showStuInfo.jsp';</script>");
		} catch (SQLException e) {
			out.println("<SCRIPT language=javascript > alert('删除失败!');window.location='admin/student/showStuInfo.jsp';</script>");
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
