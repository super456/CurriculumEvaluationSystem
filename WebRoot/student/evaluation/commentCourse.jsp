<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="student.bean.CommentContents"%>
<jsp:useBean id="comCon" class="student.bean.CommentContents"/>
<jsp:useBean id="conSql" class="publicConnectSql.connectSql"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>这里是选择评教课程页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
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
  <body>
  <%
   //获取传递过来的课程名和教师名字
   //解决过一个大大的问题，jsp href get方式传参获取中文乱码问题，直接修改Tomcat的server.xml文件的  <Connector port="8080" protocol="HTTP/1.1" 
    //           connectionTimeout="20000" 
       //        redirectPort="8443" URIEncoding="UTF-8" />

  	String couName=request.getParameter("couName");
    String teaName=request.getParameter("teaName");
  
  %>
  <form action="handleComCard?couName=<%=couName %>&teaName=<%=teaName %>" method="post" onSubmit="return show_confirm();">
  	<div align="center"><h2>课程名称：<%=couName %> &nbsp;&nbsp; 教师姓名：<%=teaName%></h2></div>
    <table border="1" align="center" cellpadding="15px">
    <tr><td rowspan="2">序号</td><td rowspan="2">评教指标内容</td><td colspan="5" align="center">评价选项（单选）</td></tr>
    <tr><td>非常同意</td><td>同意</td><td>一般</td><td>不同意</td><td>非常不同意</td></tr>
    <%
    		String condition="select top 1 * from commentContent";
    		conSql.StartCon();
    		java.util.List list = conSql.showCommentContent(condition);//执行查询connectSql类方法体6
			for (java.util.Iterator it = list.iterator(); it.hasNext();) {
			comCon = (CommentContents) it.next();
    
    %>
    <tr>
    		<td>1</td>
    		<td><%=comCon.getTheFirstCon() %></td>
    		<td><input type="radio" name="1" value="10"/></td>
			<td><input type="radio" name="1"  value="8"/></td>						
			<td><input type="radio" name="1"  value="6"/></td>	
			<td><input type="radio" name="1"  value="4"/></td>	
			<td><input type="radio" name="1"  value="2"/></td>
    </tr>
        <tr>
    		<td>2</td>
    		<td><%=comCon.getTheSecondCon() %></td>
    		<td><input type="radio" name="2" value="10"/></td>
			<td><input type="radio" name="2"  value="8"/></td>						
			<td><input type="radio" name="2"  value="6"/></td>	
			<td><input type="radio" name="2"  value="4"/></td>	
			<td><input type="radio" name="2"  value="2"/></td>
    </tr>
            <tr>
    		<td>3</td>
    		<td><%=comCon.getTheThirdCon() %></td>
    		<td><input type="radio" name="3" value="10"/></td>
			<td><input type="radio" name="3"  value="8"/></td>						
			<td><input type="radio" name="3"  value="6"/></td>	
			<td><input type="radio" name="3"  value="4"/></td>	
			<td><input type="radio" name="3"  value="2"/></td>
    </tr>
            <tr>
    		<td>4</td>
    		<td><%=comCon.getTheFourthCon() %></td>
    		<td><input type="radio" name="4" value="10"/></td>
			<td><input type="radio" name="4"  value="8"/></td>						
			<td><input type="radio" name="4"  value="6"/></td>	
			<td><input type="radio" name="4"  value="4"/></td>	
			<td><input type="radio" name="4"  value="2"/></td>
    </tr>
            <tr>
    		<td>5</td>
    		<td><%=comCon.getTheFifthCon() %></td>
    		<td><input type="radio" name="5" value="10"/></td>
			<td><input type="radio" name="5"  value="8"/></td>						
			<td><input type="radio" name="5"  value="6"/></td>	
			<td><input type="radio" name="5"  value="4"/></td>	
			<td><input type="radio" name="5"  value="2"/></td>
    </tr>
            <tr>
    		<td>6</td>
    		<td><%=comCon.getTheSixthCon() %></td>
    		<td><input type="radio" name="6" value="10"/></td>
			<td><input type="radio" name="6"  value="8"/></td>						
			<td><input type="radio" name="6"  value="6"/></td>	
			<td><input type="radio" name="6"  value="4"/></td>	
			<td><input type="radio" name="6"  value="2"/></td>
    </tr>
            <tr>
    		<td>7</td>
    		<td><%=comCon.getTheSecondCon() %></td>
    		<td><input type="radio" name="7" value="10"/></td>
			<td><input type="radio" name="7"  value="8"/></td>						
			<td><input type="radio" name="7"  value="6"/></td>	
			<td><input type="radio" name="7"  value="4"/></td>	
			<td><input type="radio" name="7"  value="2"/></td>
    </tr>
            <tr>
    		<td>8</td>
    		<td><%=comCon.getTheEighthCon() %></td>
    		<td><input type="radio" name="8" value="10"/></td>
			<td><input type="radio" name="8"  value="8"/></td>						
			<td><input type="radio" name="8"  value="6"/></td>	
			<td><input type="radio" name="8"  value="4"/></td>	
			<td><input type="radio" name="8"  value="2"/></td>
    </tr>
            <tr>
    		<td>9</td>
    		<td><%=comCon.getTheNinthCon() %></td>
    		<td><input type="radio" name="9" value="10"/></td>
			<td><input type="radio" name="9"  value="8"/></td>						
			<td><input type="radio" name="9"  value="6"/></td>	
			<td><input type="radio" name="9"  value="4"/></td>	
			<td><input type="radio" name="9"  value="2"/></td>
    </tr>
            <tr>
    		<td>10</td>
    		<td><%=comCon.getTheTenthCon() %></td>
    		<td><input type="radio" name="10" value="10"/></td>
			<td><input type="radio" name="10"  value="8"/></td>						
			<td><input type="radio" name="10"  value="6"/></td>	
			<td><input type="radio" name="10"  value="4"/></td>	
			<td><input type="radio" name="10"  value="2"/></td>
    </tr>
     <tr>
    		<td colspan="7">学生意见与建议：感谢您对以上指标的评价，如果您还有其他任何新的想法，宝贵的建议，请在下面的空白处留言。我们珍视每一位同学个性化的思考。</td>
    </tr>
    <tr>
    		<td colspan="7"><textarea rows="5" cols="10" name="stuLeaveMsg"></textarea></td>
    </tr>
    <%} %>
    </table>
    <br/>
    <div align="center"><input type="submit" value="提交">&nbsp;&nbsp;<input type="reset" value="重置"/></div>
    </form>
    
    <!-- 表单验证 -->
     <script type="text/javascript" language="JavaScript"> 
