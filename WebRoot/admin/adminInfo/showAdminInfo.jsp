<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="adminBean" class="admin.bean.admin.AdminInfo" />
<jsp:useBean id="sqlBean" class="admin.bean.admin.AdminSqlBean" />
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
		    int accountNum = (Integer)session.getAttribute("accountNum");
		    String condition = "select adminLimit from adminInfo where adminNum = "+accountNum;
		    sqlBean.startCon();
		    int adminLimit = sqlBean.searchAdminNum(condition);
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
	<form action="selectByAdminInfo" method="post">
	<select name="select">
	<option value="adminNum" selected>管理员编号</option>
	<option value="adminName">姓名</option>
	</select>
	<input type="text" name="userInfo" style="width:160px;height:25px"  class="input-medium search-query"/>
	<input type="submit" value="搜索" class="btn btn-success"/>
	</form>
	</center>

		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>序号</th>
				<th>管理员编号</th>
				<th>姓名</th>
				<th>联系电话</th>
				<th>权限等级</th>
				<th>备注</th>
				<%
			      if(adminLimit == 2){
				 %>
				<th>操作</th>
				<% } %>
			</tr>

			<%
				String sql = "select * from adminInfo order by adminNum";
				sqlBean.startCon();
				int count=1;//添加个序号自增列
				java.util.List list = sqlBean.showAllAdmin(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					adminBean = (admin.bean.admin.AdminInfo) it.next();
			%>
			<tr>
			   <td><%=count %></td>
				<td><%=adminBean.getAdminNum() %></td>
				<td><%=adminBean.getAdminName() %></td>
				<td><%=adminBean.getAdminPhone() %></td>
				<td><%=adminBean.getAdminLimit() %></td>
				<td><%=adminBean.getAdminRemarks() %></td>
				<% 
				if(adminLimit == 2){
				%>
				<td>
					<a href="searchByAdminNum?adminNum=<%= adminBean.getAdminNum() %>" class="btn btn-info">更新</a>
					&nbsp;
					<a href="deleteAdmin?adminNum=<%= adminBean.getAdminNum() %>"
						onclick="return confirm('确定删除?')" class="btn btn-danger">删除</a>
				</td>
				<% } %>
			</tr>
			<%
				count++;}
			%>


		</table>

	</body>
</html>
