<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%> 
<template:include file="/WEB-INF/view/resource/base.jsp" nav-left="nas">
	<template:replace name="title">
		PaaSOS--资源服务
	</template:replace>
	<template:replace name="content-path">
		<em>&gt;</em>
		<p class="app_a"> <a href="${WEB_APP_PATH}/resource/nas/nfs/index.do">数据存储 </a> </p>
		<em>&gt;</em>
		<p class="app_a">创建网络存储实例</p>
	</template:replace>
	<template:replace name="content-body">
		

<div class="plate">
	<div class="project_r">
		<!--创建网络存储实例开始-->
		<div class="r_block p20">
			<div class="r_title">
				<h3 class="f14 h3_color h3_btm_line blue">
					<a href="javascript:void(0);"> <i
						class="icons ico_title_list mr5"></i>创建网络存储实例
					</a>
				</h3>
				<div class="title_line"></div>
			</div> 
			<div class="r_con p10_0">
				<div class="form_control p20">
					<div class="form_block">
						<label>实例名称</label>
						<div class="specList">
							<input type="text" name="instanceName"><em>*</em>
						</div>
					</div> 
					<div class="form_block">
						<label>环境类别</label>
						<ul class="u-flavor" id="envType">
							<c:forEach items="${envTypes }" var="item">
								<li data="${item.key}">${item.value}</li>
							</c:forEach>
						</ul>
					</div>

					<div class="form_block">
						<label>存储空间</label>
						<div class="specList">
							<ul class="u-flavor" id="nfsStorage">
							</ul>
						</div>
					</div>
					<div class="form_block">
						<label>描述信息</label>
						<div class="specList">
							<textarea rows="6" cols="53" id="resDesc"></textarea>
						</div>
					</div>
					<div class="form_block">
						<label>租户组织</label>
						<div class="specList">
							<span>${tenantName }</span>
						</div>
					</div>
					<div class="form_block">
						<label>创建者</label>
						<div class="specList">
							<span>${userName}</span>
						</div>
					</div>
					<div class="form_block mt10">
						<label>&nbsp;</label>
						<button class="btn btn-default btn-yellow f16  mt10"
							onclick="addPaasNFS()">
							<i class="ico_check"></i>创 建
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--创建网络存储实例结束-->
	</div>
</div>
	</template:replace>
	<template:replace name="bottom">
		<template:super/>
		
<script>
		var storageOptions;
		$(function(){
			var options = '${options}';
			if(options!=''){
				try{
					var jsonOptions = JSON.parse(options);
					storageOptions = jsonOptions.storage;
					var versionOptions = jsonOptions.version;
					if(versionOptions && versionOptions.length){
						for(var i=0; i<versionOptions.length;i++){
							$("#version").append("<li>"+versionOptions[i]+"</li>");
						}
						bindLiEleClickByParent('version');
					}
					bindLiEleClickByParent('envType',true);
					toggleEnv();
				}catch(e){
					common.tips("获取资源配额失败");
				}
			}else{
				common.tips("获取资源配额失败");
			}
			
		});
		
		function bindLiEleClickByParent(parentId,changeLimit){
			var parentEle= $("#"+parentId);
			parentEle.find(">li").bind("click",function(){
				var ob = $(this);
				parentEle.find(">li").each(function(){	$(this).removeAttr("class");})
				ob.attr("class","selected");
				if(typeof changeLimit !='undefined'){
					toggleEnv();
				}
			});
			parentEle.find(">li:first").attr("class","selected");
		}
		
		function toggleEnv(){
			var _envType = $("#envType").find(">li.selected").attr("data");
			if(storageOptions&& storageOptions.length){
				$("#nfsStorage").empty();
				for(var i=0; i<storageOptions.length;i++){
					if(storageOptions[i].envType==_envType){
						var _storagesize = storageOptions[i].free;
						if(_storagesize && _storagesize.length){
							for(var j=0;j<_storagesize.length;j++){
								$("#nfsStorage").append("<li>"+_storagesize[j]+"</li>");
							}
						}
					}
				}
				bindLiEleClickByParent('nfsStorage');
			}
		}
		
		function addPaasNFS(){
			var data ={};
			var instanceName = $.trim($("input[name='instanceName']").val());
			if(instanceName == ''){
				common.tips("实例名称为空");
				return false;
			}
			data.instanceName = instanceName;
			var version = $("#version").find(">li.selected").text();
			data.version = version;
			data.source="paasOS-UI";
			var storage = $("#nfsStorage").find(">li.selected").text();
			data.storage = storage;
			var envType = $("#envType").find(">li.selected").attr("data");
			data.envType = envType;
			var tenantName = $.trim($("input[name='tenantName']").val());
			var nasType = 'NFS';
			data.nasType = nasType;
			data.resDesc = $("#resDesc").val();
			if(storage==''){
				common.tips("没有选择存储空间配额大小");
				return false;
			}
			var url = "${WEB_APP_PATH}/resource/nas/nfs/save.do";
			var load = common.loading();
			$.post(url,data,function(json){
				load.close();
				if(json.code==0){
					common.goto("${WEB_APP_PATH}/resource/nas/nfs/index.do");
				}else{
					common.tips("添加网络存储实例失败\n"+json.msg,null,null,200000);
				}
			});
		}
	</script>
	</template:replace>
</template:include> 