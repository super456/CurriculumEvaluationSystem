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
		<center><br/>
			<form action="selectByTeaPraise" method="post" name=form>

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
				
				<select name="select">
				<option value="teaName">教师名称</option>
				<option value="couName">课程名称</option>
				<option value="couFrom">系部名称</option>
				</select>
				<input type="text" name="userInfo" style="width: 160px; height: 25px" class="input-medium search-query" placeholder="请输入全称" />
				<input type="submit" value="搜索" class="btn btn-success" />
			</form>


			<table class="table table-striped table-bordered table-hover table-condensed">
				<tr>
					<th>序号</th>
					<th>课程编号</th>
					<th>课程名称</th>
					<th>教师编号</th>
					<th>教师姓名</th>
					<th>开课单位</th>
					<th>总平均分数</th>
				</tr>
				<%
				    int count = 1;
					java.util.List list = (List)request.getAttribute("list");
					for (java.util.Iterator it = list.iterator(); it.hasNext();) {
						teaPraiseBean = (teacher.bean.TeaPraiseListInfo) it.next();
				%>
				<tr>
					<td><%=count %></td>
					<td><%=teaPraiseBean.getCouNum() %></td>
					<td><%=teaPraiseBean.getCouName() %></td>
					<td><%=teaPraiseBean.getTeaNum() %></td>
					<td><%=teaPraiseBean.getTeaName() %></td>
					<td><%=teaPraiseBean.getCouFrom() %></td>
					<td><%=teaPraiseBean.getTheAllAvgScore() %></td>
				</tr>
				<%
				    count++;
					}
				%>


			</table>
		</center>
	</body>
</html>
