<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="teacher.bean.TeaInfo" />
<jsp:useBean id="sqlBean" class="teacher.bean.TeaSql" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	
	
	
<style type="text/css">
body{
	margin:0;
	padding:0;
	overflow:hidden;
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
  height: 620px;
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
}
form button:hover {
	 background-color: rgb(32,178,170);
	 color:white;
}
</style>
  </head>
  
   
<body>
  
  <%
	int accountNum=(Integer)session.getAttribute("accountNum");//获取账号
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
	String condition = "select password from userLogin where accountNum="+accountNum;
	String password = sqlBean.searchUserPwd(condition);
	session.setAttribute("oldPassword",password);
   %>
   
  <div class="wrapper">
  <div class="container">
 <center>
  <h2 style="color:gray">修 改 密 码</h2>
  <form action="updateUserPwd?tableName=teacher/personInfo/changeTeaPwd.jsp"  method="post" class="form">
  <table border=0 background="#ffffff">  
  <tr><th>请输入旧密码： </th>  
  <td><input type="password" name="oldPwd"  /></td></tr>
  <tr><th>请输入新密码：</th>       
  <td><input type="password" name="newPassword" /></td></tr>
  <tr><th>确认新密码：</th>
  <td> <input type="password" name="confirmNewPassword" /></td></tr>         
  </table>
  <button type="submit" >修改</button>&nbsp;&nbsp;&nbsp;<button type="reset">重置</button>
  </form>
  </center>
  </div> 
</div>
    
  </body>
</html>
