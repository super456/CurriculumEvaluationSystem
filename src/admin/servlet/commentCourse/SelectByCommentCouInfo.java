package admin.servlet.commentCourse;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.bean.commentCourse.CommentCouSqlBean;


public class SelectByCommentCouInfo extends HttpServlet{

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		String num1 = request.getParameter("stuNum");
		String num2 = request.getParameter("couNum");
		int stuNum  = Integer.parseInt(num1);
		int couNum = Integer.parseInt(num2);
		String condition = "select * from commentCouInfo where couNum like '"+couNum+"' and stuNum like '"+stuNum+"'";
		CommentCouSqlBean commentCou = new CommentCouSqlBean();
		List list = commentCou.showAllCommentCou(condition);
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/commentCourse/selectCommentCouInfo.jsp");
		dispatcher.forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html");
		
		String select = request.getParameter("select");
		String userInfo = request.getParameter("userInfo");	    
		String condition = "select * from commentCouInfo where "+select+" like '%"+userInfo+"%'";
		CommentCouSqlBean commentCou = new CommentCouSqlBean();
		List list = commentCou.showAllCommentCou(condition);
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/commentCourse/selectCommentCouInfo.jsp");
		dispatcher.forward(request, response);
	}
}
