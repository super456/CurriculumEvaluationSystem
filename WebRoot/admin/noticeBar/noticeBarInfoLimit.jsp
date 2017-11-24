<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="sqlBean" class="admin.bean.noticeBar.NoticeBarSqlBean" />
<jsp:useBean id="noticeBarBean"
	class="admin.bean.noticeBar.NoticeBarInfo" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String mess = (String)request.getAttribute("alert");
	if(mess != null){ %>
	<script type="text/javascript">
	var mess = "<%=mess %>";
	alert(mess);
    </script>
<%	}
%>
<jsp:useBean id="con" class="admin.bean.PageShow" />
<%
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
    con.startCon(); 
    int rowCount = con.getCount("select count(*) from noticeBarInfo"); //获取总行数
    totalPage = (rowCount + pageSize - 1)/pageSize; //计算总页数
     
    if(pageNo > totalPage) pageNo = totalPage;
     
    int startPos = (pageNo-1) * pageSize; //每页开始的帖子
    String sql = "select top "+pageSize+" * from noticeBarInfo where noticeBarInfoNum not in (select top "+startPos+" noticeBarInfoNum from noticeBarInfo )";
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
	<link rel="stylesheet" type="text/css" href="publicStyle/css/bootstrap.css">
	
	</head>

	<body style="background-color: #FFF;"><br/>
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>通告栏编号</th>
				<th>标题</th>
				<th>发布时间</th>
				<th>作者</th>
				<th>内容</th>
				<th>查看限制操作</th>
			</tr>

			<%
				sqlBean.startCon();
				java.util.List list = sqlBean.showAllNoticeBar(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					noticeBarBean = (admin.bean.noticeBar.NoticeBarInfo) it.next();
			%>
			<tr>
				<td align="center"><%=noticeBarBean.getNoticeBarInfoNum()%></td>
				<td><%=noticeBarBean.getTitle()%></td>
				<td><%=noticeBarBean.getReleaseTime()%></td>
				<td><%=noticeBarBean.getAuthor()%></td>
				<td><%=noticeBarBean.getSmallContent()%></td>
				<td align="center">
					<form action="limitNotice?noticeBarInfoNum=<%=noticeBarBean.getNoticeBarInfoNum()%>" method="post" style="margin-top: 20px;">
						<select name="noticeBarLimit">
							<option value="0">
								学生，教师查看
							</option>
							<option value="1">
								学生查看
							</option>
							<option value="2">
								教师查看
							</option>
							<option value="3">
								禁止查看
							</option>
						</select>
						<input type="submit" value="设置" class="btn btn-success"/>
					</form>
				</td>
			</tr>
			<%
				}
			%>


		</table>
		<center>
                                         共<%=totalPage %>页 第<%=pageNo %>页 
               <a href="admin/noticeBar/noticeBarInfoLimit.jsp?pageNo=1">首页</a> 
               <a href="admin/noticeBar/noticeBarInfoLimit.jsp?pageNo=<%=pageNo-1 %>">上一页</a> 
               <a href="admin/noticeBar/noticeBarInfoLimit.jsp?pageNo=<%=pageNo+1 %>">下一页</a> 
               <a href="admin/noticeBar/noticeBarInfoLimit.jsp?pageNo=<%=totalPage %>">末页</a>
        </center>
		
	</body>
</html>