function show_confirm() 
{ 
	var result=false;
	var r1=document.getElementsByName("1"); 
	var r2=document.getElementsByName("2"); 
	var r3=document.getElementsByName("3"); 
	var r4=document.getElementsByName("4"); 
	var r5=document.getElementsByName("5"); 
	var r6=document.getElementsByName("6"); 
	var r7=document.getElementsByName("7"); 
	var r8=document.getElementsByName("8"); 
	var r9=document.getElementsByName("9"); 
	var r10=document.getElementsByName("10"); 
	var radio1=false;
	var radio2=false;
	var radio3=false;
	var radio4=false;
	var radio5=false;
	var radio6=false;
	var radio7=false;
	var radio8=false;
	var radio9=false;
	var radio10=false;
	for(var i=0;i<r1.length;i++)
	{
	    if(r1[i].checked)
	    {
	        radio1=r1[i];
	    }
	}
	for(var i=0;i<r2.length;i++)
	{
	    if(r2[i].checked)
	    {
	        radio2=r2[i];
	    }
	}
	for(var i=0;i<r3.length;i++)
	{
	    if(r3[i].checked)
	    {
	        radio3=r3[i];
	    }
	}
	for(var i=0;i<r4.length;i++)
	{
	    if(r4[i].checked)
	    {
	        radio4=r4[i];
	    }
	}
	for(var i=0;i<r5.length;i++)
	{
	    if(r5[i].checked)
	    {
	        radio5=r5[i];
	    }
	}
	for(var i=0;i<r6.length;i++)
	{
	    if(r6[i].checked)
	    {
	        radio6=r6[i];
	    }
	}
	for(var i=0;i<r7.length;i++)
	{
	    if(r7[i].checked)
	    {
	        radio7=r7[i];
	    }
	}
	for(var i=0;i<r8.length;i++)
	{
	    if(r8[i].checked)
	    {
	        radio8=r8[i];
	    }
	}
	for(var i=0;i<r9.length;i++)
	{
	    if(r9[i].checked)
	    {
	        radio9=r9[i];
	    }
	}
	for(var i=0;i<r10.length;i++)
	{
	    if(r10[i].checked)
	    {
	        radio10=r10[i];
	    }
	}
	if (radio1.value==null||radio2.value==null||radio3.value==null||radio4.value==null||radio5.value==null||radio6.value==null||radio7.value==null||radio8.value==null||radio9.value==null||radio10.value==null) {
		alert("提交失败，评价项不能有空哦！");
		result=false;
	}else{
		alert("评教卡提交成功，谢谢您的配合！");
		result=true;
	}
	return result;
} 
</script> 
  </body>
</html>
