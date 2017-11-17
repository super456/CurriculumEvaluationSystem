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
    
    <title>这里是通知栏某个通知具体内容</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="publicStyle/css/bootstrap.css">


  </head>
  <body>
  <!-- 做一个页面访问量，有一个问题：因为本页面是所有通告栏文章通用展示的，所以会显示所有文章的阅读量总和 -->
  <%! int count=0;
  		synchronized void setCount(){
  		
  		count++;
  		}
  %>
  
<!-- 判断用户是不是直接打开这个网址，而有没有通过登录界面登录 -->
<%
	setCount();//执行访问量方法体计数
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
<div class="wrapper">
  <div class="container">
 <center>
  <h2>&nbsp;<%=request.getAttribute("title") %></h2>
  <table class="table table-striped  table-condensed">
  <tr><td>作者: <%=request.getAttribute("author") %></td><td>发布时间：<%=request.getAttribute("releaseTime") %></td><td>访问量：<%=count %></td></tr>  
  <tr><td colspan="3"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("content") %></div></td></tr>

  </table>
  </center>
  </div>
</div>
  </body>
</html>
