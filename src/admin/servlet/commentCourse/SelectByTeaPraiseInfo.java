package admin.servlet.commentCourse;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.bean.commentCourse.TeaPraiseListSqlBean;

public class SelectByTeaPraiseInfo extends HttpServlet{

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
		
		String select = request.getParameter("select");
		String userInfo = request.getParameter("userInfo");	    
		String condition = "select teaPraiseListNum,teaPraiseListInfo.couNum,couName,"+
        "teaPraiseListInfo.teaNum,teaName,teaPraiseListInfo.couTerm,theAllAvgScore from teaPraiseListInfo "+
        "inner join courseInfo on teaPraiseListInfo.couNum=courseInfo.couNum inner join "+
        "teaInfo on teaPraiseListInfo.teaNum=teaInfo.teaNum where "+select+" like '%"+userInfo+"%'";
		TeaPraiseListSqlBean teaPraise = new TeaPraiseListSqlBean();
		List list = teaPraise.showAllTeaPraise(condition);
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/commentCourse/selectTeaPraiseInfo.jsp");
		dispatcher.forward(request, response);
	}
}
