<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="student.bean.NoticeBarList"%>

 <jsp:useBean id="showStuNoticeBar" class="student.bean.NoticeBarList" scope="session"/>
<jsp:useBean id="conSql" class="publicConnectSql.connectSql" scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生课程评教管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="publicStyle/css/public.css" type="text/css" rel="stylesheet">
    <link href="publicStyle/css/houtai.css" type="text/css" rel="stylesheet">
    <link href="publicStyle/css/smartMenu.css" type="text/css" rel="stylesheet">
	<!-- 添加网站图标为学校院徽 -->
	<link rel="shortcut icon" href="publicStyle/images/favicon.ico"/>
  </head>
  
  <body>
<div id="admin">
    		<div class="ad-menu" id="ad-menu">
                <div class="ad-logo"><img src="publicStyle/images/m-logo.png" height="103" width="130"></div>
                <div class="ad-list">
                    <ul>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic1"></em>通告栏<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">通知列表<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                                      <!-- 以下是添加通告栏连接数据库展示文章标题的代码 -->
   
                                   <%
											String sql = "select * from noticeBarInfo  where noticeBarInfoLimit=1 or noticeBarInfoLimit=0";
											conSql.StartCon();
											int count=1;
                                   			java.util.List list = conSql.showStuAndTeaNoticeBar(sql);
											for (java.util.Iterator it = list.iterator(); it.hasNext();) {
											showStuNoticeBar = (NoticeBarList) it.next();
									%>
									 <li class="J_menuItem" href="viewNoticeBarContent?noticeBarNum=<%=showStuNoticeBar.getNoticeBarInfoNum() %>" data-index="1"><%= count%>、<%=showStuNoticeBar.getTitle() %></li>
										
									<% count++; } %>
                                       
                                    </ul>
                                </dd>
                                
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic2"></em>评教课程<span class="scm arrow"></span></div>
                                
                               <dl>
                               		<dd>
                               		 <a href="javascript:;" class="dd-item">查看评教信息<span class="scm dd-ar"></span></a>
                                	<ul class="ad-item-list">
                                        <li class="J_menuItem" href="student/evaluation/index.jsp?couTerm=171802" data-index="1">查看评教信息</li>
                                <!--     <li class="J_menuItem" href="index_v2.html" data-index="2">未评教课程</li>
                                        <li class="J_menuItem" href="index_v3.html" data-index="3">选择评教课程</li>    -->    
                                    </ul>
                                   </dd>
                                   
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic3"></em>个人信息<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看及修改<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="student/personalInfo" data-index="1">查看信息</li>
                                        <li class="J_menuItem" href="student/personalInfo/update.jsp" data-index="2">修改信息</li>
                                        <li class="J_menuItem" href="student/personalInfo/changePsw.jsp" data-index="3">修改密码</li>
                                    </ul>
                                </dd>                               
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic4"></em>教师好评榜<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">各学期好评<span class="scm dd-ar"></span></a>
                                     <ul class="ad-item-list">
                                        <li class="J_menuItem" href="student/teaPraiseListInfo/index.jsp?couTerm=171802" data-index="1">各学期好评</li>
                                        <li class="J_menuItem" href="student/teaPraiseListInfo/honor.jsp?couTerm=171801" data-index="2">获奖荣誉</li>
                                    </ul>
                                </dd>
                            </dl>
                        </li>
                    </ul>
                </div>
            </div>
    		<div class="ad-comment-box" id="ad-comment">
                <div class="ad-top-comment">
                    <div class="ad-message">
                        <div class="ad-top-left">
                            <div class="ad-change-btn"><a id="ad-list" href="javascript:;" class="scm ad-list-btn"></a></div>
                          <!--  <div class="ad-search-box clear">
                                <div class="ad-search-sel">
                                    <select>
                                        <option>新闻类</option>
                                        <option>新闻吩咐道类</option>
                                        <option>新闻广告费类</option>
                                        <option>新闻苟富贵类</option>
                                    </select>
                                </div>
                                <div class="ad-search-cha">
                                    <input type="text" class="ad-search-input" placeholder="请输入你要查找的内容">
                                    <input type="submit" class="scm ad-search-btn" value=""> 
                                </div>
                            </div>-->
                        </div>
                        <div class="ad-top-right">
                            <div class="ad-notice">
                                <ul>
                                    <li>
                                        <a href="javascript:;" class="scm nt1"><span class="scm nt-count dot">12</span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" class="scm nt2"><span class="scm nt-count dot">12</span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" class="scm nt3"><span class="scm nt-count dot">12</span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="ad-welcom">
                                <div class="ad-wel-img"><img src="publicStyle/images/top-logo.png" height="36" width="36"></div>
                                <div class="ad-wel-text">
                                    <div class="font-wel">欢迎您：<strong><%= session.getAttribute("userName") %>&nbsp;<%= session.getAttribute("loginIdentity") %></strong></div>
                                    	<div class="font-wel">
                                    		<strong>
                                    			<a href="loginOut.jsp" onclick="return confirm('确定退出吗？');">安全退出</a>
                                    			</strong>
                                    		</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ad-main-nav-box">
                        <ul id="breadcrumbs-three">
                            <li title="首页"><a href="javascript:;" class="dot">首页</a></li>
                        </ul>
                        <a href="javascript:;" class="scm jian-a J_mainLeft main-sel pre"></a>
                        <div class="ad-main-wraper .J_menuItems">
                            <ul class="ad-main-list" id="ad-main">
                            </ul>
                        </div>
                        <a href="javascript:;" class="scm jian-a J_mainRight next"></a>
                    </div>
                    <div class="ad-sub-nav-box content-tabs">
                        <!-- <div class="ad-sub-record">历史记录</div> -->
                        <a href="javascript:;" class="scm jian-a sub-sel pre j_tabBg J_tabLeft"></a>
                        <div class="ad-sub-wraper page-tabs J_menuTabs">
                            <ul class="ad-sub-list page-tabs-content">
                                <li class="active J_menuTab" data-id="index_v0.html">首页</li>
                            </ul>
                        </div>
                        <a href="javascript:;" class="scm jian-a next j_tabBg J_tabRight"></a>
                    </div>
                </div>
                
                <!-- 登录主页面右侧显示的的内容 -->
                <div class="ad-main-comment J_mainContent" id="ad-iframe">
                    <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="student/homePage.jsp" frameborder="0" data-id="index_v0.html" seamless></iframe>
                </div>
    		</div>
    	</div>
        <script type="text/javascript" src="publicStyle/js/jquery.min.js"></script>
        <script type="text/javascript" src="publicStyle/js/contabs.js"></script>
        <script type="text/javascript" src="publicStyle/js/maintabs.js"></script>
        <script type="text/javascript" src="publicStyle/js/jquery-smartMenu-min.js"></script>
        <script type="text/javascript" src="publicStyle/js/jquery.nicescroll.min.js"></script>
        <script type="text/javascript">
            $(function(){
                $(".ad-menu").niceScroll({cursorborder:"0 none",cursorcolor:"#1a1a19",cursoropacitymin:"0",boxzoom:false});
            })
        </script>
  </body>
</html>