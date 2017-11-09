<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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

</style>
	</head>

	<body style="background-color: #FFF;">
	</center>

		<table border=1 bgcolor="#ffffff" width=120%>
			<tr align="center">
				<td>
					评教卡内容编号
				</td>
				<td>
					第一项内容
				</td>
				<td>
					第二项内容
				</td>
				<td>
					第三项内容
				</td>
				<td>
					第四项内容
				</td>
				<td>
					第五项内容
				</td>
				<td>
					第六项内容
				</td>
				<td>
				           第七项内容
				</td>
				<td>
				           第八项内容
				</td>
				<td>
				           第九项内容
				</td>
				<td>
				           第十项内容
				</td>
				<td>
				           备注说明
				</td>
				<td>
					操作
				</td>
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
				<td align="center" width=100px>
					<a href="searchByComConNum?comConNum=<%=comConBean.getComConNum() %>">修改</a>
					<a href="deleteComCon?comConNum=<%= comConBean.getComConNum() %>"
						onclick="return confirm('确定删除?')">删除</a>
				</td>
			</tr>
			<%
			  }
			%>

		</table>

	</body>
</html>