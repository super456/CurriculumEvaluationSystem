<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="comConBean" class="admin.bean.commentContent.CommentContent" />
<jsp:useBean id="sqlBean" class="admin.bean.commentContent.ComConSqlBean" />
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
	</center><br/>

		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>序号</th>
				<th>第一项内容</th>
				<th>第二项内容</th>
				<th>第三项内容</th>
				<th>第四项内容</th>
				<th>第五项内容</th>
				<th>第六项内容</th>
				<th>第七项内容</th>
				<th>第八项内容</th>
				<th>第九项内容</th>
				<th> 第十项内容</th>
				<th>备注说明</th>
				<th>操作</th>
			</tr>
			
			<%
			    String sql = "select * from commentContent";
			    java.util.List list = sqlBean.showAllComCon(sql);
				for (java.util.Iterator it = list.iterator();it.hasNext();) {
					comConBean = (admin.bean.commentContent.CommentContent)it.next();
			 %>
			<tr>
				<td align="center"><%=comConBean.getComConNum() %></td>
				<td width=150px><%=comConBean.getTheFirstCon() %></td>
				<td width=100px><%=comConBean.getTheSecondCon() %></td>
				<td width=100px><%=comConBean.getTheThirdCon() %></td>
				<td width=100px><%=comConBean.getTheFourthCon() %></td>
				<td width=100px><%=comConBean.getTheFifthCon() %></td>
				<td width=100px><%=comConBean.getTheSixthCon() %></td>
				<td width=100px><%=comConBean.getTheSeventhCon() %></td>
				<td width=100px><%=comConBean.getTheEighthCon() %></td>
				<td width=100px><%=comConBean.getTheNinthCon() %></td>
				<td width=100px><%=comConBean.getTheTenthCon() %></td>
				<td width=100px><%=comConBean.getComConRemarks() %></td>
				<td>
					<a href="searchByComConNum?comConNum=<%=comConBean.getComConNum() %>" class="btn btn-info">修改</a>
					<a href="deleteComCon?comConNum=<%= comConBean.getComConNum() %>"
						onclick="return confirm('确定删除?')" class="btn btn-danger">删除</a>
				</td>
			</tr>
			<%
			  }
			%>

		</table>

	</body>
</html>