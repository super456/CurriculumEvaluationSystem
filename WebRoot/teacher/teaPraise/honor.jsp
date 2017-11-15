<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="teacher.bean.TeaInfo" />
<jsp:useBean id="sqlBean" class="teacher.bean.HonorSql" />
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
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<!-- 判断用户是不是直接打开这个网址，而有没有通过登录界面登录 -->
		<%
			String userName = (String) session.getAttribute("userName");
			if (userName == null){ %>
	    <script>
	    alert(" 您未登录，请从登录界面登录！");
	    //这个问题谨记，很实用
	    top.location.href="index.jsp";
 		</script>
		<%
			}
		%>
		<center>
			<form action="teacher/teaPraise/honor.jsp" method="post" name=form>
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
				<input type="submit" value="提交" />
			</form>

			<table border=1 bgcolor="#ffffff" width=50%>
				<tr align="center">
					<td>
						教师编号
					</td>
					<td>
						教师姓名
					</td>
					<td>
						荣誉称号
					</td>
				</tr>
				<%
					String honor = "优秀教师";
					String sql = "select distinct top 3 teaInfo.teaNum,teaName,theAllAvgScore from teaInfo inner join teaPraiseListInfo on teaInfo.teaNum=teaPraiseListInfo.teaNum where couTerm= "
							+ couTerm
							+ " except (select teaInfo.teaNum,teaName,theAllAvgScore from teaInfo inner join teaPraiseListInfo on teaInfo.teaNum=teaPraiseListInfo.teaNum where theAllAvgScore=0.0) order by theAllAvgScore desc";
					sqlBean.startCon();
					java.util.List list = sqlBean.showAllHonor(sql);
					if(list.size() == 0){ %> 
	
		            <script>
	                alert(" 该学期没有评教 ! ");
 		            </script>
				<%
					}
					for (java.util.Iterator it = list.iterator(); it.hasNext();) {
						bean = (teacher.bean.TeaInfo) it.next();
				%>
				<tr>
					<td><%=bean.getTeaNum()%></td>
					<td><%=bean.getTeaName()%></td>
					<td><%=honor%></td>
				</tr>
				<%
					}
				%>


			</table>
		</center>
	</body>
</html>
