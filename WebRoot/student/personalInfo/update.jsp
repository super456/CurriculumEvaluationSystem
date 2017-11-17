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
    
    <title>这里是修改个人信息页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="publicStyle/css/bootstrap.css">
	
<style type="text/css">
body{
	margin:0;
	padding:0;
}
.wrapper {
  background: #50a3a2;
  background: -webkit-linear-gradient(top left, #50a3a2 0%, #53e3a6 100%);
  background: linear-gradient(to bottom right, #50a3a2 0%, #53e3a6 100%);
  opacity: 0.8;
  width: 100%;
  overflow: hidden;

}
.container {
  max-width: 600px;
  margin: 0 auto;
  height: 520px;
  text-align: center;
}
form {
  padding: 20px 0;
  position: relative;
  z-index: 2;
}
form input {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  outline: 0;
  border: 1px solid rgba(255, 255, 255, 0.4);
  background-color: rgba(255, 255, 255, 0.2);
  width: 250px;
  border-radius: 3px;
  padding: 10px 15px;
  margin: 0 auto 10px auto;
  display: block;
  text-align: center;
  font-size: 18px;
  color: white;
  font-weight: 300;
}
form button {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  outline: 0;
  background-color: white;
  border: 0;
  padding: 10px 15px;
  color: #53e3a6;
  border-radius: 3px;
  width: 125px;
  cursor: pointer;
  font-size: 18px;
  -webkit-transition-duration: 0.25s;
          transition-duration: 0.25s;
          margin-top:20px;

}
form select{
	margin-bottom:15px;
}
form button:hover {
	 background-color: rgb(32,178,170);
	 color:white;
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
  			<%
				int stuNum=(Integer)session.getAttribute("accountNum");
				String sql = "select * from stuInfo where stuNum='"+stuNum+"'";
				consql.StartCon();
				java.util.List list = consql.showPersonalInfo(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					personalInfo = (student.bean.PersonalInfo) it.next();
			%>
<div class="wrapper">
  <div class="container">
 <center>
  <h2>&nbsp;修 改 个人 信 息</h2>
  <form action="updatePersonalInfo" method="post">
  <table border=0 background="#ffffff">
  <tr><th>学号: </th>  
  <td><input type="text" name="stuNum" readonly value="<%=personalInfo.getStuNum() %>"/></td></tr>
  <tr><th>姓名:</th>       
  <td><input type="text" name="stuName" readonly value=<%= personalInfo.getStuName()%> /></td></tr>
  <tr><th>性别:</th>
  <td> <select name="stuSex" id="stuSex">
  <%
  	if(personalInfo.getStuSex().equals("男")){
  %>
  <option value="男" selected>--男生--</option>
  <option value="女" >--女生--</option>
  <%}else{ %>
    <option value="男">--男生--</option>
  <option value="女" selected>--女生--</option>
  <%} %>
  </select></td></tr> 
  <tr><th>年级:</th>       
  <td><input type="text" name="stuGrade" value=<%= personalInfo.getStuGrade() %> /></td></tr> 
  <tr><th>院系专业及班级:</th>       
  <td><input type="text" name="stuFrom" value=<%= personalInfo.getStuFrom() %> /></td></tr>
  <tr><th>联系电话:</th>       
  <td><input type="text" name="stuPhone" value=<%= personalInfo.getStuPhone()%> /></td></tr>
  <tr><th>备注:</th>
  <td><textArea name="stuRemarks" class="form-control">
  <%= personalInfo.getStuRemarks() %></textArea></td></tr> 
  <tr><td>&nbsp;<button type="submit" >提交</button></td>
  <td>&nbsp;&nbsp;&nbsp;<button type="reset">重置</button></td></tr> 
  </table>
  <%} %>
  </form>
  </center>
  </div>
</div>
  </body>
</html>
