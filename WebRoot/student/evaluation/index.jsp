<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="student.bean.ViewEvaluationInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>这里是学生查看课程评教信息页面</title>
    
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

<center>
	<form action="student/evaluation/index.jsp" method="get">
	<%
	String cT=request.getParameter("couTerm");//获取查询的学期，默认为171802，即2017-2018第二学期
	int couTerm=Integer.parseInt(cT);
	if(couTerm==171802){
	%>
	<select name="couTerm">
	<option value="171802" selected>2017-2018第二学期</option>
	<option value="171801">2017-2018第一学期</option>
	</select>
	<%}else{ %>
		<select name="couTerm">
	<option value="171802">2017-2018第二学期</option>
	<option value="171801"selected>2017-2018第一学期</option>
	</select>
	<%} %>
	<input type="submit" value="提交"/>
	</form>
	</center>

		<table border=1 bgcolor="#ffffff" width=90% align="center">
			<tr align="center">
				<td>
					课程名称
				</td>
				<td>
					任课教师
				</td>
				<td>
					上课时间
				</td>
				<td>
					上课地点
				</td>
				<td>
					课程学分
				</td>
					<td>
					有无评教
				</td>
				<td>
					操作
				</td>
			</tr>
			<jsp:useBean id="viewCouJnfo" class="student.bean.ViewEvaluationInfo"/>
			<jsp:useBean id="conSql" class="publicConnectSql.connectSql"/>
			<%
			int accountNum=(Integer)session.getAttribute("accountNum");//获取学生账号
			
				String condition = "select courseInfo.couName,teaInfo.teaName,courseInfo.couTime,courseInfo.couPlace,courseInfo.couCredit,couClassStuInfo.isTeach from courseInfo,couClassStuInfo,teaInfo where couClassStuInfo.stuNum='"+accountNum+"' and couClassStuInfo.couNum=courseInfo.couNum and courseInfo.couTerm='"+couTerm+"' and courseInfo.teaNum=teaInfo.teaNum";
				conSql.StartCon();//启动连接数据库
				java.util.List list = conSql.showStuViewEvaluationInfo(condition);//执行查询connectSql类方法体5
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					viewCouJnfo = (ViewEvaluationInfo) it.next();
			%>
			<tr>
				<td><%=viewCouJnfo.getCouName() %></td>
				<td><%=viewCouJnfo.getTeaName() %></td>
				<td><%=viewCouJnfo.getCouTime() %></td>
				<td><%=viewCouJnfo.getCouPlace() %></td>
				<td><%=viewCouJnfo.getCouCredit() %></td>
				<%
				int judge=viewCouJnfo.getIsTeach();
				if(judge==0){
				%>
				<td>未评教</td>
					<td align="center">
					<a href="student/evaluation/commentCourse.jsp?couName=<%= viewCouJnfo.getCouName() %>" ><button type="button">评教</button></a>
				</td>
				<%}else{ %>
				<td>已评教</td>
				<td align="center">
					<button type="button" disabled="disabled">评教</button>
				</td>
				<%} %>
			</tr>
			<%
				}
			%>


		</table>
  </body>
</html>
