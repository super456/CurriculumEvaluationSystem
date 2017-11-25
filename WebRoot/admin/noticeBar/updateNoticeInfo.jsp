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
		<link rel="stylesheet" type="text/css" href="publicStyle/css/bootstrap.css">
	
	
<style type="text/css">
body{
<<<<<<< HEAD
  margin:0px;
  padding:0px;
=======
	margin:0;
	padding:0;
>>>>>>> e2f618422c8ce18d065193776fa58eabace237dd
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
  <h2>&nbsp;修 改 通 告 栏 信 息</h2>
  <form action="updateNotice?noticeBarInfoNum=<%=noticeBean.getNoticeBarInfoNum() %> " method="post" name=form class="form">
  <table border=0 background="#ffffff">
  <tr><th>标题: </th>  
  <td><input type="text" name="title" value=<%=noticeBean.getTitle() %> /></td></tr>
  <tr><th>作者:</th>       
  <td><input type="text" name="author" value=<%=noticeBean.getAuthor() %> /></td></tr>
  <tr><th>内容:</th>
  <td><textArea name="content" rows=8 cols=25 
  style="background-color: rgba(255, 255, 255, 0.2);border-radius:3px;font-size: 18px;color: white;margin-bottom:20px;"
   ><%=noticeBean.getContent() %></textArea></td></tr>   
  <tr><th>查看限制:</th>       
  <td><select name="noticeBarLimit" id="noticeBarLimit" >
  <option value="0">学生，教师查看</option>
  <option value="1">学生查看</option>
  <option value="2">教师查看</option>
  <option value="3">禁止查看</option>
  </select></td></tr>
  
  <tr><td>&nbsp;&nbsp;<button type="submit" >修改</button></td> 
  <td>&nbsp;&nbsp;&nbsp;&nbsp;<button type="reset">重置</button></td></tr> 
  </table>
  </form>
  </center>
  </div>
</div>
    
  </body>
</html>

