<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  height: 650px;
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
  position:absolute;
  margin-left:-7%;
  margin-top:540px;
}
form button:hover {
	 background-color: rgb(32,178,170);
	 color:white;
}
</style>
  </head>
  
  <body>
  <div class="wrapper">
  <div class="container">
 <center>
  <h2 style="color:cyan">&nbsp;查 看 学 生 信 息</h2>
  <form action="viewByStuNum?couTerm=<%=(String)request.getAttribute("couTerm") %>&isTeach=<%=(String)request.getAttribute("isTeach") %>&couName=all" method="post" name=form class="form">
  <table border=0 background="#ffffff">
  <tr><td>学生编号: </td>  
  <td><input type="text" value=<%= request.getAttribute("stuNum") %> readonly /></td></tr>
  <tr><td>姓名:</td>       
  <td><input type="text" value=<%= request.getAttribute("stuName") %> readonly /></td></tr>
  <tr><td>性别:</td>
  <td> <input type="text" value=<%= request.getAttribute("stuSex") %> readonly />
  </select></td></tr> 
  <tr><td>年级:</td>       
  <td><input type="text" value=<%= request.getAttribute("stuGrade") %> readonly /></td></tr> 
  <tr><td>院系专业及班级:</td>       
  <td><input type="text" value=<%= request.getAttribute("stuForm") %> readonly /></td></tr>
  <tr><td>联系电话:</td>       
  <td><input type="text" value=<%= request.getAttribute("stuPhone") %> readonly /></td></tr>
  <tr><td>备注:</td>
  <td><textArea rows=8 cols=26 
  style="background-color: rgba(255, 255, 255, 0.2);border-radius:3px;font-size: 18px;color: white;"
   disabled ><%= request.getAttribute("stuRemarks") %></textArea></td></tr>  
  <button type="submit" >返回</button>
  </table>
  </form>
  </center>
  </div>
</div>
    
  </body>
</html>
