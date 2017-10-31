<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
        
    <meta charset="gb2312">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body style="background-color:#FFF;">
  <table border=1 bgcolor="#ffffff" width=100%>
  <tr align="center">
  <td>教师编号</td>
  <td>姓名</td>
  <td>性别</td>
  <td>出生日期</td>
  <td>所在单位</td>
  <td>联系电话</td>
  <td>简介</td>
  </tr>
<jsp:useBean id="TeaBean" class="admin.bean.TeaInfo" />
<jsp:useBean id="sqlBean" class="admin.bean.TeaSqlBean" />
<% 
   String sql = "select * from teaInfo";
   java.util.List list = sqlBean.showAllTea(sql);
   for(java.util.Iterator it = list.iterator();it.hasNext();){
	   TeaBean = (admin.bean.TeaInfo)it.next();
%>
   <tr>
   <td><%= TeaBean.getTeaNum() %></td>
   <td><%= TeaBean.getTeaName() %></td>
   <td><%= TeaBean.getTeaSex() %></td>
   <td><%= TeaBean.getTeaBirthday() %></td>
   <td><%= TeaBean.getTeaForm() %></td>
   <td><%= TeaBean.getTeaPhone() %></td>
   <td><%= TeaBean.getTeaRemarks() %></td>
   </tr>
<%  }
%>

   
  </table> 
    
  </body>
</html>
