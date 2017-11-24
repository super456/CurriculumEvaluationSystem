<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="course" class="admin.bean.course.CourseInfo" />
<jsp:useBean id="courseSql" class="admin.bean.course.CourseSqlBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="con" class="admin.bean.PageShow" />
<%
    String cT = request.getParameter("couTerm");//获取查询的学期，默认为171802，即2017-2018第二学期
	int couTerm = Integer.parseInt(cT);
	String select = (String)request.getAttribute("select");
	String userInfo = (String)request.getAttribute("userInfo");	 
	if(select == null || userInfo == null){
	 select = request.getParameter("select");
	 userInfo = request.getParameter("userInfo");
	} 	 
	
    final int pageSize = 8;//每页显示的数量
    int pageNo = 1;  //显示的页数
    String pageNoStr = request.getParameter("pageNo");
    if(pageNoStr!=null && !pageNoStr.trim().equals("")){
     try{
         pageNo = Integer.parseInt(pageNoStr);
        }catch(NumberFormatException e){
            pageNo = 1;
        }
    }
     
     if(pageNo<=0){
         pageNo = 1;
     }
     
    int totalPage = 0; //总页数
    String condition;
    condition = "select count(*) from commentCouInfo inner join courseInfo on commentCouInfo.couNum=courseInfo.couNum " +
				"where couTerm="+couTerm+" and "+select+" = '"+userInfo+"'"; 

	con.startCon(); 
    int rowCount = con.getCount(condition); //获取总行数
    totalPage = (rowCount + pageSize - 1)/pageSize; //计算总页数
     
    if(pageNo > totalPage) pageNo = totalPage;
     
    int startPos = (pageNo-1) * pageSize; //每页开始的帖子
    String sql = "select top "+pageSize+" * " +
	      "from commentCouInfo inner join courseInfo on commentCouInfo.couNum=courseInfo.couNum inner join stuInfo on commentCouInfo.stuNum=stuInfo.stuNum where couTerm="+couTerm+" and "+select+" = '"+userInfo+"' and comCouNum not in " +
	      "(select top "+startPos+" comCouNum from commentCouInfo inner join courseInfo on commentCouInfo.couNum=courseInfo.couNum inner join stuInfo on commentCouInfo.stuNum=stuInfo.stuNum where couTerm="+couTerm+" )"; 
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
			String condition1 = "select couNum,teaInfo.teaNum,teaName,couName,couTerm,couFrom,couTime,couPlace,couCredit,couRemarks from CourseInfo inner join teaInfo on CourseInfo.teaNum=teaInfo.teaNum where couTerm="+couTerm+" and "+select+" like '%"+userInfo+"%'  order by couFrom,teaNum";
			courseSql.startCon();
			java.util.List list1 = courseSql.showAllCou(condition1);
			java.util.Iterator it1 = list1.iterator();
			course = (admin.bean.course.CourseInfo) it1.next();
		%>
		<br>
		<table class="table table-striped  table-condensed">
		<tr align="center"><td>任课名称:<%=course.getCouName() %></td></tr>
		<tr align="center"><td>任课教师:<%=course.getTeaName() %></td></tr>
		</table>
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>序号</th>
				<th>学生编号</th>
				<th>学生姓名</th>
				<th>开课学期</th>
				<th>评教时间</th>
				<th>first分数</th>
				<th>second分数</th>
				<th>third分数</th>
				<th>fourth分数</th>
				<th>fifth分数</th>
				<th>sixth分数</th>
				<th>seventh分数</th>
				<th>eighth分数</th>
				<th>ninth分数</th>
				<th>tenth分数</th>
				<th>留言区</th>
				<th>总分数</th>
				<th>平均分数</th>
			</tr>
			<jsp:useBean id="commentCouBean" class="admin.bean.commentCourse.CommentCouInfo" />
			<jsp:useBean id="sqlBean" class="admin.bean.commentCourse.CommentCouSqlBean" />
			<%
			    int count=1;
			    sqlBean.startCon();
				java.util.List list = sqlBean.showCommentCouDetail(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					commentCouBean = (admin.bean.commentCourse.CommentCouInfo) it.next();
			%>
			<tr>
			    <td><%=count %></td>
				<td><%=commentCouBean.getStuNum() %></td>
				<td><%=commentCouBean.getStuName() %></td>
				<td><%=commentCouBean.getCouTerm() %></td>
				<td><%=commentCouBean.getComDate() %></td>
				<td><%=commentCouBean.getComFirstScore() %></td>
				<td><%=commentCouBean.getComSecondScore() %></td>
				<td><%=commentCouBean.getComThirdScore() %></td>
				<td><%=commentCouBean.getComFourthScore() %></td>
				<td><%=commentCouBean.getComFifthScore() %></td>
				<td><%=commentCouBean.getComSixthScore() %></td>
				<td><%=commentCouBean.getComSeventhScore() %></td>
				<td><%=commentCouBean.getComEighthScore() %></td>
				<td><%=commentCouBean.getComNinthScore() %></td>
				<td><%=commentCouBean.getComTenthScore() %></td>
				<td><%=commentCouBean.getComLeaMsg() %></td>
				<td><%=commentCouBean.getComTotalScore() %></td>
				<td><%=commentCouBean.getComAvgScore() %></td>
			</tr>
			<%
			    count++;
				}
			%>
			
		</table>
		<%
		   String tableName = (String)request.getAttribute("tableName");
		   if(tableName == null || tableName.length() == 0){
		      tableName = request.getParameter("tableName");
		   }
		 %>
		
		<center>
                                         共<%=totalPage %>页 第<%=pageNo %>页 
               <a href="admin/commentCourse/showTeaPraiseDetail.jsp?pageNo=1&couTerm=<%=couTerm %>&select=<%=select %>&userInfo=<%=userInfo %>&tableName=<%=tableName %>">首页</a> 
               <a href="admin/commentCourse/showTeaPraiseDetail.jsp?pageNo=<%=pageNo-1 %>&couTerm=<%=couTerm %>&select=<%=select %>&userInfo=<%=userInfo %>&tableName=<%=tableName %>">上一页</a> 
               <a href="admin/commentCourse/showTeaPraiseDetail.jsp?pageNo=<%=pageNo+1 %>&couTerm=<%=couTerm %>&select=<%=select %>&userInfo=<%=userInfo %>&tableName=<%=tableName %>">下一页</a> 
               <a href="admin/commentCourse/showTeaPraiseDetail.jsp?pageNo=<%=totalPage %>&couTerm=<%=couTerm %>&select=<%=select %>&userInfo=<%=userInfo %>&tableName=<%=tableName %>">末页</a>
        </center>
        
		<center>
		<br/>
        <form action="backToTeaPraise?couTerm=<%=couTerm %>&tableName=<%=tableName %>" method="post" >
	    <input type="submit" value="返回" class="btn btn-success"  />
		</form>
        </center>
	</body>
</html>

