package student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import publicConnectSql.connectSql;

public class handleComCard extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public handleComCard() {
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
		
		//获取传递过来的表单参数值
		String radio1=request.getParameter("1");//获取评教卡表单第一项分数
		int a1=Integer.parseInt(radio1);
		String radio2=request.getParameter("2");//获取评教卡表单第二项分数
		int a2=Integer.parseInt(radio2);
		String radio3=request.getParameter("3");
		int a3=Integer.parseInt(radio3);
		String radio4=request.getParameter("4");
		int a4=Integer.parseInt(radio4);
		String radio5=request.getParameter("5");
		int a5=Integer.parseInt(radio5);
		String radio6=request.getParameter("6");
		int a6=Integer.parseInt(radio6);
		String radio7=request.getParameter("7");
		int a7=Integer.parseInt(radio7);
		String radio8=request.getParameter("8");
		int a8=Integer.parseInt(radio8);
		String radio9=request.getParameter("9");
		int a9=Integer.parseInt(radio9);
		String radio10=request.getParameter("10");
		int a10=Integer.parseInt(radio10);
		String comLeaMsg=request.getParameter("stuLeaveMsg");//获取评教卡表单留言信息

		
		//处理评教卡信息
		String couName=request.getParameter("couName");//获取课程名
		String teaName=request.getParameter("teaName");//获取教师名
		HttpSession session=request.getSession(true);
		int stuNum=(Integer)session.getAttribute("accountNum");//获取学生账号
		
		int comTotalScore=a1+a2+a3+a4+a5+a6+a7+a8+a9+a10;//计算评教总分数
		String SComTotalScore=""+comTotalScore;
		float fComTotalScore=Float.parseFloat(SComTotalScore);
		float comAvgScore=fComTotalScore/10;//计算平均分数
		
		connectSql conSql=new connectSql();
		conSql.StartCon();
		String sqlCouNum="select couNum from courseInfo where couName='"+couName+"'";
		int couNum=conSql.intQuery(sqlCouNum);//获取课程编号
		conSql.StartCon();
		String sqlTeaNum="select teaNum from teaInfo where teaName='"+teaName+"'";
		int teaNum=conSql.intQuery(sqlTeaNum);//获取教师编号
		
		//验证判断信息
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		//将评教卡信息插入评教课程信息表，指定添加字段列数据
		String sqlCommentCouInfo="insert into commentCouInfo (couNum,stuNum,comFirstScore,comSecondScore,comThirdScore,comFourthScore,comFifthScore,comSixthScore,comSeventhScore,comEighthScore,comNinthScore,comTenthScore,comLeaMsg,comTotalScore,comAvgScore) values('"+couNum+"' , '"+stuNum+"' , '"+a1+"' , '"+a2+"' , '"+a3+"' , '"+a4+"' , '"+a5+"' , '"+a6+"' , '"+a7+"' , '"+a8+"' , '"+a9+"' , '"+a10+"' , '"+comLeaMsg+"' , '"+comTotalScore+"' , '"+comAvgScore+"')";
		conSql.StartCon();
		int judgeCommentCouInfo=0;//判断评教信息表数据是否插入成功
		judgeCommentCouInfo=conSql.insertUpdate(sqlCommentCouInfo);
		if (judgeCommentCouInfo==0) {
			//判断评教信息表数据是否插入成功
			out.println("<SCRIPT language=javascript > alert('评教信息表数据插入有误！');</script>"); 
			return;
		}
		
		//将学生班级信息表的isTeach：0改为1
		String updataCouClassStuInfo="update couClassStuInfo set isTeach=1 where couNum='"+couNum+"' and stuNum='"+stuNum+"'";
		conSql.StartCon();
		int judgeCouClassStuInfo=0;//判断学生班级信息表数据是否更新成功
		judgeCouClassStuInfo=conSql.insertUpdate(updataCouClassStuInfo);
		if (judgeCouClassStuInfo==0) {
			//判断学生班级信息表数据是否更新成功
			out.println("<SCRIPT language=javascript > alert('学生班级信息表数据插入有误！');</script>"); 
			return;
		}
		
		//将教师好评表指定教师对应的课程，修改总评教平均分数
		String getAllStuCouAvgScore="select comAvgScore from commentCouInfo where couNum='"+couNum+"'";//获取该门课的每一个学生评教的平均分
		conSql.StartCon();
		float newTheAllAvgScore=conSql.SumStuAvgCou(getAllStuCouAvgScore);//获取该门课已评教学生评教总分的人数的平均分数
		String updateTeaPraiseListInfo="update teaPraiseListInfo set theAllAvgScore='"+newTheAllAvgScore+"'where couNum='"+couNum+"'";
		conSql.StartCon();
		int judgeUpdataTeaPraiseListInfo=conSql.insertUpdate(updateTeaPraiseListInfo);//判断教师好评表数据是否插入成功
		if (judgeUpdataTeaPraiseListInfo==0) {
			//判断教师好评表数据是否插入成功
			out.println("<SCRIPT language=javascript > alert('教师好评表数据插入有误！');</script>"); 
			return;
		}
		
		//一切正常则执行到这里
		response.sendRedirect("student/evaluation/index.jsp?couTerm=171802");
			
	
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
