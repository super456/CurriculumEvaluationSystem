<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  <h2>&nbsp;添 加 评 教 卡 内 容</h2>
  <form action="addComCon" method="post" name=form class="form">
  <table border=0 background="#ffffff">
  <tr><th>第一项内容：</th>  
  <td><input type="text" name="theFirstCon" /></td></tr>
  <tr><th>第二项内容：</th>       
  <td><input type="text" name="theSecondCon" /></td></tr>
  <tr><th>第三项内容：</th>
  <td><input type="text" name="theThirdCon" /></td></tr> 
  <tr><th>第四项内容：</th>       
  <td><input type="text" name="theFourthCon" /></td></tr> 
  <tr><th>第五项内容：</th>       
  <td><input type="text" name="theFifthCon" /></td></tr>
  <tr><th>第六项内容：</th>       
  <td><input type="text" name="theSixthCon" /></td></tr>
  <tr><th>第七项内容：</th>       
  <td><input type="text" name="theSeventhCon" /></td></tr>
  <tr><th>第八项内容：</th>       
  <td><input type="text" name="theEighthCon" /></td></tr>
  <tr><th>第九项内容：</th>       
  <td><input type="text" name="theNinthCon" /></td></tr>
  <tr><th>第十项内容：</th>       
  <td><input type="text" name="theTenthCon" /></td></tr>
  <tr><th>备注信息：</th>
  <td><textArea name="comConRemarks" class="form-control"></textArea></td></tr> 
  <tr align="center"><td><button type="submit" onclick="click()">提交</button></td> 
  <td>&nbsp;&nbsp;<button type="reset">重置</button></td></tr> 
  </table>
  </form>
  </center>
  </div>
</div>


  </body>
</html>
