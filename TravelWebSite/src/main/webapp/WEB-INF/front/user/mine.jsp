<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	if("${msg}"){
		alert("${msg}");
	} 
	if("${succeed}"){
		alert("${succeed}");
	} 
});
//上传图片
/* function uploadPic(){
	var options={
			url:"/upload/uploadPic"
			dataType:"json",
			type:"post",
				success:function(data){
					
				}
	}
	//jequery.form使用方式
	$("#jvForm").ajaxSubmit(options);
} */
function updateUserUI(id){
	window.location.href='${ctx}/mine/toUpdateUserUI.do?id='+id; 
}
function updateUserPhotoUI(id){
	window.location.href='${ctx}/mine/toUpdateUserPhotoUI.do?id='+id; 
}
</script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/blog.css">
</head>
<body>
	<div class="intr">
		<span class="avtar"></span>
		<p class="peointr">
			欢迎&nbsp;
			<label>${user.name}</label>
			<b></b>
		</p>
	</div>
	<div class="content">
		<div class="title" id="part1">我的资料</div>
		<div class="main clearfix"></div>
		<div class="persional_property">
			<div class="person_info_con">
				<i class="icon-edit icon-large person-info-edit"></i><a
					name="M_base"></a>
				<dl class="person-photo" style="display: inline-block; float: left;">
					<dt>
						<a <%-- href="javascript:void(0);" onclick="updateUserPhotoUI(${user.id});" --%>><img src="${ctx}${user.photo}" class="header" style="width:200px;height:200px"><span
							class="edit_person_pic"></span></a>
					</dt>
					<!-- <dd class="focus_num"
						style="width: 72px; margin-left: 25px; height: 32px; border-right: 1px solid #f0f0f0; float: left; font-size: 20px; color: #019875; text-align: center; overflow: hidden; padding-top: 8px;">
						<b><a href="/my/follow" target="_blank">23</a></b>关注
					</dd>
					<dd class="fans_num"
						style="width: 72px; height: 32px; float: left; font-size: 20px; color: #019875; text-align: center; overflow: hidden; padding-top: 8px;">
						<b><a href="/my/fans" target="_blank">3</a></b>粉丝
					</dd> -->
				</dl>
				<dl class="person-info"
					style="float: left; width: 650px; height: 230px; color: #019875; margin-top: 0px; margin-left: 10px; font-size: 17px; display: inline-block;">
					<dt class="person-nick-name">
						<span>${user.name }</span><span><a href="javascript:void(0);"
							onclick="updateUserUI(${user.id});"><span style="color: #e4e023;">☚☚☚</span> </a></span>
					</dt>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info_null">昵称：</span><span style="color: #eb7350;">
							<b>${user.name }</b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info_null">年龄：</span><span style="color: #eb7350;">
							<b>${user.age } </b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info_null">生日：</span><span style="color: #eb7350;">
							<b>${user.birthday }</b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info_null">等级：</span><span style="color: #eb7350;">
							<b>${user.rank }</b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info-null">地区：</span><span style="color: #eb7350;">
							<b>${user.area }</b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info-null">简介：</span><span style="color: #eb7350;">
							<b>${user.info }</b>
						</span>
					</dd>
					<!-- <dd style="margin: 10px 0px">
						<div class="person-status clearfix">
							<div class="status" style="margin-top: 10px">
								<span><a href="javascript:;" class="cb"></a>经验</span> <span class="scores"><em
									class="download down1"
									onclick="javascript:window.open('http://download.csdn.net/my','_blank')"
									title="当前积分：4"><a></a></em>积分 </span>
							</div>
						</div>
					</dd> -->
				</dl>

			</div>

		</div>
	</div>
	<div class="content">
		<div class="title" id="part2">我的上传</div>
		<div class="main clearfix"></div>
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				 <li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<!-- <li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
			</ol>
			<div class="carousel-inner" role="listbox">

				<div class="item active"
					style="margin: 0 auto; padding-left: 80px; height: 360px;">
					<div class="person_info_con"">
					<c:forEach items="${cList}" var="cFood" varStatus="current">
					<dl class="person-photo"
							style="display: inline-block; float: left;">
							<div class="pic pic1"><a href="${ctx}/foods/detailFoodsUI.do?id=${cFood.id}">
								<img src="${ctx}${cFood.url}" alt=""
									style="width: 220px; height: 250px;">
									</a>

								<div class="pic-info"
									style="margin-top: 15px; float: left; margin-left: 10px;">
									<p>美食：${cFood.name }</p>
									<p>产地：${cFood.addressName }</p>
								</div>
								<div class="pic-time-min"
									style="margin-top: 15px; float: right;">
									<p>上传时间</p>
									<p>${cFood.createDate }</p>
								</div>
							</div>
						</dl>
					</c:forEach>
					 <%-- <dl class="person-photo"
							style="display: inline-block; float: left;">
							<div class="pic pic1">
								<img src="${ctx}/images/foods/guoqiaomixian.jpg" alt=""
									style="width: 220px; height: 290px;">

								<div class="pic-info"
									style="margin-top: 15px; float: left; margin-left: 10px;">
									<p>美食：过桥米线</p>
									<p>产地：云南</p>
								</div>
								<div class="pic-time-min"
									style="margin-top: 15px; float: right;">
									<p>上传时间</p>
									<p>2016-12-7 9:26</p>
								</div>
							</div>
						</dl> --%>
						
						
					</div>
				</div>
				<div class="item"
					style="margin: 0 auto; padding-left: 80px; height: 360px;">
					<div class="person_info_con">
					<c:forEach items="${aTlist}" var="aTaddress" varStatus="current">
					<dl class="person-photo"
							style="display: inline-block; float: left;">
							<div class="pic pic1"><a href="${ctx}/travel/detailAddressUI.do?id=${aTaddress.id}">
								<img src="${ctx}${aTaddress.url}" alt=""
									style="width: 220px; height: 250px;">
									</a>

								<div class="pic-info"
									style="margin-top: 15px; float: left; margin-left: 10px;">
									<p>景点：${aTaddress.name }</p>
									<p>美食：${aTaddress.foodsName }</p>
								</div>
								<div class="pic-time-min"
									style="margin-top: 15px; float: right;">
									<p>上传时间</p>
									<p>${aTaddress.createDate }</p>
								</div>
							</div>
						</dl>
					</c:forEach>
						
						
						
					</div>
				</div> 
				 <%-- <div class="item"
					style="margin: 0 auto; padding-left: 80px; height: 360px;">
					<div class="person_info_con">
						<dl class="person-photo"
							style="display: inline-block; float: left;">
							<div class="pic pic1">
								<img src="${ctx}/images/foods/roujiamo.jpg" alt=""
									style="width: 220px; height: 290px;">

								<div class="pic-info"
									style="margin-top: 15px; float: left; margin-left: 10px;">
									<p>美食：肉夹馍</p>
									<p>产地：西安</p>
								</div>
								<div class="pic-time-min"
									style="margin-top: 15px; float: right;">
									<p>上传时间</p>
									<p>2016-12-7 9:26</p>
								</div>
							</div>
						</dl>
						<dl class="person-photo"
							style="display: inline-block; float: left;">
							<div class="pic pic1">
								<img src="${ctx}/images/foods/mapodoufu.jpg" alt=""
									style="width: 220px; height: 290px;">

								<div class="pic-info"
									style="margin-top: 15px; float: left; margin-left: 10px;">
									<p>美食：麻婆豆腐</p>
									<p>产地：长沙</p>
								</div>
								<div class="pic-time-min"
									style="margin-top: 15px; float: right;">
									<p>上传时间</p>
									<p>2016-12-7 9:26</p>
								</div>
							</div>
						</dl>
						<dl class="person-photo"
							style="display: inline-block; float: left;">
							<div class="pic pic1">
								<img src="${ctx}/images/foods/shanxiliangpi.jpg" alt=""
									style="width: 220px; height: 290px;">

								<div class="pic-info"
									style="margin-top: 15px; float: left; margin-left: 10px;">
									<p>美食：凉皮</p>
									<p>产地：西安</p>
								</div>
								<div class="pic-time-min"
									style="margin-top: 15px; float: right;">
									<p>上传时间</p>
									<p>2016-12-7 9:26</p>
								</div>
							</div>
						</dl>
					</div>
				</div> --%>

			</div>

			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a> 
		</div>



	</div>

	<div class="content">
		<div class="title" id="part3">我的点赞</div>
		<div class="container" style="height: 450px;">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="tabbable" id="tabs-333417">
						<ul class="nav nav-tabs">
							<li><a href="#panel-500139" data-toggle="tab">已评论</a></li>
							<li class="active"><a href="#panel-567772" data-toggle="tab">已收藏</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane" id="panel-500139">
								
								 <c:forEach items="${aList}" var="aFood" varStatus="current">
    
    							<div class="pic pic1">
									<a href="${ctx}/foods/detailFoodsUI.do?id=${aFood.id}"><img src="${ctx}${aFood.url}" alt=""/></a>
									<p>美食:${aFood.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产地:${aFood.addressName }</p>
									<div class="pic-info"
										style="margin-top: 15px; float: left; margin-left: 10px;">
										<!-- <p>真心不错，真的很好吃</p> -->
									</div>
									<div class="pic-time-min"
										style="margin-top: 15px; float: right;">
										<p>${aFood.createDate }</p>
									</div>
								</div>
    							</c:forEach>
								
								
							</div>
							<div class="tab-pane active" id="panel-567772">
								
								 <c:forEach items="${bList}" var="bFood" varStatus="current">
    
    								<div class="pic pic1"><a href="${ctx}/foods/detailFoodsUI.do?id=${bFood.id}"><img src="${ctx}${bFood.url}" alt=""/></a>
									
									<p>美食:${bFood.name }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产地:${bFood.addressName }</p>
									<div class="pic-info"
										style="margin-top: 15px; float: left; margin-left: 10px;">
										<p></p>
									</div>
									<div class="pic-time-min"
										style="margin-top: 15px; float: right;">
										<p>${bFood.createDate }</p>
									</div>
								</div>
    	
    					</c:forEach>
								
								
								
								
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="content">
		<div class="title" id="part4">美食上传</div>
		<div class="container">
			<div class="row clearfix1">
				<div class="col-md-12 column">
				<font color="red"></font>
					<form role="form" align="left" style="color: #019875"
						action="${ctx}/foods/foodsUpload.do" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="foodname">美食名称：</label><input type="text"
								class="form-control" id="name" name="name" />
						</div>
						<div class="form-group">
							<label for="foodname">美食产地：</label><input type="text"
								class="form-control" id="addressName" name="addressName" />
						</div>
						<div class="form-group">
							<label for="foodname">美食价格：</label><input type="text"
								class="form-control" id="price" name="price" />
						</div>
						<div class="form-group">
							<label for="foodaddress">推荐理由：</label><input type="text"
								class="form-control" id="reason" name="reason" />
						</div>
						<div class="form-group">
							<label for="foodaddress">美食信息：</label><input type="text"
								class="form-control" id="infomation" name="infomation" />
						</div>
						<div class="form-group">
							<label for="foodpicture">上传图片</label><input type="file" id="file"
								name="file"  accept="image/jpg,image/jpeg,image/png"/>
							<p class="help-block" style="color: #019875">选择图片上传</p>
						</div>
						<%-- <input type="hidden" id="userId" name="userId"
							value="<s:property value="#session.userInfo.id" />"> --%>
						<button type="submit" class="btn btn-default"
							style="color: #019875;">确定上传</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<div class="content">
		<div class="title" id="part4">景点上传</div>
		<div class="container">
			<div class="row clearfix1">
				<div class="col-md-12 column">
				<font color="red"></font>
					<form role="form" align="left" style="color: #019875"
						action="${ctx}/travel/addressUpload.do" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="foodname">景点名称：</label><input type="text"
								class="form-control" id="name" name="name" />
						</div>
						<div class="form-group">
							<label for="foodname">景点美食：</label><input type="text"
								class="form-control" id="foodsName" name="foodsName" />
						</div>
						<div class="form-group">
							<label for="foodname">景点门票：</label><input type="text"
								class="form-control" id="price" name="price" />
						</div>
						<div class="form-group">
							<label for="foodaddress">推荐理由：</label><input type="text"
								class="form-control" id="reason" name="reason" />
						</div>
						<div class="form-group">
							<label for="foodaddress">景点信息：</label><input type="text"
								class="form-control" id="information" name="information" />
						</div>
						<div class="form-group">
							<label for="foodpicture">上传图片</label><input type="file" id="file"
								name="file"  accept="image/jpg,image/jpeg,image/png" />
							<p class="help-block" style="color: #019875">选择图片上传</p>
						</div>
						<%-- <input type="hidden" id="userId" name="userId"
							value="<s:property value="#session.userInfo.id" />"> --%>
						<button type="submit" class="btn btn-default"
							style="color: #019875;">确定上传</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Js-->
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugin.js"></script>
</body>
</html>