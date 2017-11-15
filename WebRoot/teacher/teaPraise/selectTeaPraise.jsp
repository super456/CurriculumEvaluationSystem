<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="teaPraiseBean" class="teacher.bean.TeaPraiseListInfo" />
<jsp:useBean id="sqlBean" class="teacher.bean.TeaPraiseListSqlBean" />
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
		<center>
			<form action="selectByTeaPraise" method="post" name=form>

				<select name="couTerm">
					<option value="171802" >
						2017-2018第二学期
					</option>
					<option value="171801">
						2017-2018第一学期
					</option>
				</select>
				
				<select name="select">
				<option value="teaName">教师名称</option>
				<option value="couName">课程名称</option>
				<option value="couFrom">系部名称</option>
				</select>
				<input type="text" name="userInfo" />
				<input type="submit" value="搜索" />
			</form>


			<table border=1 bgcolor="#ffffff" width=80%>
				<tr align="center">
					<td>
						教师好评榜编号
					</td>
					<td>
						课程编号
					</td>
					<td>
						课程名称
					</td>
					<td>
						教师编号
					</td>
					<td>
						教师姓名
					</td>
					<td>
					           开课单位
					</td>
					<td>
						总平均分数
					</td>
				</tr>
				<%
				    
					java.util.List list = (List)request.getAttribute("list");
					for (java.util.Iterator it = list.iterator(); it.hasNext();) {
						teaPraiseBean = (teacher.bean.TeaPraiseListInfo) it.next();
				%>
				<tr>
					<td><%=teaPraiseBean.getTeaPraiseListNum() %></td>
					<td><%=teaPraiseBean.getCouNum() %></td>
					<td><%=teaPraiseBean.getCouName() %></td>
					<td><%=teaPraiseBean.getTeaNum() %></td>
					<td><%=teaPraiseBean.getTeaName() %></td>
					<td><%=teaPraiseBean.getCouFrom() %></td>
					<td><%=teaPraiseBean.getTheAllAvgScore() %></td>
				</tr>
				<%
					}
				%>


			</table>
		</center>
	</body>
</html>
