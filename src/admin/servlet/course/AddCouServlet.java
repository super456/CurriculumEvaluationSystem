package admin.servlet.course;

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

public class AddCouServlet extends HttpServlet {

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
		
		String cNum = request.getParameter("couNum");
		String tNum = request.getParameter("teaNum");
		String couName = request.getParameter("couName");
		String term = request.getParameter("couTerm");
		String couFrom = request.getParameter("couFrom");
		String couTime = request.getParameter("couTime");
		String couPlace = request.getParameter("couPlace");
		String credit = request.getParameter("couCredit");
		String couRemarks = request.getParameter("couRemarks");
		if(cNum==null || cNum.length()==0){
		   response.sendRedirect("addCourseInfo.jsp");	
		}
		
		int couNum = Integer.parseInt(cNum);
		int teaNum = Integer.parseInt(tNum);
		int couTerm = Integer.parseInt(term);
		int couCredit = Integer.parseInt(credit);
		String condition = "insert into courseInfo values(?,?,?,?,?,?,?,?,?)";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, couNum);
			pre.setInt(2, teaNum);
			pre.setString(3, couName);
			pre.setInt(4, couTerm);
			pre.setString(5, couFrom);
			pre.setString(6, couTime);
			pre.setString(7, couPlace);
			pre.setInt(8, couCredit);
			pre.setString(9, couRemarks);
			pre.executeUpdate();
			if(couTerm == 171801)
			  out.println("<SCRIPT language=javascript > alert('添加成功!');window.location='admin/course/showCourseInfo.jsp?couTerm=171801';</script>");		
			else
			  out.println("<SCRIPT language=javascript > alert('添加成功!');window.location='admin/course/showCourseInfo.jsp?couTerm=171802';</script>");		
		} catch (SQLException e) {
			if(couTerm == 171801)
			  out.println("<SCRIPT language=javascript > alert('添加失败!');window.location='admin/course/addCourseInfo.jsp?couTerm=171801';</script>");	
			else
			  out.println("<SCRIPT language=javascript > alert('添加失败!');window.location='admin/course/addCourseInfo.jsp?couTerm=171802';</script>");			
			e.printStackTrace();
		}finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		//RequestDispatcher dispatcher = request.getRequestDispatcher("admin/course/showCourseInfo.jsp");
		//dispatcher.forward(request, response);
	}

}
