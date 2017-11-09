<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="couClassBean" class="admin.bean.commentCourse.CouClassStuInfo"/>
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

<style type="text/css">
a {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
	color: #53e3a6;
	text-decoration: none;
}

a:hover {
	color: cyan;
}
</style>
  </head>
  
  <body style="background-color: #FFF;">
  <center>
			<form action="selectByCouClassStuInfo" method="post">
				<select name="select">
					<option value="couNum" selected> 
						课程编号 
					</option>
					<option value="stuNum">
						学生编号
					</option>
				</select>
				<input type="text" name="userInfo"
					style="width: 160px; height: 25px" />
				<input type="submit" value="搜索" />
			</form>
		</center>  
<table border=1 bgcolor="#ffffff" width=90% align="center">
<tr align="center">
  <td>课程班级学生信息编号</td>
  <td>课程编号</td>
  <td>学生编号</td>
  <td>是否评教</td>
  <td>操作</td>
</tr>

			<%
				java.util.List list = (List)request.getAttribute("list");
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					couClassBean = (admin.bean.commentCourse.CouClassStuInfo) it.next();
			%>
			<tr>
				<td><%=couClassBean.getCouClassStuInfoNum() %></td>
				<td><%=couClassBean.getCouNum() %></td>
				<td><%=couClassBean.getStuNum() %></td>
				<td><%=couClassBean.getIsTeachMess() %></td>
				<td align="center">
				<a href="selectByCommentCouInfo?stuNum=<%=couClassBean.getStuNum() %>&couNum=<%=couClassBean.getCouNum() %>">评教分数</a>&nbsp;&nbsp;
				<a href="searchByStuNum?stuNum=<%=couClassBean.getStuNum() %>&tableName=admin/student/searchStuInfo.jsp">学生信息</a>
				</td>
			</tr>
			<%
				}
			%>


		</table>

	</body>
</html>
