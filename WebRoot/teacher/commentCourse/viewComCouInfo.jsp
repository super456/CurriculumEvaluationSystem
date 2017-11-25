
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
	<link rel="stylesheet" type="text/css" href="publicStyle/css/bootstrap.css">

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
		<br/>
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>序号</th>
				<th>课程编号</th>
				<th>学生编号</th>
				<th>开课学期</th>
				<th>评教时间</th>
				<th>first分数</th>
				<th>second分数</th>
				<th>third分数</th>
				<th>fourth分数</th>
				<th>fifth分数</th>
				<th>sixth分数</th>
				<th>seventh分数</th>
				<th>eighth分数</th>
				<th>ninth分数</th>
				<th>tenth分数</th>
				<th>总分数</th>
				<th>平均分数</th>
			</tr>
			<jsp:useBean id="commentCouBean" class="admin.bean.commentCourse.CommentCouInfo" />
			<jsp:useBean id="sqlBean" class="admin.bean.commentCourse.CommentCouSqlBean" />
			<%
			    int count=1;
			    String couNum = request.getParameter("couNum");
			    String couTerm = request.getParameter("couTerm");
                String sql = "select * from commentCouInfo inner join courseInfo on commentCouInfo.couNum=courseInfo.couNum where courseInfo.couNum = '"+couNum+"' and couTerm='"+couTerm+"'";
                sqlBean.startCon();
				java.util.List list = sqlBean.showAllCommentCou(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					commentCouBean = (admin.bean.commentCourse.CommentCouInfo) it.next();
			%>
			<tr>
			    <td><%=count %></td>
				<td><%=commentCouBean.getCouNum() %></td>
				<td><%=commentCouBean.getStuNum() %></td>
				<td><%=commentCouBean.getCouTermMess() %></td>
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
				count++;
				}
			%>


		</table>
		<center>
        <form action="backToTeaPraise?couTerm=<%=couTerm %>&tableName=teacher/commentCourse/viewCommentResult.jsp" method="post">
	    <input type="submit" value="返回" class="btn btn-success"  />
		</form>
        </center>
		
	</body>
</html>