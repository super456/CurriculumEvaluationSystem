<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="stuBean" class="admin.bean.StuInfo" />
<jsp:useBean id="sqlBean" class="admin.bean.StuSqlBean" />
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
  <td>学生编号</td>
  <td>姓名</td>
  <td>性别</td>
  <td>年级</td>
  <td>院系专业及班级</td>
  <td>电话</td>
  <td>备注</td>
  </tr>

<% 
   String sql = "select * from stuInfo order by stuNum";
   java.util.List list = sqlBean.showAllStu(sql);
   for(java.util.Iterator it = list.iterator();it.hasNext();){
	   stuBean = (admin.bean.StuInfo)it.next();
%>
   <tr>
   <td><%= stuBean.getStuNum() %></td>
   <td><%= stuBean.getStuName() %></td>
   <td><%= stuBean.getStuSex() %></td>
   <td><%= stuBean.getStuGrade() %></td>
   <td><%= stuBean.getStuForm() %></td>
   <td><%= stuBean.getStuPhone() %></td>
   <td><%= stuBean.getStuRemarks() %></td>
   </tr>
<%  }
%>

   
  </table> 
    
  </body>
</html>
