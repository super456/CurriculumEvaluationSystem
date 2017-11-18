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
	<link rel="stylesheet" type="text/css" href="publicStyle/css/bootstrap.css">
	
	
  </head>
  
  <body>
  <!-- 判断用户是不是直接打开这个网址，而有没有通过登录界面登录 -->
<%
	String userName=(String)session.getAttribute("userName");
 	if(userName==null){
 		%>
 		<script type="text/javascript">
 		alert("您未登录，请从登录界面登录！");
 		//这个问题谨记，很实用
 		top.location.href="index.jsp";
 		</script>
 		<% 
 	}
%>
<br/>
<div class="container">
		<table class="table table-striped table-bordered table-hover table-condensed">
			<%
				int stuNum=(Integer)session.getAttribute("accountNum");
				String sql = "select * from stuInfo where stuNum='"+stuNum+"'";
				consql.StartCon();
				java.util.List list = consql.showPersonalInfo(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					personalInfo = (student.bean.PersonalInfo) it.next();
			%>
				<tr><th>学号：</th><td><%=personalInfo.getStuNum()%></td></tr>
				<tr><th>姓名：</th><td><%=personalInfo.getStuName()%></td></tr>
				<tr><th>性别：</th><td><%=personalInfo.getStuSex()%></td></tr>
				<tr><th>年级</th><td><%=personalInfo.getStuGrade()%></td></tr>
				<tr><th>院系专业及班级：</th><td><%=personalInfo.getStuFrom()%></td></tr>
				<tr><th>电话：</th><td><%=personalInfo.getStuPhone()%></td></tr>
				<tr><th>备注：</th><td><%=personalInfo.getStuRemarks()%></td></tr>
				<tr><th>操作：</th><td>
					<a href="student/personalInfo/update.jsp" class="btn btn-info">更新</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
</div>
  </body>
</html>
