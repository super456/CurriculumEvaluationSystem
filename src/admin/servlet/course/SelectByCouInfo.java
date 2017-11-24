package admin.servlet.course;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.bean.course.CourseInfo;

public class SelectByCouInfo extends HttpServlet{

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
		
		
		String num = request.getParameter("couTerm");		
		int couTerm = Integer.parseInt(num);
		String select = request.getParameter("select");
		String userInfo = request.getParameter("userInfo");
		if(select.equals("teaNum"))
		   select = "teaInfo.teaNum";
		request.setAttribute("select", select);
		request.setAttribute("userInfo", userInfo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/course/selectByCouInfo.jsp?couTerm=<%=couTerm %>");
		dispatcher.forward(request, response);
	}
}
