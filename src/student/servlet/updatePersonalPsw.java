package student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import publicConnectSql.connectSql;

public class updatePersonalPsw extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public updatePersonalPsw() {
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
		String oldPsw=request.getParameter("oldPsw");//获取旧密码
		String newPsw=request.getParameter("newPsw");//获取新密码
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		connectSql conSql=new connectSql();
		conSql.StartCon();
		String checkOldPsw="select * from userLogin where password='"+oldPsw+"' and accountNum='"+stuNum+"'";
		boolean judgeIsOldPsw=conSql.loginQuery(checkOldPsw);//判断旧密码是否输入正确
		if (judgeIsOldPsw) {
			String updatePsw="update userLogin set password='"+newPsw+"' where accountNum='"+stuNum+"'";
			conSql.StartCon();
			int judge=conSql.insertUpdate(updatePsw);
			if (judge==1) {
				out.println("<script language=javascript>alert('密码修改成功~');window.history.back();</script>");
			}else {
				out.println("<script language=javascript>alert('密码修改失败，请重新操作！');window.history.back();</script>");
			}
			out.close();
		}else {
			out.println("<script language=javascript>alert('旧密码输入有误，请重新输入！');window.history.back();</script>");
			out.close();
		}
		
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
