<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="stuBean" class="admin.bean.student.StuInfo" />
<jsp:useBean id="sqlBean" class="admin.bean.student.StuSqlBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";	
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
    int rowCount = con.getCount("select count(*) from stuInfo"); //获取总行数
    totalPage = (rowCount + pageSize - 1)/pageSize; //计算总页数
     
    if(pageNo > totalPage) pageNo = totalPage;
     
    int startPos = (pageNo-1) * pageSize; //每页开始的帖子
    String sql = "select top "+pageSize+" * from stuInfo where stuNum not in (select top "+startPos+" stuNum from stuInfo order by stuFrom,stuGrade,stuNum) order by stuFrom,stuGrade,stuNum";
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
	<form action="selectByStuInfo" method="post" name=form>
	<select name="select">
	<option value="stuNum">学号</option>
	<option value="stuName">姓名</option>
	<option value="stuGrade">年级</option>
	<option value="stuForm">院系专业</option>
	</select>
	<input type="text" name="userInfo" style="width:160px;height:25px"  class="input-medium search-query" placeholder="请输入全称" />
	<input type="submit" value="搜索" class="btn btn-success"/>
	</form>
	</center>

		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
			   <th>序号</th>
				<th>学号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年级</th>
				<th>院系专业及班级</th>
				<th>电话</th>
				<th>备注</th>
				<th>是否限制登录</th>
				<th>操作</th>
			</tr>

			<%
			    int count=1; //用于序号自增序列
			    sqlBean.startCon();
				java.util.List list = sqlBean.showAllStu(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					stuBean = (admin.bean.student.StuInfo) it.next();
			%>
			<tr>
			    <td><%=count %></td>
				<td><%=stuBean.getStuNum()%></td>
				<td><%=stuBean.getStuName()%></td>
				<td><%=stuBean.getStuSex()%></td>
				<td><%=stuBean.getStuGrade()%></td>
				<td><%=stuBean.getStuForm()%></td>
				<td><%=stuBean.getStuPhone()%></td>
				<td><%=stuBean.getStuRemarks()%></td>
				<td align="center" valign="middle" >
				<form class="button" action="limitLogin?accountNum=<%=stuBean.getStuNum()%>&tableName=admin/student/showStuInfo.jsp&table=stuInfo" method="post" >
				<button type="submit"  class="btn btn-warning"><%= stuBean.getLimitMess() %></button>
				</form>
				</td>
				<td align="center">
					<a href="searchByStuNum?stuNum=<%=stuBean.getStuNum()%>&tableName=admin/student/updateStuInfo.jsp" class="btn btn-info">更新</a>
					&nbsp;
					<a href="deleteStu?stuNum=<%= stuBean.getStuNum() %>"
						onclick="return confirm('确定删除?')" class="btn btn-danger">删除</a>
				</td>
			</tr>
			<%
				count++;}
			%>


		</table>
		<center>
                                         共<%=totalPage %>页 第<%=pageNo %>页 
               <a href="admin/student/showStuInfo.jsp?pageNo=1">首页</a> 
               <a href="admin/student/showStuInfo.jsp?pageNo=<%=pageNo-1 %>">上一页</a> 
               <a href="admin/student/showStuInfo.jsp?pageNo=<%=pageNo+1 %>" >下一页</a> 
               <a href="admin/student/showStuInfo.jsp?pageNo=<%=totalPage %>">末页</a>
        </center>
	</body>
</html>
