<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>这里是有情链接部分</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
        <link rel="stylesheet" type="text/css" href="publicStyle/css/link/demo.css" />
		<link rel="stylesheet" type="text/css" href="publicStyle/css/link/slicebox.css" />
		<link rel="stylesheet" type="text/css" href="publicStyle/css/link/custom.css" />
		<link rel="stylesheet" href="http://dreamsky.github.io/main/blog/common/init.css">
<style>
		.top-banner {
			background-color: rgba(255, 255, 255, 0.55);
		}
		.top-banner a {
			color: #019135;
		}
		h1 {
			/* margin-top: 100px; */
			font-family: 'Microsoft Yahei';
			font-size: 36px;
			color: #019157;
		}		
		</style>		
		<script type="text/javascript" src="publicStyle/js/link//modernizr.custom.46884.js"></script>
  </head>
  
  <body>
<div class="container">
			<h1>我的南苑——友情链接</h1>
			
			<div class="more">
				<ul id="sb-examples">
					<li><a href="http://jwxt.nfsysu.cn/" target="_blank">教务管理系统</a></li>
					<li><a href="http://my.nfu.edu.cn/" target="_blank">校园信息门户</a></li>
					<li><a href="http://xljk.nfu.edu.cn/" target="_blank">心理咨询</a></li>
					<li><a href="http://www.nfsysu.cn/index.php" target="_blank">中山大学南方学院</a></li>
				</ul>
			</div>

			<div class="wrapper">

				<ul id="sb-slider" class="sb-slider">
					<li>
						<a href="http://jwxt.nfsysu.cn/" target="_blank"><img src="publicStyle/images/link/1.jpg" alt="image1"/></a>
						<div class="sb-description">
							<h3>教务管理系统</h3>
						</div>
					</li>
					<li>
						<a href="http://my.nfu.edu.cn/" target="_blank"><img src="publicStyle/images/link/2.jpg" alt="image2"/></a>
						<div class="sb-description">
							<h3>校园信息门户</h3>
						</div>
					</li>
					<li>
						<a href="http://xljk.nfu.edu.cn/" target="_blank"><img src="publicStyle/images/link/3.jpg" alt="image1"/></a>
						<div class="sb-description">
							<h3>心理咨询</h3>
						</div>
					</li>
					<li>
						<a href="http://www.nfsysu.cn/index.php" target="_blank"><img src="publicStyle/images/link//4.jpg" alt="image1"/></a>
						<div class="sb-description">
							<h3>中山大学南方学院</h3>
						</div>
					</li>
				</ul>

				<div id="shadow" class="shadow"></div>

				<div id="nav-arrows" class="nav-arrows">
					<a href="#" title="下一页">Next</a>
					<a href="#" title="上一页">Previous</a>
				</div>

				<div id="nav-options" class="nav-options">
					<span id="navPlay" title="播放">Play</span>
					<span id="navPause" title="暂停">Pause</span>
				</div>

			</div><!-- /wrapper -->

			<div class="footer-banner" style="width:728px; margin:30px auto"></div>
		</div>
		<script type="text/javascript" src="http://cdn.staticfile.org/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript" src="publicStyle/js/link/jquery.slicebox.js"></script>
		<script type="text/javascript">
			$(function() {
				
				var Page = (function() {

					var $navArrows = $( '#nav-arrows' ).hide(),
						$navOptions = $( '#nav-options' ).hide(),
						$shadow = $( '#shadow' ).hide(),
						slicebox = $( '#sb-slider' ).slicebox( {
							onReady : function() {

								$navArrows.show();
								$navOptions.show();
								$shadow.show();

							},
							orientation : 'h',
							cuboidsCount : 3
						} ),
						
						init = function() {

							initEvents();
							
						},
						initEvents = function() {

							// add navigation events
							$navArrows.children( ':first' ).on( 'click', function() {

								slicebox.next();
								return false;

							} );

							$navArrows.children( ':last' ).on( 'click', function() {
								
								slicebox.previous();
								return false;

							} );

							$( '#navPlay' ).on( 'click', function() {
								
								slicebox.play();
								return false;

							} );

							$( '#navPause' ).on( 'click', function() {
								
								slicebox.pause();
								return false;

							} );

						};

						return { init : init };

				})();

				Page.init();

			});
		</script>
  </body>
</html>
