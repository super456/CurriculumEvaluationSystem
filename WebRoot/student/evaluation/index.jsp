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

<center>
<br/>
	<form action="student/evaluation/index.jsp" method="get">
		<select name="couTerm">
	<%
	String cT=request.getParameter("couTerm");//获取查询的学期，默认为171802，即2017-2018第二学期
	int couTerm=Integer.parseInt(cT);
	if(couTerm==171802){
	%>
	<option value="171802" selected>2017-2018第二学期</option>
	<option value="171801">2017-2018第一学期</option>

	<%}else{ %>
	<option value="171802">2017-2018第二学期</option>
	<option value="171801"selected>2017-2018第一学期</option>
	<%} %>
		</select>
	<input type="submit" value="提交" class="btn btn-success"/>
	</form>
	</center>

		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr align="center">
				<th>序号</th>
				<th>
					课程名称
				</th>
				<th>
					任课教师
				</th>
				<th>
					上课时间
				</th>
				<th>
					上课地点
				</th>
				<th>
					课程学分
				</th>
					<th>
					有无评教
				</th>
				<th>
					操作
				</th>
			</tr>
			<jsp:useBean id="viewCouJnfo" class="student.bean.ViewEvaluationInfo"/>
			<jsp:useBean id="conSql" class="publicConnectSql.connectSql"/>
			<%
			 // request.setCharacterEncoding("utf-8");
			int accountNum=(Integer)session.getAttribute("accountNum");//获取学生账号
			int count=1;//添加个自增的序号
				String condition = "select courseInfo.couName,teaInfo.teaName,courseInfo.couTime,courseInfo.couPlace,courseInfo.couCredit,couClassStuInfo.isTeach from courseInfo,couClassStuInfo,teaInfo where couClassStuInfo.stuNum='"+accountNum+"' and couClassStuInfo.couNum=courseInfo.couNum and courseInfo.couTerm='"+couTerm+"' and courseInfo.teaNum=teaInfo.teaNum";
				conSql.StartCon();//启动连接数据库
				java.util.List list = conSql.showStuViewEvaluationInfo(condition);//执行查询connectSql类方法体5
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					viewCouJnfo = (ViewEvaluationInfo) it.next();
			%>
			<tr>
				<td><%=count %></td>
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
					<a href="student/evaluation/commentCourse.jsp?couName=<%= viewCouJnfo.getCouName() %>&teaName=<%=viewCouJnfo.getTeaName() %>" ><button type="button" class="btn btn-info">评教</button></a>
				</td>
				<%}else{ %>
				<td>已评教</td>
				<td align="center">
				<!-- 使用样式点击无效事件 -->
					<button type="button" disabled="disabled" class="btn btn-default disabled">评教</button>
				</td>
				<%} %>
			</tr>
			<%
				count++;}
			%>


		</table>
  </body>
</html>
