package teacher.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teacher.bean.TeaPraiseListSqlBean;

public class SelectByTeaPraise extends HttpServlet{

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
		
		String couTerm = request.getParameter("couTerm");
		String select = request.getParameter("select");
		String userInfo = request.getParameter("userInfo");	    
		String condition = "select teaPraiseListNum,teaPraiseListInfo.couNum,couName,"
			+ "teaPraiseListInfo.teaNum,teaName,couFrom,theAllAvgScore from teaPraiseListInfo "
			+ "inner join courseInfo on teaPraiseListInfo.couNum=courseInfo.couNum inner join "
			+ "teaInfo on teaPraiseListInfo.teaNum=teaInfo.teaNum where teaPraiseListInfo.couTerm='"
			+ couTerm + "' and "+select+" like '%"+userInfo+"%'";
		
		TeaPraiseListSqlBean teaPraise = new TeaPraiseListSqlBean();
		teaPraise.startCon();
		List list = teaPraise.viewAllTeaPraise(condition);
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("teacher/teaPraise/selectTeaPraise.jsp");
		dispatcher.forward(request, response);
	}
}
