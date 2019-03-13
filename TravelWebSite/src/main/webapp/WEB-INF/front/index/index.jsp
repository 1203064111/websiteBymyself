<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function(){
	if("${message}"=="true"){
		alert("登录成功");
	} 
});
</script>
<title>我的网站</title>

<!-- CSS -->
<link rel="stylesheet" href="${ctx }/css/bootstrap.css">
<link rel="stylesheet" href="${ctx }/css/blog.css">
<link rel="stylesheet" href="${ctx }/css/struts.css">
</head>
<body>
	
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column "
				style="margin-top: 40px; width: 400px; margin-left: -30px;">

				<form class="navbar-form navbar-left" role="search"
					action="${ctx}/front/index/searchFoods.do" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="name"
							name="name" placeholder="美食名称">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</div>
		</div>
	</div>
	<div class="content"
		style="background-color: #6AC6F2; margin-top: 08px;">

		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="${ctx}/images/shejianlvxing.jpg" alt="...">
				</div>
				<div class="item">
					<img src="${ctx}/images/jiweixia.jpg" alt="...">
				</div>
				<div class="item">
					<img src="${ctx}/images/hangzhou.jpg" alt="...">
				</div>
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

	<div class="title" id="part1">美食</div>
	<div class="content">
	<div class="row clearfix" style="margin-left:40px;">
	<c:forEach items="${foodList}" var="food" varStatus="current">
	
		<div class="pic pic1" >
			<div>
				<a href="${ctx}/foods/detailFoodsUI.do?id=${food.id}"> <img src="${ctx}${food.url}" class="img01" />
					
				</a>
				<div align="center" ><a href="${ctx}/foods/detailFoodsUI.do?id=${food.id}" style="font-size: 20px; color: #2ee8d7;">${food.name }</a></div>
				
			</div>
			
		</div>
		</c:forEach>
		</div>
		
	</div>
	<div class="title" id="part2">旅行</div>
	<div class="content">
	<div class="row clearfix" style="margin-left:40px;">
	<c:forEach items="${addressList}" var="address" varStatus="current">
	
		<div class="pic pic1" >
			<div>
				<a href="${ctx}/travel/detailAddressUI.do?id=${address.id}"> <img src="${ctx}${address.url}" class="img01" />
					
				</a>
				<div align="center" ><a href="${ctx}/travel/detailAddressUI.do?id=${address.id}" style="font-size: 20px; color: #2ee8d7;">${address.name }</a></div>
				
			</div>
			
		</div>
		</c:forEach>
		<%-- <div class="pic pic1">
			<div class="item">
				<a href="#"> <img src="${ctx}/images/address/chengdu.jpeg" class="img01" />
					<div class="img02"></div>
				</a>
			</div>
		</div>
		<div class="pic pic1">
			<div class="item">
				<a href="#"> <img src="${ctx}/images/address/chongqing.jpg" class="img01" />
					<div class="img02"></div>
				</a>
			</div>
		</div>
		<div class="pic pic1">
			<div class="item">
				<a href="#"> <img src="${ctx}/images/address/fuzhou.jpg" class="img01" />
					<div class="img02"></div>
				</a>
			</div>
		</div> --%>
		</div>
		<!-- <div class="pic-more">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-12 column"
						style="width: 150px; margin-top: 255px; margin-left: -14px;">
						<ul class="pagination" style="width: 160px; height: 30px;">
							<li><a href="#" style="padding: 7px 9px;">Prev</a></li>
							<li><a href="#" style="padding: 7px 9px;">1</a></li>
							<li><a href="#" style="padding: 7px 9px;">2</a></li>
							<li><a href="#" style="padding: 7px 9px;">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div> -->

	</div>
	<div class="title" id="part3">社区交流</div>
	<div class="content">
		<ul class="nav nav-tabs" role="tablist">
			<li class="active"><a href="#home" role="tab" data-toggle="tab">美食栏</a></li>
			<li><a href="#profile" role="tab" data-toggle="tab">旅行栏</a></li>
		</ul>
		<div class="tab-content" style="width: 960px;">
			<div class="tab-pane active" id="home">

				<div class="container">
					<div class="row clearfix" style="margin-left:-10px;">
						<%-- <div class="pic pic1">
							<div class="">
								<a href="#"> <img src="${ctx}/images/foods/guoqiaomixian.jpg" class="img01" />
								   <div align="center" class="img02" style="color: #fba321;">过桥米线</div>
									<div class="img02" style="color: #ece472;">推荐程度：五颗星</div>
								</a>
							</div>
							<div style="margin-bottom:10px;float:left;color:#18a7a7">推荐理由：云南特产</div>
						</div> --%>
						<c:forEach items="${infrontFoodList}"  var="inFood" varStatus="current" >
						<div class="pic pic1">
							<div class="">
								<a href="${ctx}/foods/detailFoodsUI.do?id=${inFood.id}"> <img src="${ctx}${inFood.url}" class="img01" />
								   <div align="center" class="img02" style="color: #fba321;">${inFood.name }</div>
									<div class="img02" style="color: #ece472;">推荐程度：${inFood.goodTimes }</div>
								</a>
							</div>
							<div style="margin-bottom:10px;float:left;color:#18a7a7">推荐理由：${inFood.reason }</div>
						</div>
						</c:forEach>
						

					</div>
				</div>
			</div>
			<div class="tab-pane" id="profile">
				<div class="container">
					<div class="row clearfix" style="margin-left:-10px;">
					<c:forEach items="${infrontAddressList}"  var="inAddress" varStatus="current" >
						<div class="pic pic1">
							<div class="">
								<a href="${ctx}/travel/detailAddressUI.do?id=${inAddress.id}"> <img src="${ctx}${inAddress.url}" class="img01" />
								   <div align="center" class="img02" style="color: #fba321;">${inAddress.name }</div>
									<div class="img02" style="color: #ece472;">推荐程度：${inAddress.goodTimes }</div>
								</a>
							</div>
							<div style="margin-bottom:10px;float:left;color:#18a7a7">推荐理由：${inAddress.reason }</div>
						</div>
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="title" id="part4">其他美景</div>
	<div class="content"></div>
	<div class="blog-footer">
		<p>
			by <a href="http://www.tuniu.com" target="_blank">舌尖旅行</a>.
		</p>
	</div>
	<a href="" class="btt">顶部</a>
	<script src="${ctx}/js/jquery-1.9.1.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/plugin.js"></script>

</body>
</html>