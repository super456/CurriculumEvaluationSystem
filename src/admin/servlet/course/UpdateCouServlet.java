package admin.servlet.course;

import java.io.IOException;
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

public class UpdateCouServlet extends HttpServlet {

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
		
		int couNum = Integer.parseInt(cNum);
		int teaNum = Integer.parseInt(tNum);
		int couTerm = Integer.parseInt(term);
		int couCredit = Integer.parseInt(credit);
		
		String condition = "update courseInfo set teaNum=?,couName=?,couTerm=?,couFrom=?,couTime=?,couPlace=?,couCredit=?,couRemarks=? where couNum="+couNum;
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, teaNum);
			pre.setString(2, couName);
			pre.setInt(3, couTerm);
			pre.setString(4, couFrom);
			pre.setString(5, couTime);
			pre.setString(6, couPlace);
			pre.setInt(7, couCredit);
			pre.setString(8, couRemarks);
			pre.executeUpdate();
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/course/showCourseInfo.jsp");
		dispatcher.forward(request, response);
	}

}
