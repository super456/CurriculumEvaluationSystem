<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="consql" class="publicConnectSql.connectSql"/>
<jsp:useBean id="teaPraiseListInfo" class="student.bean.TeaPraiseListInfo"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>这里是分学期教师好评榜查看页面</title>
    
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
		<center><br/>
			<form action="student/teaPraiseListInfo/index.jsp" class="form-horizontal" method="post">
				<select name="couTerm">
					<option value="171802" selected>
						2017-2018第二学期
					</option>
					<option value="171801">
						2017-2018第一学期
					</option>
				</select>
				<select name="keywords">
					<option value="" selected>
					</option>
					<option value="couName">
						课程名称
					</option>
					<option value="teaName">
						教师姓名
					</option>
					<option value="couFrom">
						课程单位
					</option>
				</select>
				<input type="text" name="searchInfo" style="width: 160px; height: 25px" class="input-medium search-query" placeholder="请输入全称" required/>
				<input type="submit" value="搜索" class="btn btn-info"/>
			</form>
		</center>

		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr align="center">
				<td>序号</td><td>课程名称</td><td>任课教师</td><td>课程单位</td><td>上课时间</td><td>上课地点</td><td>课程学分</td><td>评教总平均分数</td>
			</tr>
			<%
				int count=1;//定义序号自增
				request.setCharacterEncoding("utf-8");
				String sCouTerm=request.getParameter("couTerm");//可能会报错这里
				int couTerm=Integer.parseInt(sCouTerm);
				String keywords=request.getParameter("keywords");
				String sql=null;
				//匹配筛选的sql语句
				if(keywords==null||keywords.length()==0){
					sql="select courseInfo.couName,teaInfo.teaName,courseInfo.couFrom,courseInfo.couTime,courseInfo.couPlace,courseInfo.couCredit,teaPraiseListInfo.theAllAvgScore from courseInfo,teaInfo,teaPraiseListInfo where teaPraiseListInfo.couTerm='"+couTerm+"' and teaPraiseListInfo.couNum=courseInfo.couNum and teaPraiseListInfo.teaNum=teaInfo.teaNum";
				
				}else if(keywords.equals("couName")){
					String couName=request.getParameter("searchInfo");
					sql="select courseInfo.couName,teaInfo.teaName,courseInfo.couFrom,courseInfo.couTime,courseInfo.couPlace,courseInfo.couCredit,teaPraiseListInfo.theAllAvgScore from courseInfo,teaInfo,teaPraiseListInfo where teaPraiseListInfo.couTerm='"+couTerm+"' and teaPraiseListInfo.couNum=courseInfo.couNum and teaPraiseListInfo.teaNum=teaInfo.teaNum and courseInfo.couName='"+couName+"'";
					
				}else if(keywords.equals("teaName")){
					String teaName=request.getParameter("searchInfo");
					sql="select courseInfo.couName,teaInfo.teaName,courseInfo.couFrom,courseInfo.couTime,courseInfo.couPlace,courseInfo.couCredit,teaPraiseListInfo.theAllAvgScore from courseInfo,teaInfo,teaPraiseListInfo where teaPraiseListInfo.couTerm='"+couTerm+"' and teaPraiseListInfo.couNum=courseInfo.couNum and teaPraiseListInfo.teaNum=teaInfo.teaNum and teaInfo.teaName='"+teaName+"'";
				}else{
					String couFrom=request.getParameter("searchInfo");
					sql="select courseInfo.couName,teaInfo.teaName,courseInfo.couFrom,courseInfo.couTime,courseInfo.couPlace,courseInfo.couCredit,teaPraiseListInfo.theAllAvgScore from courseInfo,teaInfo,teaPraiseListInfo where teaPraiseListInfo.couTerm='"+couTerm+"' and teaPraiseListInfo.couNum=courseInfo.couNum and teaPraiseListInfo.teaNum=teaInfo.teaNum and courseInfo.couFrom='"+couFrom+"'";

				}
				consql.StartCon();
				java.util.List list = consql.showTeaPraiseListInfo(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					teaPraiseListInfo = (student.bean.TeaPraiseListInfo) it.next();
				if(list.size()==0){
					%>
					<script type="text/javascript">
					alert('输入内容有误，匹配不到信息！');
					</script>
					<% 
					return;
				}
			%>
						<tr>
						<td><%=count %></td>
				<td><%=teaPraiseListInfo.getCouName()%></td>
				<td><%=teaPraiseListInfo.getTeaName()%></td>
				<td><%=teaPraiseListInfo.getCouFrom()%></td>
				<td><%=teaPraiseListInfo.getCouTime()%></td>
				<td><%=teaPraiseListInfo.getCouPlace()%></td>
				<td><%=teaPraiseListInfo.getCouCredit()%></td>
				<td><%=teaPraiseListInfo.getTheAllAvgScore()%></td>
			</tr>
			<%
				count++;}
			%>
			</table>
  </body>
</html>
