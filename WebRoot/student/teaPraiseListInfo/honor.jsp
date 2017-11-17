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
	<link rel="stylesheet" type="text/css" href="publicStyle/css/bootstrap.css">

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
		<center><br/><div class="container">
			<form action="student/teaPraiseListInfo/honor.jsp" method="post" name=form>
					<select name="couTerm">
				<%
					String cT = request.getParameter("couTerm");//获取查询的学期，默认为171802，即2017-2018第二学期
					int couTerm = Integer.parseInt(cT);
					if (couTerm == 171802) {
				%>
					<option value="171802" selected>
						2017-2018第二学期
					</option>
					<option value="171801">
						2017-2018第一学期
					</option>
				<%
					} else {
				%>
					<option value="171802">
						2017-2018第二学期
					</option>
					<option value="171801" selected>
						2017-2018第一学期
					</option>
				<%
					}
				%>		</select>
				<input type="submit" value="提交" class="btn btn-info"/>
			</form>

			<table class="table table-striped table-bordered table-hover table-condensed">
				<tr align="center">
					<th>
						教师编号
					</th>
					<th>
						教师姓名
					</th>
					<th>
						荣誉称号
					</th>
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
		</div>
	</body>
</html>
