<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="comConBean" class="admin.bean.commentContent.CommentContent" scope="request" />
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
  width: 300px;
  height: 35px;
  border-radius: 3px;
  padding: 10px 15px;
  margin: 0 auto 12px auto;
  display: block;
  font-size: 15px;
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

<script type="text/javascript">
 function click(){
 alert("添加成功!");
 }
</script>
  </head>
  
  <body>

<div class="wrapper">
  <div class="container">
 <center>
  <h2 style="color:cyan">&nbsp;修 改 评 教 卡 内 容</h2>
  <form action="updateComCon?comConNum=<jsp:getProperty name="comConBean" property="comConNum" />" method="post" name=form class="form">
  <table border=0 background="#ffffff">
  <tr><td>第一项内容: </td>  
  <td><input type="text" name="theFirstCon" value=<jsp:getProperty name="comConBean" property="theFirstCon" /> /></td></tr>
  <tr><td>第二项内容:</td>       
  <td><input type="text" name="theSecondCon" value=<jsp:getProperty name="comConBean" property="theSecondCon" /> /></td></tr>
  <tr><td>第三项内容:</td>
  <td><input type="text" name="theThirdCon" value=<jsp:getProperty name="comConBean" property="theThirdCon" /> /></td></tr> 
  <tr><td>第四项内容:</td>       
  <td><input type="text" name="theFourthCon" value=<jsp:getProperty name="comConBean" property="theFourthCon" /> /></td></tr> 
  <tr><td>第五项内容:</td>       
  <td><input type="text" name="theFifthCon" value=<jsp:getProperty name="comConBean" property="theFifthCon" /> /></td></tr>
  <tr><td>第六项内容:</td>       
  <td><input type="text" name="theSixthCon" value=<jsp:getProperty name="comConBean" property="theSixthCon" /> /></td></tr>
  <tr><td>第七项内容:</td>       
  <td><input type="text" name="theSeventhCon" value=<jsp:getProperty name="comConBean" property="theSeventhCon" /> /></td></tr>
  <tr><td>第八项内容:</td>       
  <td><input type="text" name="theEighthCon" value=<jsp:getProperty name="comConBean" property="theEighthCon" /> /></td></tr>
  <tr><td>第九项内容:</td>       
  <td><input type="text" name="theNinthCon" value=<jsp:getProperty name="comConBean" property="theNinthCon" /> /></td></tr>
  <tr><td>第十项内容:</td>       
  <td><input type="text" name="theTenthCon" value=<jsp:getProperty name="comConBean" property="theTenthCon" /> /></td></tr>
  <tr><td>备注信息:</td>
  <td><textArea name="comConRemarks" rows=6 cols=30
  style="background-color: rgba(255, 255, 255, 0.2);border-radius:3px;font-size: 18px;color: white;"><jsp:getProperty name="comConBean" property="comConRemarks" /></textArea></td></tr> 
  <tr align="center"><td><button type="submit" onclick="click()">修改</button></td> 
  <td>&nbsp;&nbsp;<button type="reset">重置</button></td></tr> 
  </table>
  </form>
  </center>
  </div>
</div>


  </body>
</html>
