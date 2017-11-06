package admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.bean.AdminSqlBean;
import admin.bean.StuSqlBean;

public class SelectByAdminInfo extends HttpServlet{

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
		response.setContentType("text/html");
		
		
		String select = request.getParameter("select");
		String userInfo = request.getParameter("userInfo");	    
		String condition = "select * from adminInfo where "+select+" like '%"+userInfo+"%'";
		
		AdminSqlBean admin = new AdminSqlBean();
		List list = admin.showAllAdmin(condition);
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/selectAdminInfo.jsp");
		dispatcher.forward(request, response);
	}
}
