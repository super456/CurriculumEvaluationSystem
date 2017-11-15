<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">

		<meta charset="gb2312">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

	</head>

	<body style="background-color: #FFF;">
	
	<!-- 判断用户是不是直接打开这个网址，而有没有通过登录界面登录 -->
		<%
			String userName = (String) session.getAttribute("userName");
			if (userName == null) {
		%>
		<script>
	    alert(" 您未登录，请从登录界面登录！");
	    //这个问题谨记，很实用
		top.location.href="index.jsp";
 		</script>
		<%
			}
		%>

		<table border=1 bgcolor="#ffffff" width=130%>
			<tr align="center">
				<td>
					评教课程编号
				</td>
				<td>
					课程编号
				</td>
				<td>
					学生编号
				</td>
				<td>
					评教时间
				</td>
				<td>
					first分数
				</td>
				<td>
					second分数
				</td>
				<td>
					third分数
				</td>
				<td>
					fourth分数
				</td>
				<td>
					fifth分数
				</td>
				<td>
					sixth分数
				</td>
				<td>
					seventh分数
				</td>
				<td>
					eighth分数
				</td>
				<td>
					ninth分数
				</td>
				<td>
					tenth分数
				</td>
				<td>
					总分数
				</td>
				<td>
					平均分数
				</td>
			</tr>
			<jsp:useBean id="commentCouBean" class="admin.bean.commentCourse.CommentCouInfo" />
			<jsp:useBean id="sqlBean" class="admin.bean.commentCourse.CommentCouSqlBean" />
			<%
			    String couNum = request.getParameter("couNum");
                String sql = "select * from commentCouInfo where couNum = '"+couNum+"'";
				java.util.List list = sqlBean.showAllCommentCou(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					commentCouBean = (admin.bean.commentCourse.CommentCouInfo) it.next();
			%>
			<tr>
			    <td><%=commentCouBean.getComCouNum() %></td>
				<td><%=commentCouBean.getCouNum() %></td>
				<td><%=commentCouBean.getStuNum() %></td>
				<td><%=commentCouBean.getComDate() %></td>
				<td><%=commentCouBean.getComFirstScore() %></td>
				<td><%=commentCouBean.getComSecondScore() %></td>
				<td><%=commentCouBean.getComThirdScore() %></td>
				<td><%=commentCouBean.getComFourthScore() %></td>
				<td><%=commentCouBean.getComFifthScore() %></td>
				<td><%=commentCouBean.getComSixthScore() %></td>
				<td><%=commentCouBean.getComSeventhScore() %></td>
				<td><%=commentCouBean.getComEighthScore() %></td>
				<td><%=commentCouBean.getComNinthScore() %></td>
				<td><%=commentCouBean.getComTenthScore() %></td>
				<td><%=commentCouBean.getComTotalScore() %></td>
				<td><%=commentCouBean.getComAvgScore() %></td>
			</tr>
			<%
				}
			%>


		</table>

	</body>
</html>