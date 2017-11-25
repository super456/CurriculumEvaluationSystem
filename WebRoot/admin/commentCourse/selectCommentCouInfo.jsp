<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    con.startCon();
    int rowCount = con.getCount("select count(*) from commentCouInfo inner join courseInfo on commentCouInfo.couNum=courseInfo.couNum where "+select+" like '%"+userInfo+"%' and couTerm="+couTerm); //获取总行数
    int totalPage = 0; //总页数
    totalPage = (rowCount + pageSize - 1)/pageSize; //计算总页数
     
    if(pageNo > totalPage) pageNo = totalPage;
     
    int startPos = (pageNo-1) * pageSize; //每页开始的帖子
    String sql = "select top "+pageSize+" * " +
	    		"from commentCouInfo inner join courseInfo on commentCouInfo.couNum=courseInfo.couNum where couTerm="+couTerm+" and comCouNum not in " +
	    		"(select top "+startPos+" comCouNum from commentCouInfo inner join courseInfo on commentCouInfo.couNum=courseInfo.couNum where couTerm="+couTerm+" ) "+
	    		" and "+select+" like '%"+userInfo+"%'";
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
		%>
		<center><br/>
			<form action="selectByCommentCouInfo?tableName=admin/commentCourse/selectCommentCouInfo.jsp" method="post">
			<%

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
				<%
					}
				%>
				<select name="select">
					<option value="couNum" selected>
						课程编号
					</option>
					<option value="stuNum">
						学生编号
					</option>
				</select>
				<input type="text" name="userInfo"
					style="width: 160px; height: 25px" class="input-medium search-query" placeholder="请输入全称"  />
				<input type="submit" value="搜索" class="btn btn-success"/>
			</form>
		</center>

		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>序号</th>
				<th>课程编号</th>
				<th>学生编号</th>
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
				java.util.List list = sqlBean.showAllCommentCou(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					commentCouBean = (admin.bean.commentCourse.CommentCouInfo) it.next();
			%>
			<tr>
			    <td><%=count %></td>
				<td><%=commentCouBean.getCouNum() %></td>
				<td><%=commentCouBean.getStuNum() %></td>
				<td><%=commentCouBean.getCouTermMess() %></td>
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
		<center>
                                         共<%=totalPage %>页 第<%=pageNo %>页 
               <a href="admin/commentCourse/selectCommentCouInfo.jsp?pageNo=1&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">首页</a> 
               <a href="admin/commentCourse/selectCommentCouInfo.jsp?pageNo=<%=pageNo-1 %>&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">上一页</a> 
               <a href="admin/commentCourse/selectCommentCouInfo.jsp?pageNo=<%=pageNo+1 %>&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">下一页</a> 
               <a href="admin/commentCourse/selectCommentCouInfo.jsp?pageNo=<%=totalPage %>&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">末页</a>
        </center>
		
	</body>
</html>

