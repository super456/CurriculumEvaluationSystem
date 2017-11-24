<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="couBean" class="admin.bean.course.CourseInfo"/>
<jsp:useBean id="sqlBean" class="admin.bean.course.CourseSqlBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    int rowCount = con.getCount("select count(*) from courseInfo inner join teaInfo on courseInfo.teaNum=teaInfo.teaNum where "+select+" like '%"+userInfo+"%' and couTerm="+couTerm); //获取总行数
    int totalPage = 0; //总页数
    totalPage = (rowCount + pageSize - 1)/pageSize; //计算总页数
     
    if(pageNo > totalPage) pageNo = totalPage;
     
    int startPos = (pageNo-1) * pageSize; //每页开始的帖子
    String sql = "select top "+pageSize+" couNum,teaInfo.teaNum,teaName,couName,couTerm,couFrom,couTime,couPlace," +
				"couCredit,couRemarks from courseInfo inner join teaInfo on courseInfo.teaNum=teaInfo.teaNum " +
				"where "+select+" = '"+userInfo+"' and couTerm= "+couTerm+" and couNum not in " +
				"(select top "+startPos+" couNum from courseInfo inner join teaInfo on courseInfo.teaNum=teaInfo.teaNum " +
				"where couTerm="+couTerm+" order by couFrom,teaInfo.teaNum) order by couFrom,teaInfo.teaNum";
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
		%><br/>
		<center>
		<form action="selectByCouInfo" method="post" name=form>
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
				<option value="teaNum">教师编号</option>
				<option value="teaName">教师姓名</option>
				<option value="couNum">课程编号</option>
				<option value="couName">课程名称</option>
				<option value="couFrom">课程单位</option>			
				</select>
				<input type="text" name="userInfo" style="width: 160px; height: 25px" class="input-medium search-query" placeholder="请输入全称" required/>
				<input type="submit" value="搜索" class="btn btn-success" />
			</form>
		</center>
		<table class="table table-striped table-bordered table-hover table-condensed">
<tr>
	<th>序号</th>
  <th>课程编号</th>
  <th>教师编号</th>
  <th>任课老师</th>
  <th>课程名称</th>
  <th>开课学期</th>
  <th>课程单位</th>
  <th>上课时间</th>
  <th>上课地点</th>
  <th>学分</th>
  <th>备注</th>
  <th>操作</th>
</tr>

			<%
			    sqlBean.startCon();
				java.util.List list = sqlBean.showAllCou(sql);
				int count=1;//序号自增序列
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					couBean = (admin.bean.course.CourseInfo) it.next();
			%>
			<tr>
				<td><%=count %></td>
				<td><%=couBean.getCouNum() %></td>
				<td><%=couBean.getTeaNum() %></td>
				<td><%=couBean.getTeaName() %></td>
				<td><%=couBean.getCouName() %></td>
				<td><%=couBean.getCouTerm() %></td>
				<td><%=couBean.getCouFrom() %></td>
				<td><%=couBean.getCouTime() %></td>
				<td><%=couBean.getCouPlace() %></td>
				<td><%=couBean.getCouCredit() %></td>
				<td><%=couBean.getCouRemarks() %></td>
				<td>
					<a href="searchByCouNum?couNum=<%=couBean.getCouNum() %>&couTerm=<%=couTerm %>" class="btn btn-info">更新</a>
					<a href="deleteCou?couNum=<%= couBean.getCouNum() %>&couTerm=<%=couTerm %>"
						onclick="return confirm('确定删除?')" class="btn btn-danger">删除</a>
				</td>
			</tr>
			<%
				count++;}
			%>


		</table>
		<center>
                                         共<%=totalPage %>页 第<%=pageNo %>页 
               <a href="admin/course/selectByCouInfo.jsp?pageNo=1&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">首页</a> 
               <a href="admin/course/selectByCouInfo.jsp?pageNo=<%=pageNo-1 %>&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">上一页</a> 
               <a href="admin/course/selectByCouInfo.jsp?pageNo=<%=pageNo+1 %>&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">下一页</a> 
               <a href="admin/course/selectByCouInfo.jsp?pageNo=<%=totalPage %>&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">末页</a>
        </center>
		
	</body>
</html>
