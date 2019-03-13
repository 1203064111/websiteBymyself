<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/blog.css">
</head>
<body>
	<!-- 导航栏选择 -->
	<div class="container">
		<div class="row clearfix"">
			<div class="col-md-12 column"
				style="margin-top: 60px; width: 960px; color: #fff;">
				<ul class="breadcrumb" style="color: #019875; height: 40px;'">
					<li><a href="#part1" style="font-size: 18px; color: #019875;"
						class="active">热门景点</a></li>
					<li><a href="#part2" style="font-size: 18px; color: #019875;">自然特色</a>
					</li>
					<li><a href="#part3" style="font-size: 18px; color: #019875;">历史名迹</a>
					</li>
					<li><a href="#part4" style="font-size: 18px; color: #019875;">了解更多</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="row clearfix"">
			<div class="col-md-12 column " style="margin-top: 0px; width: 400px;">

				<form class="navbar-form navbar-left" role="search" action="${ctx}/travel/searchAddress.do" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="name"
							name="name" placeholder="景点名称">
					</div>
					<button type="submit" class="btn btn-default">搜索景点</button>
				</form>


			</div>
		</div>
	</div>
	<!--  -->
	<div class="title" id="part1">热门景点</div>
	<div class="content">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix" style="margin-top: 20px;">
				<c:forEach items="${hAddress}" var="hAddress" varStatus="current">
					<div class="col-md-4 column">
					<a href="${ctx}/travel/detailAddressUI.do?id=${hAddress.id}">
						<img alt="140x140" src="${ctx}${hAddress.url}" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">${hAddress.name }</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">${hAddress.foodsName }</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>${hAddress.information }</dd>
						</dl>
					</div>
					</c:forEach>
					<%-- <div class="col-md-4 column">
						<img alt="140x140" src="${ctx}/images/address/xiamen.jpg" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">西安兵马俑</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							<dd>秦始皇兵马俑，亦简称秦兵马俑或秦俑，位于今陕西省西安市临潼区秦始皇陵以东1.5千米处的兵马俑坑内。</dd>
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">西安特色肉夹馍</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>肉夹馍是古汉语“肉夹于馍”的简称，中国陕西省传统特色食物之一。</dd>
						</dl>
					</div>
					<div class="col-md-4 column">
						<img alt="140x140" src="${ctx}/images/address/hainan.jpg" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">西安兵马俑</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							<dd>秦始皇兵马俑，亦简称秦兵马俑或秦俑，位于今陕西省西安市临潼区秦始皇陵以东1.5千米处的兵马俑坑内。</dd>
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">西安特色肉夹馍</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>肉夹馍是古汉语“肉夹于馍”的简称，中国陕西省传统特色食物之一。</dd>
						</dl>
					</div> --%>
				</div>
			</div>
		</div>

	</div>

	</div>
	<div class="title" id="part2" style="margin-top: 100px;">自然特色</div>
	<div class="content">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix" style="margin-top: 20px;">
					<c:forEach items="${sAddress}" var="sAddress" varStatus="current">
					<div class="col-md-4 column">
					<a href="${ctx}/travel/detailAddressUI.do?id=${sAddress.id}">
						<img alt="140x140" src="${ctx}${sAddress.url}" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">${sAddress.name }</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">${sAddress.foodsName }</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>${sAddress.information }</dd>
						</dl>
					</div>
					</c:forEach>
					<%-- <div class="col-md-4 column">
						<img alt="140x140" src="${ctx}/images/address/lushan.jpg" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">西安兵马俑</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							<dd>秦始皇兵马俑，亦简称秦兵马俑或秦俑，位于今陕西省西安市临潼区秦始皇陵以东1.5千米处的兵马俑坑内。</dd>
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">西安特色肉夹馍</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>肉夹馍是古汉语“肉夹于馍”的简称，中国陕西省传统特色食物之一。</dd>
						</dl>
					</div>
					<div class="col-md-4 column">
						<img alt="140x140" src="${ctx}/images/address/yunnan.jpeg" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">西安兵马俑</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							<dd>秦始皇兵马俑，亦简称秦兵马俑或秦俑，位于今陕西省西安市临潼区秦始皇陵以东1.5千米处的兵马俑坑内。</dd>
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">西安特色肉夹馍</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>肉夹馍是古汉语“肉夹于馍”的简称，中国陕西省传统特色食物之一。</dd>
						</dl>
					</div> --%>
				</div>
			</div>
		</div>
	</div>


	<div class="title" id="part3" style="margin-top: 100px;">历史名迹</div>
	<div class="content">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix" style="margin-top: 20px;">
				<c:forEach items="${gAddress}" var="gAddress" varStatus="current">
					<div class="col-md-4 column">
					<a href="${ctx}/travel/detailAddressUI.do?id=${gAddress.id}">
						<img alt="140x140" src="${ctx}${gAddress.url}" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">${gAddress.name }</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">${gAddress.foodsName }</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>${gAddress.information }</dd>
						</dl>
					</div>
					</c:forEach>
					<%-- <div class="col-md-4 column">
						<img alt="140x140" src="${ctx}/images/address/hunan.jpg" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">西安兵马俑</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							<dd>秦始皇兵马俑，亦简称秦兵马俑或秦俑，位于今陕西省西安市临潼区秦始皇陵以东1.5千米处的兵马俑坑内。</dd>
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">西安特色肉夹馍</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>肉夹馍是古汉语“肉夹于馍”的简称，中国陕西省传统特色食物之一。</dd>
						</dl>
					</div>
					<div class="col-md-4 column">
						<img alt="140x140" src="${ctx}/images/address/wuyuan.jpg" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">西安兵马俑</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							<dd>秦始皇兵马俑，亦简称秦兵马俑或秦俑，位于今陕西省西安市临潼区秦始皇陵以东1.5千米处的兵马俑坑内。</dd>
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">西安特色肉夹馍</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>肉夹馍是古汉语“肉夹于馍”的简称，中国陕西省传统特色食物之一。</dd>
						</dl>
					</div>
					<div class="col-md-4 column">
						<img alt="140x140" src="${ctx}/images/address/chongqing.jpg" class="img-thumbnail" />
						<dl>
							<dt style="margin-top: 10px;">
								<b>景点名称</b>
							</dt>
							<dd>
								<a href="">西安兵马俑</a>
							</dd>
							<dt>
								<b>详细介绍</b>
							</dt>
							<dd>秦始皇兵马俑，亦简称秦兵马俑或秦俑，位于今陕西省西安市临潼区秦始皇陵以东1.5千米处的兵马俑坑内。</dd>
							<dd></dd>
							<dt>
								<b>景点美食</b>
							</dt>
							<dd>
								<a href="">西安特色肉夹馍</a>
							</dd>
							<dt>
								<b>详细描述</b>
							</dt>
							<dd>肉夹馍是古汉语“肉夹于馍”的简称，中国陕西省传统特色食物之一。</dd>
						</dl>
					</div> --%>
				</div>
			</div>
		</div>

	</div>
	<div class="title" id="part4" style="margin-top: 100px;">了解更多</div>
	<div class="content">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="panel-group" id="panel-56907">
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title collapsed" data-toggle="collapse"
									data-parent="#panel-56907" href="#panel-element-174175">国内资讯</a>
							</div>
							<div id="panel-element-174175" class="panel-collapse collapse">
								<div class="panel-body">
									<a>北京</a>&nbsp;&nbsp;&nbsp;<a>上海</a>&nbsp;&nbsp;&nbsp;<a>广州</a>&nbsp;&nbsp;&nbsp;<a>深圳</a>&nbsp;&nbsp;&nbsp;<a>重庆</a>
								</div>
								<div class="panel-body">
									<a>北京</a>&nbsp;&nbsp;&nbsp;<a>上海</a>&nbsp;&nbsp;&nbsp;<a>广州</a>&nbsp;&nbsp;&nbsp;<a>深圳</a>&nbsp;&nbsp;&nbsp;<a>重庆</a>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title" data-toggle="collapse"
									data-parent="#panel-56907" href="#panel-element-189315">国外资讯链接</a>
							</div>
							<div id="panel-element-189315" class="panel-collapse in">
								<div class="panel-body">马尔代夫</div>
								<div class="panel-body">马尔代夫</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="blog-footer" style="margin-top: 200px; height: 40px;">
		<p>
			by <a href="http://www.tuniu.com" target="_blank">舌尖旅行</a>.
		</p>
	</div>
	<a href="" class="btt">顶部</a>

	<!-- Js-->
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugin.js"></script>
</body>
</html>