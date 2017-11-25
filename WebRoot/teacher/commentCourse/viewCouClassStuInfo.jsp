<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="teacher.bean.CouClassStuInfo" />
<jsp:useBean id="sqlBean" class="teacher.bean.CouClassStuSqlBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
			if (userName == null) { %>
	<script>
	alert(" 您未登录，请从登录界面登录！");
	//这个问题谨记，很实用
	top.location.href="index.jsp";
 	</script>
		<%
			}
		%>

		<center><br/>
			<form action="teacher/commentCourse/viewCouClassStuInfo.jsp" method="post">
				<%
				    int accountNum = (Integer)session.getAttribute("accountNum");
				    String couName = request.getParameter("couName");
				    String condition = "select couName from courseInfo where teaNum="+accountNum;
				    sqlBean.startCon();
				    java.util.List couNameList = sqlBean.showAllCouName(condition);
					String cT = request.getParameter("couTerm");//获取查询的学期，默认为171802，即2017-2018第二学期
					int couTerm = Integer.parseInt(cT);
					String iT = request.getParameter("isTeach");
					int isTeach = Integer.parseInt(iT);
					if (couTerm == 171802) {
				%>
				<select name="couTerm">
					<option value="171802" selected>
						2017-2018第二学期
					</option>
					<option value="171801">
						2017-2018第一学期
					</option>
				</select>
				<%
					} else {
				%>
				<select name="couTerm">
					<option value="171802">
						2017-2018第二学期
					</option>
					<option value="171801" selected>
						2017-2018第一学期
					</option>
				</select>
				
				<% } %>
				<select name="couName">
				<option value="all">所有课程</option>
				<% 	for (java.util.Iterator it = couNameList.iterator(); it.hasNext();) {
					bean = (teacher.bean.CouClassStuInfo) it.next();
					%>
					<option value=<%=bean.getCouName() %> ><%=bean.getCouName() %></option>
					<% } %>
					</select>
				<% 	if (isTeach == 1) { %>
				
				<select name="isTeach">
				    <option value="2">
						是否评教
					</option>
					<option value="1" selected>
						已评教
					</option>
					<option value="0">
						未评教
					</option>
				</select>
				<%
					} else if (isTeach == 0){
				%>
				<select name="isTeach">
				    <option value="2">
						是否评教
					</option>
					<option value="1">
						已评教
					</option>
					<option value="0" selected>
						未评教
					</option>
				</select>
				<%
					}else{
				%>
				<select name="isTeach">
				    <option value="2" selected>
						是否评教
					</option>
					<option value="1">
						已评教
					</option>
					<option value="0">
						未评教
					</option>
				</select>
				<%
				}
				%>
				<input type="submit" value="提交" class="btn btn-success"/>
			</form>
		</center>
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>课程班级学生信息编号</th>
				<th>课程编号</th>
				<th>课程名称</th>
				<th>学生编号</th>
				<th>是否评教</th>
				<th>操作</th>
			</tr>
			<%
			    String sql;
			    if(isTeach == 2){
			      if(couName.equals("all")){
			        sql = "select couClassStuInfoNum,couClassStuInfo.couNum,couName,stuNum,couTerm,isTeach from couClassStuInfo inner join courseInfo on couClassStuInfo.couNum = courseInfo.couNum where couTerm = "+couTerm+" and teaNum="+accountNum;  }
			      else{
			        sql = "select couClassStuInfoNum,couClassStuInfo.couNum,couName,stuNum,couTerm,isTeach from couClassStuInfo inner join courseInfo on couClassStuInfo.couNum = courseInfo.couNum where couTerm = "+couTerm+" and teaNum="+accountNum+" and couName='"+couName+"'";}}
			    else{
			        if(couName.equals("all")){
				    sql = "select couClassStuInfoNum,couClassStuInfo.couNum,couName,stuNum,couTerm,isTeach from couClassStuInfo inner join courseInfo on couClassStuInfo.couNum = courseInfo.couNum where couTerm = "+couTerm+" and isTeach="+isTeach+" and teaNum="+accountNum;}
				    else{
				    sql = "select couClassStuInfoNum,couClassStuInfo.couNum,couName,stuNum,couTerm,isTeach from couClassStuInfo inner join courseInfo on couClassStuInfo.couNum = courseInfo.couNum where couTerm = "+couTerm+" and isTeach="+isTeach+" and teaNum="+accountNum+" and couName='"+couName+"'";
				    }}
				sqlBean.startCon();
				java.util.List list = sqlBean.showAllCouClassStu(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					bean = (teacher.bean.CouClassStuInfo) it.next();
			%>
			<tr>
				<td><%=bean.getCouClassStuInfoNum()%></td>
				<td><%=bean.getCouNum()%></td>
				<td><%=bean.getCouName()%></td>
				<td><%=bean.getStuNum()%></td>
				<td><%=bean.getIsTeachMess()%></td>
				<td>
					<a
				href="viewByStuNum?stuNum=<%=bean.getStuNum()%>&tableName=teacher/commentCourse/viewStuInfo.jsp&couTerm=<%=couTerm %>&isTeach=<%=isTeach %>" class="btn btn-info">学生信息</a>
				</td>
			</tr>
			<%
				}
			%>


		</table>

	</body>
</html>
