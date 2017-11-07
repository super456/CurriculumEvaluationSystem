<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="nBL" class="student.bean.NoticeBarList" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>这里是通知栏所有通知列表</title>
    
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
	<table border="1">
			<% String []columnName=nBL.getColumnName(); %>
			<tr><%  for(String s:columnName){  %>
			<th><%=s %></th>
			<%} %>
			</tr>
			<% String [][]record=nBL.getTableRecord();
			String rN=request.getParameter("rowNum");
			int rowNum=Integer.parseInt(rN);
			%><tr>
			<% for(int j=0;j<record[rowNum].length;j++){ %>
			<td><%=record[rowNum][j] %></td>
			<%} %>
			</tr>
	</table>
  </body>
</html>
