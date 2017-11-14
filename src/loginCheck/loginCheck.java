package loginCheck;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import publicConnectSql.connectSql;
import loginCheck.*;

public class loginCheck extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public loginCheck() {
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
		  request.setCharacterEncoding("UTF-8");//设置编码，处理汉字信息
		  //设置登录失败的返回信息流
		  response.setContentType("text/html;charset=utf-8");
		  PrintWriter out = response.getWriter();
		  request.setCharacterEncoding("utf-8");//设置编码，处理汉字信息
		  //设置登录失败的返回信息流
		  userInfo userinfo=null;//
		  HttpSession session=request.getSession(true);//启动用户独自的session对象
		  try {//防止空对象产生运用，创建javabean对象，并存储为session对象中
			userinfo=(userInfo)session.getAttribute("userinfo");//
			if (userinfo==null) {
				userinfo=new userInfo();
				session.setAttribute("userinfo", userinfo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			userinfo=new userInfo();
			session.setAttribute("userinfo", userinfo);
		}
		
		int accountNum=Integer.parseInt(request.getParameter("accountNum"));
		String userPassword=request.getParameter("userPassword");
		String loginIdentity=request.getParameter("select");
		session.setAttribute("loginIdentity", loginIdentity);//绑定存储session对象用户的登录身份
		//数据库查询验证账号密码
		String sqlString= "Select*from userLogin where accountNum='" + accountNum
		+ "'and password='" + userPassword + "'and userType='"+loginIdentity+"'";
		connectSql conSql=new connectSql();
		conSql.StartCon();//启动连接数据库
		boolean result=conSql.loginQuery(sqlString);
		if (result) {
			//账号、密码、身份三者通过数据库信息验证
			//获取查询数据库的该用户的用户名
			String sqlString2="Select userName from userLogin where accountNum='" + accountNum + "'";
			conSql.StartCon();//启动连接数据库
			String userName=conSql.execQuery(sqlString2);
			session.setAttribute("accountNum", accountNum);//绑定存储session对象的用户账号
			session.setAttribute("userName", userName);//绑定存储session对象的用户的用户名
			//根据用户选择的登录身份，跳转相应的界面
			if (loginIdentity.equals("学生")) {
				response.sendRedirect("student/index.jsp");
			}else if (loginIdentity.equals("教师")) {
				response.sendRedirect("teacher/index.jsp");
			}else {
				response.sendRedirect("admin");
			}
	
		}else {
			//账号、密码、登录身份未通过数据库信息验证
		//	out.println("<SCRIPT language=javascript > alert('用户名或密码或者登录身份不正确，请重新输入！');window.location='index.jsp';</script>"); 
			out.println("<SCRIPT language=javascript > alert('用户名或密码或者登录身份不正确，请重新输入！');window.history.back();</script>"); 
			return;
		}
		
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		
	}

}
