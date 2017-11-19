<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="couClassBean" class="admin.bean.commentCourse.CouClassStuInfo"/>
<jsp:useBean id="sqlBean" class="admin.bean.commentCourse.CouClassStuSqlBean" />
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
	
	
  </head>
  
  <body style="background-color: #FFF;">
  
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
  <center><br/>
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
					style="width: 160px; height: 25px" class="input-medium search-query" placeholder="请输入全称" required />
				<input type="submit" value="搜索" class="btn btn-success"/>
			</form>
		</center>  
<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
  <th>序号</th>
  <th>课程编号</th>
  <th>学生编号</th>
  <th>是否评教</th>
  <th>操作</th>
</tr>

			<%
				String sql = "select * from couClassStuInfo";
				java.util.List list = sqlBean.showAllCouClassStu(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					couClassBean = (admin.bean.commentCourse.CouClassStuInfo) it.next();
			%>
			<tr>
				<td><%=couClassBean.getCouClassStuInfoNum() %></td>
				<td><%=couClassBean.getCouNum() %></td>
				<td><%=couClassBean.getStuNum() %></td>
				<td><%=couClassBean.getIsTeachMess() %></td>
				<td>
				<a href="selectByCommentCouInfo?stuNum=<%=couClassBean.getStuNum() %>&couNum=<%=couClassBean.getCouNum() %>" class="btn btn-info">评教分数</a>&nbsp;&nbsp;
				<a href="searchByStuNum?stuNum=<%=couClassBean.getStuNum() %>&tableName=admin/student/searchStuInfo.jsp" class="btn btn-info">学生信息</a>
				</td>
			</tr>
			<%
				}
			%>


		</table>

	</body>
</html>
