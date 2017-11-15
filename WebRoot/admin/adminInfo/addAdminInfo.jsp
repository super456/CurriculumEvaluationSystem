<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="sqlBean" class="admin.bean.admin.AdminSqlBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
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
  height: 450px;
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

<!-- 判断用户是不是直接打开这个网址，而有没有通过登录界面登录 -->
		<%
		    int accountNum = (Integer)session.getAttribute("accountNum");
		    String condition = "select adminLimit from adminInfo where adminNum = "+accountNum;
		    sqlBean.startCon();
		    int adminLimit = sqlBean.searchAdminNum(condition);
		    if(adminLimit == 1){ %>
		    <script>
	    alert(" 权限不够，不能进入!");
		top.location.href="admin";
 		</script>
		<%	}
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

<div class="wrapper">
  <div class="container">
 <center>
  <h2 style="color:cyan">&nbsp;添 加 管 理 员 信 息</h2>
  <form action="addAdmin" method="post" name=form class="form">
  <table border=0 background="#ffffff">
  <tr><td>管理员编号: </td>  
  <td><input type="text" name="adminNum" /></td></tr>
  <tr><td>姓名:</td>       
  <td><input type="text" name="adminName" /></td></tr> 
  <tr><td>联系电话:</td>       
  <td><input type="text" name="adminPhone" /></td></tr> 
  <tr><td>权限等级:</td>       
  <td><input type="text" name="adminLimit" /></td></tr>
  <tr><td>备注:</td>
  <td><input type="text" name="adminRemarks"/></td></tr> 
  <tr><td>&nbsp;<button type="submit" >提交</button></td> 
  <td>&nbsp;&nbsp;&nbsp;<button type="reset">重置</button></td></tr> 
  </table>
  </form>
  </center>
  </div>
</div>


  </body>
</html>
