<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="stuBean" class="admin.bean.student.StuInfo" />
<jsp:useBean id="sqlBean" class="admin.bean.student.StuSqlBean" />
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
	<form action="selectByStuInfo" method="post" name=form>
	<select name="select">
	<option value="stuNum" selected>学号</option>
	<option value="stuName">姓名</option>
	<option value="stuGrade">年级</option>
	<option value="stuForm">院系专业</option>
	</select>
	<input type="text" name="userInfo" style="width:160px;height:25px"  class="input-medium search-query"/>
	<input type="submit" value="搜索" class="btn btn-success"/>
	</form>
	</center>

		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
			   <th>序号</th>
				<th>学号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年级</th>
				<th>院系专业及班级</th>
				<th>电话</th>
				<th>备注</th>
				<th> 是否限制登录</th>
				<th>操作</th>
			</tr>

			<%
				String sql = "select * from stuInfo order by stuNum";
			int count=1;//用于序号自增序列
				java.util.List list = sqlBean.showAllStu(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					stuBean = (admin.bean.student.StuInfo) it.next();
			%>
			<tr>
			    <td><%=count %></td>
				<td><%=stuBean.getStuNum()%></td>
				<td><%=stuBean.getStuName()%></td>
				<td><%=stuBean.getStuSex()%></td>
				<td><%=stuBean.getStuGrade()%></td>
				<td><%=stuBean.getStuForm()%></td>
				<td><%=stuBean.getStuPhone()%></td>
				<td><%=stuBean.getStuRemarks()%></td>
				<td align="center" valign="middle" >
				<form class="button" action="limitLogin?accountNum=<%=stuBean.getStuNum()%>&tableName=admin/student/showStuInfo.jsp&table=stuInfo" method="post" >
				<button type="submit"  class="btn btn-warning"><%= stuBean.getLimitMess() %></button>
				</form>
				</td>
				<td align="center">
					<a href="searchByStuNum?stuNum=<%=stuBean.getStuNum()%>&tableName=admin/student/updateStuInfo.jsp" class="btn btn-info">更新</a>
					&nbsp;
					<a href="deleteStu?stuNum=<%= stuBean.getStuNum() %>"
						onclick="return confirm('确定删除?')" class="btn btn-danger">删除</a>
				</td>
			</tr>
			<%
				count++;}
			%>


		</table>

	</body>
</html>
