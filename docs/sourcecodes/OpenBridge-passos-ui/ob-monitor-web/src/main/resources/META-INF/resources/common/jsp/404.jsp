 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<template:include file="/common/template/body.jsp">
	<template:replace name="title">
		访问地址不存在
	</template:replace>
	<template:replace name="page-content">
								<!-- #section:pages/error -->
								<div class="error-container">
									<div class="well">
										<h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="ace-icon fa fa-sitemap"></i>
												404
											</span>
											Page Not Found
										</h1>

										<hr>
										<h3 class="lighter smaller">We looked everywhere but we couldn't find it!</h3>

										<div>
											<form class="form-search">
												<span class="input-icon align-middle">
													<i class="ace-icon fa fa-search"></i>

													<input type="text" class="search-query" placeholder="Give it a search...">
												</span>
												<button class="btn btn-sm" type="button">Go!</button>
											</form>

											<div class="space"></div>
											<h4 class="smaller">Try one of the following:</h4>

											<ul class="list-unstyled spaced inline bigger-110 margin-15">
												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													Re-check the url for typos
												</li>

												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													Read the faq
												</li>

												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													Tell us about it
												</li>
											</ul>
										</div>

										<hr>
										<div class="space"></div>

										<div class="center">
											<a href="javascript:history.back()" class="btn btn-grey">
												<i class="ace-icon fa fa-arrow-left"></i>
												后退
											</a>

											<a href="${ WEB_APP_PATH }/" class="btn btn-primary">
												<i class="ace-icon fa fa-tachometer"></i>
												首页
											</a>
										</div>
									</div>
								</div>

								<!-- /section:pages/error --> 
	</template:replace>
</template:include>