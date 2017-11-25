package admin.servlet.commentCourse;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.bean.commentCourse.CouClassStuSqlBean;

public class BackToTeaPraise extends HttpServlet{

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
		
		String term = request.getParameter("couTerm");
		int couTerm = Integer.parseInt(term);
		String tableName = request.getParameter("tableName");
		if(tableName.equals("admin/commentCourse/showTeaPraiseListInfo.jsp"))
			tableName = "admin/commentCourse/showTeaPraiseListInfo.jsp?couTerm=<%=couTerm %>";
		else if(tableName.equals("admin/commentCourse/showCouClassStuInfo.jsp"))
			tableName = "admin/commentCourse/showCouClassStuInfo.jsp?couTerm=<%=couTerm %>";
		else if(tableName.equals("teacher/commentCourse/viewCommentResult.jsp"))
			tableName = "teacher/commentCourse/viewCommentResult.jsp?couTerm=<%=couTerm %>";
		request.getRequestDispatcher(tableName).forward(request, response);
	}
}
