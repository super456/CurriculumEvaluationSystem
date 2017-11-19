<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="teaPraiseBean" class="admin.bean.commentCourse.TeaPraiseListInfo" />
<jsp:useBean id="sqlBean" class="admin.bean.commentCourse.TeaPraiseListSqlBean" />
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
	


<script type="text/javascript">
	function postwith(to, p) {
		var myForm = document.createElement("form");
		myForm.method = "post";
		myForm.action = to;
		for ( var k in p) {
			var myInput = document.createElement("input");
			myInput.setAttribute("name", k);
			myInput.setAttribute("value", p[k]);
			myForm.appendChild(myInput);
		}
		document.body.appendChild(myForm);
		myForm.submit();
		document.body.removeChild(myForm);
	}
</script>
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
					style="width: 160px; height: 25px" class="input-medium search-query" placeholder="请输入全称" required/>
				<input type="submit" value="搜索" class="btn btn-success"/>
			</form>
		</center>

		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>序号</th>
				<th>课程编号</th>
				<th>课程名称</th>
				<th>教师编号</th>
				<th>任课老师</th>
				<th>开课学期</th>
				<th>所有总平均分数</th>
				<th>操作</th>
			</tr>
			<%
				String sql = "select teaPraiseListNum,teaPraiseListInfo.couNum,couName,"
						+ "teaPraiseListInfo.teaNum,teaName,teaPraiseListInfo.couTerm,theAllAvgScore from teaPraiseListInfo "
						+ "inner join courseInfo on teaPraiseListInfo.couNum=courseInfo.couNum inner join "
						+ "teaInfo on teaPraiseListInfo.teaNum=teaInfo.teaNum";
				java.util.List list = sqlBean.showAllTeaPraise(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					teaPraiseBean = (admin.bean.commentCourse.TeaPraiseListInfo) it.next();
			%>
			<tr>
				<td><%=teaPraiseBean.getTeaPraiseListNum()%></td>
				<td><%=teaPraiseBean.getCouNum()%></td>
				<td><%=teaPraiseBean.getCouName()%></td>
				<td><%=teaPraiseBean.getTeaNum()%></td>
				<td><%=teaPraiseBean.getTeaName()%></td>
				<td><%=teaPraiseBean.getCouTerm()%></td>
				<td><%=teaPraiseBean.getTheAllAvgScore()%></td>
				<td align="center">
					<a
						href="javascript:postwith('selectByCommentCouInfo',{'select':'couNum','userInfo':'<%=teaPraiseBean.getCouNum()%>'})" class="btn btn-info">
						查看详情</a>
				</td>
			</tr>
			<%
				}
			%>


		</table>

	</body>
</html>
