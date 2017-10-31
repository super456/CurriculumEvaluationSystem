<%@ page contentType="text/html;charset=GB2312" %>
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
                            <div class="li-item"><em class="scm li-ico ic1"></em>学生信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="admin/#" class="dd-item">查看所有学生信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/showStuInfo.jsp" data-index="1">查看所有学生信息</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">更新学生信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/index_v2.html" data-index="1">更新学生信息</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">添加学生信息<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">删除学生信息<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic2"></em>教师信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="admin/#" class="dd-item">查看所有教师信息<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="admin/showTeaInfo.jsp" data-index="1">查看所有教师信息</li>
                                    </ul>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">更新指定教师信息<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">添加教师信息<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">删除教师信息<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic3"></em>课程信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="admin/#" class="dd-item">查看所有课程信息<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">添加一门课程信息<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">更新一门课程信息<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                                
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic4"></em>课程评比信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="admin/#" class="dd-item">查看课程评比结果<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">筛选课程评比结果<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">筛选查看评比详情<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">查看学生课程评比信息<span class="scm dd-ar"></span></a>
                                    
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic5"></em>通告栏信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="admin/#" class="dd-item">查看所有通告栏信息<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">通告栏信息限制<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">添加通告栏信息<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">删除通告栏信息<span class="scm dd-ar"></span></a>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic6"></em>管理员信息管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="admin/#" class="dd-item">查看所有管理员<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">添加管理员信息<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">更新管理员信息<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">删除管理员信息<span class="scm dd-ar"></span></a>
                                </dd>
                                <dd>
                                    <a href="admin/#" class="dd-item">筛选管理员信息<span class="scm dd-ar"></span></a>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="li-item"><em class="scm li-ico ic7"></em>系统管理<span class="scm arrow"></span></div>
                            <dl>
                                <dd>
                                    <a href="admin/#" class="dd-item">校友高级搜索<span class="scm dd-ar"></span></a>
                                    <ul class="ad-item-list">
                                        <li class="J_menuItem" href="index_v1.html" data-index="1">测试用例一</li>
                                        <li class="J_menuItem" href="index_v2.html" data-index="2">测试用例二</li>
                                        <li class="J_menuItem" href="index_v3.html" data-index="3">测试用例三</li>
                                        <li class="J_menuItem" href="index_v4.html" data-index="4">测试用例四</li>
                                        <li class="J_menuItem" href="index_v5.html" data-index="5">测试用例五</li>
                                        <li class="J_menuItem" href="index_v6.html" data-index="6">测试用例六</li>
                                        <li class="J_menuItem" href="index_v7.html" data-index="7">测试用例七</li>
                                        <li class="J_menuItem" href="index_v8.html" data-index="8">测试用例八</li>
                                        <li class="J_menuItem" href="index_v9.html" data-index="9">测试用例九</li>
                                        <li class="J_menuItem" href="index_v10.html" data-index="10">测试用例十</li>
                                        <li class="J_menuItem" href="index_v11.html" data-index="11">测试用例十一</li>
                                    </ul>
                                </dd>
                                <dd>
                                 <a href="admin/#" class="dd-item">校友高级搜索<span class="scm dd-ar"></span></a>
                                 <ul class="ad-item-list">
                                    <form action="admin/index_v1.html" method="post">
                                    <li type="submit" class="J_menuItem" data-index="1">校友高级搜索<span class="scm dd-ar"></li>
                                    </form>
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
                                    <div class="font-wel">欢迎您！<strong>杜世武</strong></div>
                                    <div class="font-wel"><a href="javascript:;"><strong>安全退出</strong></a></div>
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
                    <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="admin/index_v0.html" frameborder="0" data-id="index_v0.html" seamless></iframe>
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
