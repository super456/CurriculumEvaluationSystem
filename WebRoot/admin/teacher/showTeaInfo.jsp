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

		<meta charset="UTF-8">
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
		<center><br/>
			<form action="selectByTeaInfo" method="post">
				<select name="select">
					<option value="teaNum" selected>
						教师编号
					</option>
					<option value="teaName">
						姓名
					</option>
					<option value="teaForm">
						单位
					</option>
				</select>
				<input type="text" name="userInfo"
					style="width: 160px; height: 25px" class="input-medium search-query" placeholder="请输入全称" required />
				<input type="submit" value="搜索"  class="btn btn-success"/>
			</form>
		</center>

		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>序号</th>
				<th>教师编号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>出生日期</th>
				<th>所在单位</th>
				<th>联系电话</th>
				<th>简介</th>
				<th>是否限制登录</th>
				<th>操作</th>
			</tr>
			<jsp:useBean id="teaBean" class="admin.bean.teacher.TeaInfo" />
			<jsp:useBean id="sqlBean" class="admin.bean.teacher.TeaSqlBean" />
			<%
				String sql = "select * from teaInfo";
				int count=1;//添加自增序号列
				java.util.List list = sqlBean.showAllTea(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					teaBean = (admin.bean.teacher.TeaInfo) it.next();
			%>
			<tr>
				<td><%=count %></td>
				<td><%=teaBean.getTeaNum()%></td>
				<td><%=teaBean.getTeaName()%></td>
				<td><%=teaBean.getTeaSex()%></td>
				<td><%=teaBean.getTeaBirthday()%></td>
				<td><%=teaBean.getTeaForm()%></td>
				<td><%=teaBean.getTeaPhone()%></td>
				<td><%=teaBean.getTeaRemarks()%></td>
				<td align="center" valign="bottom">
					<form
						action="limitLogin?accountNum=<%=teaBean.getTeaNum()%>&tableName=admin/teacher/showTeaInfo.jsp&table=teaInfo"
						method="post">
						<button type="submit" class="btn btn-warning"><%=teaBean.getLimitMess() %></button>
					</form>
				</td>
				<td align="center">
					<a href="searchByTeaNum?teaNum=<%=teaBean.getTeaNum()%>" class="btn btn-info">更新</a>&nbsp;
					<a href="deleteTea?teaNum=<%=teaBean.getTeaNum()%>"
	                onclick="return confirm('确定删除?')" class="btn btn-danger">删除</a>
				</td>
			</tr>
			<%
				count++;}
			%>


		</table>

	</body>
</html>
