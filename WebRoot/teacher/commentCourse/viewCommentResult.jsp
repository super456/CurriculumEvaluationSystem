<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="teacher.bean.CommentResult" />
<jsp:useBean id="sqlBean" class="teacher.bean.CommentResultSql" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="publicStyle/css/bootstrap.css">

		<style type="text/css">
a {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
	color: #53e3a6;
	text-decoration: none;
}

a:hover {
	color: cyan;
}
</style>
	</head>

	<body style="background-color: #FFF;">

		<!-- 判断用户是不是直接打开这个网址，而有没有通过登录界面登录 -->
		<%
		    int accountNum = (Integer)session.getAttribute("accountNum");
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
		<center><br/>
			<form action="teacher/commentCourse/viewCommentResult.jsp" class="form-horizontal" method="get">
				<%
					String cT = request.getParameter("couTerm");//获取查询的学期，默认为171802，即2017-2018第二学期
					int couTerm = Integer.parseInt(cT);
					if (couTerm == 171802) {
				%>
				<select name="couTerm">
					<option value="171802" selected>
						2017-2018第二学期
					</option>
					<option value="171801">
						2017-2018第一学期
					</option>
				</select>
				<%
					} else {
				%>
				<select name="couTerm">
					<option value="171802">
						2017-2018第二学期
					</option>
					<option value="171801" selected>
						2017-2018第一学期
					</option>
				</select>
				<%
					}
				%>
				<input type="submit" value="提交" class="btn btn-success"/>
			</form>


			<table class="table table-striped table-bordered table-hover table-condensed">
				<tr>
					<th>
						课程编号
					</th>
					<th>
						课程名称
					</th>
					<th>
						任课老师
					</th>
					<th>
						上课时间
					</th>
					<th>
						所有总平均分数
					</th>
					<th>
					           操作
					</th>
				</tr>
				<%

					String sql = "select DISTINCT teaPraiseListInfo.couNum,couName,teaName,couTime,theAllAvgScore from teaPraiseListInfo "+ 
                                 "inner join courseInfo on teaPraiseListInfo.couNum=courseInfo.couNum inner join "+
                                 "teaInfo on teaPraiseListInfo.teaNum=teaInfo.teaNum where "+
                                 "teaPraiseListInfo.couTerm=" +couTerm+" and teaPraiseListInfo.teaNum="+accountNum;
					java.util.List list = sqlBean.viewAllComResult(sql);
					for (java.util.Iterator it = list.iterator(); it.hasNext();) {
						bean = (teacher.bean.CommentResult) it.next();
				%>
				<tr>
					<td><%=bean.getCouNum() %></td>
					<td><%=bean.getCouName() %></td>
					<td><%=bean.getTeaName() %></td>
					<td><%=bean.getCouTime() %></td>
					<td><%=bean.getTheAllAvgScore() %></td>
					<td>
					<a href="teacher/commentCourse/viewComCouInfo.jsp?couNum=<%=bean.getCouNum() %>&couTerm=<%=cT %> " class="btn btn-info" >查看详情</a>
					</td>
				</tr>
				<%
					}
				%>


			</table>
		</center>
	</body>
</html>
