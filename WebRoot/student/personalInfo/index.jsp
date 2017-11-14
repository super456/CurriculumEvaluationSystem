<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="consql" class="publicConnectSql.connectSql"/>
<jsp:useBean id="personalInfo" class="student.bean.PersonalInfo"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>这里是个人信息查看页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
  
  <body>
		<table border=1 bgcolor="#ffffff" width=100%>
			<tr align="center">
				<td>
					学号
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
					操作
				</td>
			</tr>

			<%
				int stuNum=(Integer)session.getAttribute("accountNum");
				String sql = "select * from stuInfo where stuNum='"+stuNum+"'";
				consql.StartCon();
				java.util.List list = consql.showPersonalInfo(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					personalInfo = (student.bean.PersonalInfo) it.next();
			%>
			<tr>
				<td><%=personalInfo.getStuNum()%></td>
				<td><%=personalInfo.getStuName()%></td>
				<td><%=personalInfo.getStuSex()%></td>
				<td><%=personalInfo.getStuGrade()%></td>
				<td><%=personalInfo.getStuFrom()%></td>
				<td><%=personalInfo.getStuPhone()%></td>
				<td><%=personalInfo.getStuRemarks()%></td>
				<td align="center" >
					<a href="student/personalInfo/update.jsp">更新</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
  </body>
</html>
