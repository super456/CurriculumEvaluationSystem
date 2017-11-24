<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="noticeBean" class="admin.bean.noticeBar.NoticeBarInfo" scope="request" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int noticeBarLimit = noticeBean.getNoticeBarInfoLimit();
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
body{
  margin:0px;
  padding:0px;
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
  height: 550px;
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
button {
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
  margin-left:-5%;
  margin-top:400px;
}
button:hover {
	 background-color: rgb(32,178,170);
	 color:white;
}
</style>

<script type="text/javascript">
  window.onload=function(){   
  var osel=document.getElementById("noticeBarLimit"); 
  var length=osel.getElementsByTagName("option").length; 
  var opts = osel.getElementsByTagName("option");
  var status = "<%=noticeBarLimit%>";
  for(var i=0;i<length;i++){
    if(status == opts[i].value){
     opts[i].selected=true;
    }
  }  
} 
</script>

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
  <h2 style="color:cyan">&nbsp;查 看 通 告 栏 详 细 信 息</h2>
  <form action="searchByNoticeNum" method="post" name=form class="form">
  <table border=0 background="#ffffff">
  <tr><td>标题: </td>  
  <td><input type="text" value=<%=noticeBean.getTitle() %> readonly /></td></tr>
  <tr><td>发布时间: </td>  
  <td><input type="text" value=<%=noticeBean.getReleaseTime() %> readonly /></td></tr>
  <tr><td>作者:</td>       
  <td><input type="text" value=<%=noticeBean.getAuthor() %> readonly /></td></tr>
  <tr><td>内容:</td>
  <td><textArea rows=8 cols=25 
  style="background-color: rgba(255, 255, 255, 0.2);border-radius:3px;font-size: 18px;color: white;" readonly
   ><%=noticeBean.getContent() %></textArea></td></tr>   
  <tr><td>查看限制:</td>       
  <td><select name="noticeBarLimit" id="noticeBarLimit" disabled>
  <option value="0">学生,教师查看</option>
  <option value="1">学生查看</option>
  <option value="2">教师查看</option>
  <option value="3">禁止查看</option>
  </select></td></tr>
  
  <button type="submit" >返回</button>
  </table>
  </form>
  </center>
  </div>
</div>
    
  </body>
</html>
