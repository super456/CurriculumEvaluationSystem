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

	</head>

	<body style="background-color: #FFF;">

		<center>
			<form action="selectByCommentCouInfo" method="post">
				<select name="select">
					<option value="couNum" selected>
						课程编号
					</option>
					<option value="stuNum">
						学生编号
					</option>
				</select>
				<input type="text" name="userInfo"
					style="width: 160px; height: 25px" />
				<input type="submit" value="搜索" />
			</form>
		</center>

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
					留言区
				</td>
				<td>
					总分数
				</td>
				<td>
					平均分数
				</td>
			</tr>
			<jsp:useBean id="commentCouBean" class="admin.bean.CommentCouInfo" />
			<jsp:useBean id="sqlBean" class="admin.bean.CommentCouSqlBean" />
			<%
                String sql = "select * from commentCouInfo";
				java.util.List list = sqlBean.showAllCommentCou(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					commentCouBean = (admin.bean.CommentCouInfo) it.next();
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
				<td><%=commentCouBean.getComLeaMsg() %></td>
				<td><%=commentCouBean.getComTotalScore() %></td>
				<td><%=commentCouBean.getComAvgScore() %></td>
			</tr>
			<%
				}
			%>


		</table>

	</body>
</html>
