<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生课程评教管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 添加网站图标为学校院徽 -->
	<link rel="shortcut icon" href="publicStyle/images/favicon.ico"/>

<link rel="stylesheet" type="text/css" href="publicStyle/css/login-css/styles.css">
<!-- 背景图片放在css/login-css/style.css中显示不出来，还没找到具体问题，应该是文件存放的路径跟运行路径不一致的问题 -->
<style>
        body {
	    background-image: url(publicStyle/images/logo.png);
	    background-repeat: no-repeat;
	    background-size:350px 87px;
	    background-position-x:50%;
	    background-position-y:5%;
        }
</style>
  </head>
  <body>
<div class="wrapper">
	<div class="container">
		<h2>欢迎来到学生课程评教管理系统</h2>
		<form class="form"  id="Login" name="loginForm" method="post"  action="loginCheck" onSubmit="return checkForm();">
			<input type="text"  name="accountNum"  placeholder="账号">
			<input type="password"  name="userPassword"  placeholder="密码">
			<center><span>登  录  身    份：</span>
					<select name="select"><option value="学生" name="student">学生</option>
					<option value="教师" name="teacher">教师</option>
					<option value="管理员" name="systemAdmin">管理员</option>
					
					</select></center><br>
					<input type="text" name="checkCode" placeholder="验证码">	<!--  <img src="images/verify.PNG" border="0" class="verifyimg" />-->
	               <button type="submit" >登录</button>
		</form>
	</div>
	<!-- 背景方块随机出现的样式 -->
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	
</div>
<div class="footer">&copy;2017-10，本系统由世武和嘉杰合作开发，版权所有</div>
<script type="text/javascript" src="publicStyle/js/login-js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
$('#login-button').click(function(event){
	event.preventDefault();
	$('form').fadeOut(500);
	$('.wrapper').addClass('form-success');
});
</script>

<!--js登录表单验证  -->
<script language="javascript">
    //验证表单是否为空
    function checkForm() {
      var flag = true;
      if (loginForm.accountNum.value == "") {
        alert("请输入账号！");
        flag = false;
        return flag;
      }
      if (loginForm.userPassword.value == "") {
        alert("请输入密码！");
        flag = false;
        return flag;
      }
//验证码
     // if (loginForm.checkCode.value == "") {
      //  alert("请输入验证码！");
      //  flag = false;
        //return false
     // }
      return flag;
    }
  </script>
  </body>
</html>
