<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

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
button{
   font-size:20px;
   width:50px;
   padding: 0px;
   margin-top: 20px;
   height:25px;
   background-color:#96FED1;
}
button:hover{
   background-color:white;
}
</style>
	</head>

	<body style="background-color: #FFF;">

		<center>
			<form action="selectByTeaPraiseInfo" method="post">
				<select name="select">
					<option value="teaPraiseListInfo.teaNum" selected>
						教师编号
					</option>
					<option value="teaName">
						教师姓名
					</option>
					<option value="couName">
						课程名称
					</option>
				</select>
				<input type="text" name="userInfo"
					style="width: 160px; height: 25px" />
				<input type="submit" value="搜索" />
			</form>
		</center>

		<table border=1 bgcolor="#ffffff" width=100%>
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
					开课学期
				</td>
				<td>
					所有总平均分数
				</td>
			</tr>
			<jsp:useBean id="teaPraiseBean" class="admin.bean.TeaPraiseListInfo" scope="request" /> 
			<%
				java.util.List list = (List)request.getAttribute("list");
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					teaPraiseBean = (admin.bean.TeaPraiseListInfo) it.next();
			%>
			<tr>
			    <td><%=teaPraiseBean.getTeaPraiseListNum() %></td>
				<td><%=teaPraiseBean.getCouNum() %></td>
				<td><%=teaPraiseBean.getCouName() %></td>
				<td><%=teaPraiseBean.getTeaNum() %></td>
				<td><%=teaPraiseBean.getTeaName() %></td>
				<td><%=teaPraiseBean.getCouTerm() %></td>
				<td><%=teaPraiseBean.getTheAllAvgScore() %></td>
			</tr>
			<%
				}
			%>


		</table>

	</body>
</html>

