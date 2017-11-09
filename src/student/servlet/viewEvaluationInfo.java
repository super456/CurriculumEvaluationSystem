package student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import publicConnectSql.connectSql;

public class viewEvaluationInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public viewEvaluationInfo() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		HttpSession session=request.getSession(true);
		String userNum=(String) session.getAttribute("accountNum");//获取学生账号
		int accountNum=Integer.parseInt(userNum);
		String cT=request.getParameter("couTerm");//获取查询的学期，默认为171802，即2017-2018第二学期
		int couTerm=Integer.parseInt(cT);
		
		String condition = "select courseInfo.couName,teaInfo.teaName,courseInfo.couTime,courseInfo.couPlace,courseInfo.couCredit,couClassStuInfo.isTeach from courseInfo,couClassStuInfo,teaInfo where couClassStuInfo.stuNum='"+accountNum+"' and couClassStuInfo.couNum=courseInfo.couNum and courseInfo.couTerm='"+couTerm+"' and courseInfo.teaNum=teaInfo.teaNum";
		connectSql conSql=new connectSql();
		conSql.StartCon();
		java.util.List list=conSql.showStuViewEvaluationInfo(condition);
		response.sendRedirect("student/evaluation/index.jsp?listInfo=list");//跳转到学生查看课程评教信息页面
		
		
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

			doGet(request, response);
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
