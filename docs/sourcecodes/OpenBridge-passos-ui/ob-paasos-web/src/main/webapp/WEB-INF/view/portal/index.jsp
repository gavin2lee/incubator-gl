<%@page import="com.harmazing.framework.util.WebUtil"%>
<%@page import="com.harmazing.framework.authorization.IUser"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%
	response.addHeader("login", "true");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>首页</title>
<meta name="description" content="User login page" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link rel="stylesheet" href="../assets/css/layout.css" />
<link rel="stylesheet" href="../assets/css/main.css" />
<script type="text/javascript" src="../assets/js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" href="../assets/css/app_deployment.css" />

</head>

<body>
	<div class="ob_warp">
		<div class="ob_header">
			<div class="ob_logo">
				<i></i>
			</div>
			<div class="user">
				<ul class="nav_bar2">
					<li><a href="#"><i class="top_icos msg_ico"></i>消息</a></li>
					<li><a href="#"><i class="top_icos work_ico"></i>工单</a></li>
					<li class="ob_user">
						<%
							IUser user = WebUtil.getUserByRequest(request);
							if (user == null || user.isAnonymous()) {
						%> <a href="${ WEB_APP_PATH }/login.jsp">登录</a> <%
 	                    } else {
                        %> <a href="#"><i class="icons user_ico"></i>
							<p><%=user.getUserName()%>
								<em class="icons arrow-btm"></em>
							</p></a> 
						<div class="list2">
							<a href="${ WEB_APP_PATH }/app/index.do">我的APP</a><br /> <a
								href="${ WEB_APP_PATH }/logout.jsp">退出</a><br />
						</div>
					</li>
				</ul>
				<%
					}
				%>
			</div>
		</div>
		<div class="content_ob">
			<div class="ob_block ob-app">
				<h1>
					<a href="${ WEB_APP_PATH }/portal/home.do"> <i
						class="ob_ico"></i>
						<p>轻应用管理平台</p>
					</a>
				</h1>
				<div class="ob_img">
					<i></i>
				</div>
				<ul class="ob_list">
					<li><span><a href="#">457</a>个</span><i></i>APP总数：</li>
					<li><span><a href="#">157</a>个</span><i></i>服务总数：</li>
				</ul>
				<div class="group_button">
					<a href="${ WEB_APP_PATH }/app/create.do"><i class="ob_btn_ico01"></i>创建APP</a> <a href="${ WEB_APP_PATH }/app/index.do"><i
						class="ob_btn_ico02"></i>我的APP</a>
				</div>
				<div class="ob_block_btm">
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico01"></i>
							</dt>
							<dd>用户手册</dd>
						</a>
					</dl>
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico02"></i>
							</dt>
							<dd>快速指南</dd>
						</a>
					</dl>
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico03"></i>
							</dt>
							<dd>最新功能</dd>
						</a>
					</dl>
				</div>
			</div>
			<div class="ob_block ob-api">
				<h1>
					<a href="http://demo.openbridge.cn/api/sys/portal/welcome.do">
						<i class="ob_ico"></i>
						<p>微服务管理平台</p>
					</a>
				</h1>
				<div class="ob_img">
					<i></i>
				</div>
				<ul class="ob_list">
					<li><span><a href="#">457</a>个</span><i></i>服务市场：</li>
					<li><span><a href="#">157</a>个</span><i></i>我的API服务：</li>
				</ul>
				<div class="group_button">
					<a href="#"><i class="ob_btn_ico01"></i>创建服务</a> <a href="#"><i
						class="ob_btn_ico02"></i>导入服务</a>
				</div>
				<div class="ob_block_btm">
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico01"></i>
							</dt>
							<dd>用户手册</dd>
						</a>
					</dl>
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico02"></i>
							</dt>
							<dd>快速指南</dd>
						</a>
					</dl>
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico03"></i>
							</dt>
							<dd>最新功能</dd>
						</a>
					</dl>
				</div>
			</div>
			<div class="ob_block ob-pas">
				<h1>
					<a href="#"> <i class="ob_ico"></i>
						<p>平台资源管理</p>
					</a>
				</h1>
				<div class="ob_img">
					<i></i>
				</div>
				<ul class="ob_list">
					<li><span><a href="#">457</a>个</span><i></i>容器总数：</li>
					<li><span><a href="#">157</a>个</span><i></i>服务总数：</li>
				</ul>
				<div class="group_button">
					<a href="#"><i class="ob_btn_ico01"></i>创建容器</a> <a href="#"><i
						class="ob_btn_ico02"></i>查看容器</a>
				</div>
				<div class="ob_block_btm">
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico01"></i>
							</dt>
							<dd>用户手册</dd>
						</a>
					</dl>
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico02"></i>
							</dt>
							<dd>快速指南</dd>
						</a>
					</dl>
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico03"></i>
							</dt>
							<dd>最新功能</dd>
						</a>
					</dl>
				</div>
			</div>
			<div class="ob_block ob-ias">
				<h1>
					<a href="#"> <i class="ob_ico"></i>
						<p>基础资源管理平台</p>
					</a>
				</h1>
				<div class="ob_img">
					<i></i>
				</div>
				<ul class="ob_list">
					<li><span><a href="#">457</a>个</span><i></i>虚拟机总数：</li>
					<li><span><a href="#">157</a>个</span><i></i>正常运行：</li>
				</ul>
				<div class="group_button">
					<a href="#"><i class="ob_btn_ico01"></i>创建虚拟机</a> <a href="#"><i
						class="ob_btn_ico02"></i>系统概况</a>
				</div>
				<div class="ob_block_btm">
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico01"></i>
							</dt>
							<dd>用户手册</dd>
						</a>
					</dl>
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico02"></i>
							</dt>
							<dd>快速指南</dd>
						</a>
					</dl>
					<dl>
						<a href="#">
							<dt>
								<i class="ob_info_ico03"></i>
							</dt>
							<dd>最新功能</dd>
						</a>
					</dl>
				</div>
			</div>
		</div>
		<div class="login_footer">
			<span>Copyright &copy; 云桥 Openbridge</span>
		</div>
	</div>
	<script type="text/javascript">
		function adjustHeight() {
			var h = $(window).height();
			var h2 = $(".ob_header").height();
			var h3 = $(".login_footer").height();
			var h4 = $(".ob_block").height();
			$(".content_ob").css("height", h - h2 - h3);
			$(".ob_block").css("margin-top", ((h - h2 - h4 - h3) / 2));
		}
		$(document).ready(function() {
			adjustHeight();
		})
		$(window).resize(function() {
			adjustHeight();
		});

		//    用户信息下拉菜单
		$(document).ready(function() {
			$('.list2').hide();
			$('.ob_user').mousemove(function() {
				$(this).find('div').slideDown("1000");//可以自己修改速度
			});
			$('.ob_user').mouseleave(function() {
				$(this).find('div').slideUp("fast");
			});
			
			$('.ob_block').mousemove(function () {
                $(this).addClass("active");//可以自己修改速度
            });
            $('.ob_block').mouseleave(function () {
                $(this).removeClass("active");
            });
		});
	</script>
</body>
</html>
