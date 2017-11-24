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

public class SelectByCouClassStuInfo extends HttpServlet{

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
		String num = request.getParameter("couTerm");
		int couTerm = Integer.parseInt(num);
		if(select.equals("couNum"))
			select = "courseInfo.couNum";
		if(select.equals("stuNum"))
			select = "stuInfo.stuNum";
		request.setAttribute("select", select);
		request.setAttribute("userInfo", userInfo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/commentCourse/selectCouClassStuInfo.jsp?couTerm=<%=couTerm %>");
		dispatcher.forward(request, response);
	}
}
