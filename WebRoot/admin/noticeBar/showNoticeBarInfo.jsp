<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="sqlBean" class="admin.bean.noticeBar.NoticeBarSqlBean" />
<jsp:useBean id="noticeBarBean" class="admin.bean.noticeBar.NoticeBarInfo" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		%><br/>
		<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
  <th>通告栏编号</th>
  <th>标题</th>
  <th>发布时间</th>
  <th>作者</th>
  <th>内容</th>
  <th>查看限制</th>
  <th>操作</th>
</tr>

			<%
				String sql = "select * from  noticeBarInfo";
				java.util.List list = sqlBean.showAllNoticeBar(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					noticeBarBean = (admin.bean.noticeBar.NoticeBarInfo) it.next();
			%>
			<tr>
				<td><%=noticeBarBean.getNoticeBarInfoNum() %></td>
				<td><%=noticeBarBean.getTitle() %></td>
				<td><%=noticeBarBean.getReleaseTime() %></td>
				<td><%=noticeBarBean.getAuthor() %></td>
				<td><%=noticeBarBean.getSmallContent() %></td>
				<td><%=noticeBarBean.getLimitMess() %></td>
				<td align="center">
				    <a href="searchByNoticeNum?noticeBarInfoNum=<%=noticeBarBean.getNoticeBarInfoNum() %>&tableName=admin/noticeBar/searchNoticeInfo.jsp" class="btn btn-info">查看</a>
					<a href="searchByNoticeNum?noticeBarInfoNum=<%=noticeBarBean.getNoticeBarInfoNum() %>&tableName=admin/noticeBar/updateNoticeInfo.jsp" class="btn btn-success">更新</a>
					<a href="deleteNotice?noticeBarInfoNum=<%= noticeBarBean.getNoticeBarInfoNum() %>"
						onclick="return confirm('确定删除?')" class="btn btn-danger">删除</a>
				</td>
			</tr>
			<%
				}
			%>


		</table>

	</body>
</html>
