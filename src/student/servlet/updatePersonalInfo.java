package student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import publicConnectSql.connectSql;

public class updatePersonalInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public updatePersonalInfo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doDelete method of the servlet. <br>
	 *
	 * This method is called when a HTTP delete request is received.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doDelete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession(true);
		int stuNum=(Integer)session.getAttribute("accountNum");//获取学号
		String stuName=request.getParameter("stuName");
		String stuSex=request.getParameter("stuSex");
		String sStuGrade=request.getParameter("stuGrade");
		int stuGrade=Integer.parseInt(sStuGrade);
		String stuFrom=request.getParameter("stuFrom");
		String sStuPhone=request.getParameter("stuPhone");
		int stuPhone=Integer.parseInt(sStuPhone);
		String stuRemarks=request.getParameter("stuRemarks");
		
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		connectSql conSql=new connectSql();
		String sqlString="update  stuInfo set stuSex='"+stuSex+"',stuGrade='"+stuGrade+"',stuFrom='"+stuFrom+"',stuPhone='"+stuPhone+"',stuRemarks='"+stuRemarks+"' where stuNum='"+stuNum+"'";
		conSql.StartCon();
		int judge=conSql.insertUpdate(sqlString);
		if (judge==1) {
			out.println("<SCRIPT language=javascript > alert('修改个人信息成功~');window.history.back();</script>"); 
			//out.println("<SCRIPT language=javascript > alert('修改个人信息成功~');window.history.go(-2);</script>"); 
		}else{
			out.println("<SCRIPT language=javascript > alert('修改个人信息失败，请重新操作！');window.history.back();</script>"); 
			//response.sendRedirect("student/personalInfo/index.jsp");
		}
		
		
		
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
