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
import admin.bean.course.CourseSqlBean;


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
		String term = request.getParameter("couTerm");
		int couTerm = Integer.parseInt(term);
		int stuNum  = Integer.parseInt(num1);
		int couNum = Integer.parseInt(num2);
		String tableName = "admin/commentCourse/showCouClassStuInfo.jsp";
		String condition = "select * from commentCouInfo inner join courseInfo on commentCouInfo.couNum=courseInfo.couNum inner " +
				"join stuInfo on commentCouInfo.stuNum=stuInfo.stuNum where commentCouInfo.couNum = "+couNum+" and " +
						"commentCouInfo.stuNum = "+stuNum+" and couTerm="+couTerm;
		CommentCouSqlBean commentCou = new CommentCouSqlBean();
		commentCou.startCon();
		List list = commentCou.showCommentCouDetail(condition);
		String sql = "select couNum,teaInfo.teaNum,teaName,couName,couTerm,couFrom,couTime,couPlace,couCredit,couRemarks from CourseInfo inner join teaInfo on CourseInfo.teaNum=teaInfo.teaNum where couTerm="+couTerm+" and couNum = "+couNum+" order by couFrom,teaNum";
		CourseSqlBean course = new CourseSqlBean();
		course.startCon();
		List list1 = course.showAllCou(sql);	
		
		request.setAttribute("tableName", tableName);
		request.setAttribute("list1", list1);
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/commentCourse/showCouClassDetail.jsp?couTerm=<%=couTerm %>");
		dispatcher.forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		String tableName = request.getParameter("tableName");
		String select = request.getParameter("select");
		String userInfo = request.getParameter("userInfo");	    
		String term = request.getParameter("couTerm");
		int couTerm = Integer.parseInt(term);
		String condition;
		if(select.equals("couNum"))
			select = "courseInfo.couNum";
		if(select.equals("stuNum"))
			select = "commentCouInfo.stuNum";
		request.setAttribute("select", select);
		request.setAttribute("userInfo", userInfo);
		
		if(tableName.equals("admin/commentCourse/showTeaPraiseDetail.jsp")){	
		String name = "admin/commentCourse/showTeaPraiseListInfo.jsp";
		request.setAttribute("tableName", name);
		tableName = "admin/commentCourse/showTeaPraiseDetail.jsp?couTerm=<%=couTerm %>";
		}
		else{
			tableName = "admin/commentCourse/selectCommentCouInfo.jsp?couTerm=<%=couTerm %>";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(tableName);
		dispatcher.forward(request, response);
	}
}
