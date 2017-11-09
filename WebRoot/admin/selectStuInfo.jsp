<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="stuBean" class="admin.bean.StuInfo" scope="request" />
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
	<form action="selectByStuInfo" method="post" name=form>
	<select name="select">
	<option value="stuNum" selected>学号</option>
	<option value="stuName">姓名</option>
	<option value="stuGrade">年级</option>
	<option value="stuForm">院系专业</option>
	</select>
	<input type="text" name="userInfo" style="width:160px;height:25px" />
	<input type="submit" value="搜索"/>
	</form>
	</center>

		<table border=1 bgcolor="#ffffff" width=100%>
			<tr align="center">
				<td>
					学生编号
				</td>
				<td>
					姓名
				</td>
				<td>
					性别
				</td>
				<td>
					年级
				</td>
				<td>
					院系专业及班级
				</td>
				<td>
					电话
				</td>
				<td>
					备注
				</td>
				<td>
				    是否限制登录
				</td>
				<td>
					操作
				</td>
			</tr>
			
			<%
			    java.util.List list = (List)request.getAttribute("list");
				for (java.util.Iterator it = list.iterator();it.hasNext();) {
					stuBean = (admin.bean.StuInfo)it.next();
			 %>
			<tr>
				<td><%=stuBean.getStuNum()%></td>
				<td><%=stuBean.getStuName()%></td>
				<td><%=stuBean.getStuSex()%></td>
				<td><%=stuBean.getStuGrade()%></td>
				<td><%=stuBean.getStuForm()%></td>
				<td><%=stuBean.getStuPhone()%></td>
				<td><%=stuBean.getStuRemarks()%></td>
				<td align="center" valign="bottom">
				<form action="limitLogin?accountNum=<%=stuBean.getStuNum()%>&tableName=admin/selectStuInfo.jsp&table=stuInfo" method="post" >
				<button type="submit" ><%=stuBean.getLimitMess() %></button>
				</form>
				</td>
				<td align="center">
					<a href="searchByStuNum?stuNum=<%=stuBean.getStuNum()%>&tableName=admin/updateStuInfo.jsp">更新</a>
					&nbsp;
					<a href="deleteStu?stuNum=<%= stuBean.getStuNum() %>"
						onclick="return confirm('确定删除?')">删除</a>
				</td>
			</tr>
			<%
			  }
			%>

		</table>

	</body>
</html>
