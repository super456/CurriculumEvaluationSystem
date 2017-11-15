<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
                            <div class="li-item"><em class="scm li-ico ic1"></em>个人信息<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看个人信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/personInfo/showAdminInfo.jsp" data-index="1">查看个人信息</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="javascript:;" class="dd-item">修改密码<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/personInfo/changeAdminPwd.jsp" data-index="1">修改密码</li>
                                    </ul>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic1"></em>学生信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看所有学生信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/student/showStuInfo.jsp" data-index="1">查看所有学生信息</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="javascript:;" class="dd-item">添加学生信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/student/addStuInfo.jsp" data-index="1">添加学生信息</li>
                                    </ul>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic2"></em>教师信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看所有教师信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/teacher/showTeaInfo.jsp" data-index="1">查看所有教师信息</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="javascript:;" class="dd-item">添加教师信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/teacher/addTeaInfo.jsp" data-index="1">添加教师信息</li>
                                    </ul>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic6"></em>管理员信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看所有管理员信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/adminInfo/showAdminInfo.jsp" data-index="1">查看所有管理员信息</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="javascript:;" class="dd-item">添加管理员信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/adminInfo/addAdminInfo.jsp" data-index="1">添加管理员信息</li>
                                    </ul>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic3"></em>课程信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看所有课程信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/course/showCourseInfo.jsp" data-index="1">查看所有课程信息</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="javascript:;" class="dd-item">添加课程信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/course/addCourseInfo.jsp" data-index="1">添加课程信息</li>
                                    </ul>
                                </dd>
                                
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic4"></em>课程评比信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看课程评比结果<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/commentCourse/showTeaPraiseListInfo.jsp" data-index="1">查看课程评比结果</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看课程评比详情<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/commentCourse/showCommentCouInfo.jsp" data-index="1">查看课程评比详情</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看班级学生评比信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/commentCourse/showCouClassStuInfo.jsp" data-index="1">查看班级学生评比信息</li>
                                    </ul>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic7"></em>评教卡内容管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看评教卡内容<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/commentContent/showComCon.jsp" data-index="1">查看评教卡内容</li>
                                    </ul>
                                </dd>
                                <dd>
                                 <a href="javascript:;" class="dd-item">添加评教卡内容<span class="scm dd-ar"></span></a>
                                 <ul class="ad-item-list">
                                    <li class="J_menuItem" href="admin/commentContent/addComCon.jsp" data-index="1">添加评教卡内容</li>
                                 </ul>
                                </dd>
                            </dl>                            
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic5"></em>通告栏信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="javascript:;" class="dd-item">查看所有通告栏信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/noticeBar/showNoticeBarInfo.jsp" data-index="1">查看所有通告栏信息</li>
                                    </ul>
                                    
                                </dd>
                                <dd>
                                    <a href="javascript:;" class="dd-item">通告栏信息限制<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/noticeBar/noticeBarInfoLimit.jsp" data-index="1">通告栏信息限制</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="javascript:;" class="dd-item">添加通告栏信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/noticeBar/addNoticeBarInfo.jsp" data-index="1">添加通告栏信息</li>
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
                            <div class="ad-search-box clear">
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
                            </div>
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
                <div class="ad-main-comment J_mainContent" id="ad-iframe">
                    <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="admin/homePage.jsp" frameborder="0" data-id="index_v0.html" seamless></iframe>
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
