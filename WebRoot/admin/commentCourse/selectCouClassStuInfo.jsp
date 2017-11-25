<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="couClassBean" class="admin.bean.commentCourse.CouClassStuInfo"/>
<jsp:useBean id="sqlBean" class="admin.bean.commentCourse.CouClassStuSqlBean" />
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
    int totalPage = 0; //总页数
    con.startCon();
    String condition = "select count(*) from couClassStuInfo inner join courseInfo on couClassStuInfo.couNum=courseInfo.couNum inner join stuInfo on " +
				"stuInfo.stuNum=couClassStuInfo.stuNum where "+select+" like '%"+userInfo+"%' and couTerm= "+couTerm;
    int rowCount = con.getCount(condition); //获取总行数    int totalPage = 0; //总页数
    totalPage = (rowCount + pageSize - 1)/pageSize; //计算总页数
     
    if(pageNo > totalPage) pageNo = totalPage;
     
    int startPos = (pageNo-1) * pageSize; //每页开始的帖子
    String sql = "select top "+pageSize+" courseInfo.couNum,stuInfo.stuNum,stuName,couName,couTerm,couFrom,isTeach " +
	    		"from couClassStuInfo inner join courseInfo on couClassStuInfo.couNum=courseInfo.couNum inner join stuInfo on stuInfo.stuNum=couClassStuInfo.stuNum where couTerm="+couTerm+" and couClassStuInfoNum not in " +
	    		"(select top "+startPos+" couClassStuInfoNum from couClassStuInfo inner join courseInfo on couClassStuInfo.couNum=courseInfo.couNum inner join stuInfo on stuInfo.stuNum=couClassStuInfo.stuNum " +
	    		"where couTerm="+couTerm+" order by couFrom,courseInfo.couNum,stuInfo.stuNum) and "+select+" like '%"+userInfo+"%' order by couFrom,courseInfo.couNum,stuInfo.stuNum";
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
  <center>
			<br/>
			<form action="selectByCouClassStuInfo"  method="post" >
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
				    <option value="stuNum">
						学生编号
					</option>
				    <option value="stuName"> 
						学生姓名
					</option>
					<option value="couNum" > 
						课程编号 
					</option>
				</select>
				<input type="text" name="userInfo"
					style="width: 160px; height: 25px" class="input-medium search-query" placeholder="请输入全称"  />
				<input type="submit" value="搜索" class="btn btn-success"/>
			</form>
		</center>  
<table class="table table-striped table-bordered table-hover table-condensed">
<tr align="center">
  <th>序号</th>
  <th>课程编号</th>
  <th>学生编号</th>
  <th>学生名称</th>
  <th>课程名称</th>
  <th>开课学期</th>
  <th>开课单位</th>
  <th>是否评教</th>
  <th>操作</th>
</tr>

			<%
			    int count=1;
			    sqlBean.startCon();
				java.util.List list = sqlBean.showAllCouClassStu(sql);
				for (java.util.Iterator it = list.iterator(); it.hasNext();) {
					couClassBean = (admin.bean.commentCourse.CouClassStuInfo) it.next();
			%>
			<tr>
				<td><%=count %></td>
				<td><%=couClassBean.getCouNum() %></td>
				<td><%=couClassBean.getStuNum() %></td>
				<td><%=couClassBean.getStuName() %></td>
				<td><%=couClassBean.getCouName() %></td>
				<td><%=couClassBean.getCouTermMess() %></td>
				<td><%=couClassBean.getCouFrom() %></td>
				<td><%=couClassBean.getIsTeachMess() %></td>
				<td align="center">
				<a href="selectByCommentCouInfo?stuNum=<%=couClassBean.getStuNum() %>&couNum=<%=couClassBean.getCouNum() %>&couTerm=<%=couTerm %>" class="btn btn-info">评教分数</a>&nbsp;&nbsp;
				<a href="searchByStuNum?stuNum=<%=couClassBean.getStuNum() %>&tableName=admin/student/searchStuInfo.jsp&couTerm=<%=couTerm %>" class="btn btn-info">学生信息</a>
				</td>
			</tr>
			<%
			    count++;
				}
			%>


		</table>
		<center>
                                         共<%=totalPage %>页 第<%=pageNo %>页 
               <a href="admin/commentCourse/selectCouClassStuInfo.jsp?pageNo=1&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">首页</a> 
               <a href="admin/commentCourse/selectCouClassStuInfo.jsp?pageNo=<%=pageNo-1 %>&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">上一页</a> 
               <a href="admin/commentCourse/selectCouClassStuInfo.jsp?pageNo=<%=pageNo+1 %>&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">下一页</a> 
               <a href="admin/commentCourse/selectCouClassStuInfo.jsp?pageNo=<%=totalPage %>&select=<%=select %>&userInfo=<%=userInfo %>&couTerm=<%=couTerm %>">末页</a>
        </center>
		
	</body>
</html>
