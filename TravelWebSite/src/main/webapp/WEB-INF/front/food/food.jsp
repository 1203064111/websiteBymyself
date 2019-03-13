<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>舌尖旅行-美食</title>
<!-- css -->
<link rel="stylesheet" href="css/bootstrap.css" >
    <link rel="stylesheet"  href="css/blog.css" >
    
  <script type="text/javascript">
  //登录
  function login(){
	  window.location.href="../login.jsp";
  }
  </script>
</head>
<!-- 导航栏 -->
  <body>
    
<!-- 导航栏选择 -->
<div class="container">
	<div class="row clearfix" >
		<div class="col-md-12 column" style="margin-top:60px;width:960px;color:#fff;">
			<ul class="breadcrumb"style="color:#019875;height:40px;'">
				<li >
					 <a href="#part1" style="font-size:18px;color:#019875;" class="active">热门美食</a>
				</li>
				<li>
					 <a href="#part2" style="font-size:18px;color:#019875;">传统小吃</a>
				</li>
				<li>
				     <a href="#part3" style="font-size:18px;color:#019875;">地方特色</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="row clearfix"">
			<div class="col-md-12 column "
				style="margin-top: 0px; width: 400px;">
	
					<form class="navbar-form navbar-left" role="search" action="${ctx}/foods/searchFoods.do" method="post">
						<div class="form-group">
							<input type="text" class="form-control" id="name"
							name="name" placeholder="美食名称">
						</div> <button type="submit" class="btn btn-default">搜索美食</button>
					</form>
					
			
		</div>
	</div>
</div>
<!--  -->
    <div class="title" id="part1">热门美食</div>
    <div class="content" style="height: 450px;">
    <c:forEach items="${hFood}" var="hfood" varStatus="current">
    
    	<div class="pic pic1"><a href="${ctx}/foods/detailFoodsUI.do?id=${hfood.id}">
    		<img src="${ctx}${hfood.url}" alt="">
    		<p>美食——${hfood.name }</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			 <address> <strong>${hfood.addressName }</strong><br />价格人均  ${hfood.price } 元<br />  </address>
		</div>
	</div>
    	</div>
    	
    	</c:forEach>
    	<%-- <div class="pic pic2">
    		<img src="${ctx}/images/foods/luyu.jpg" alt="">
    		<p>美食——鲈鱼</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			<address> <strong>杭州</strong><br /> 价格人均 100元 <br /> 西湖烧烤点<br /> <abbr title="Phone">电话：</abbr> (123) 456-7890</address>
		</div>
	</div>
    	</div>
    	<div class="pic pic3">
    		<img src="${ctx}/images/foods/roujiamo.jpg" alt="">
    		<p>美食——肉夹馍</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			 <address> <strong>杭州</strong><br /> 价格人均 100元 <br /> 西湖烧烤点<br /> <abbr title="Phone">电话：</abbr> (123) 456-7890</address>
		</div>
	</div>
    	</div> --%>
    	
	</div>
    <div class="title" id="part2"style="margin-top:100px;">特色小吃</div>
    <div class="content" style="height: 450px;">
    <c:forEach items="${xcFood}" var="xcFood" varStatus="current">
    
    	<div class="pic pic1"><a href="${ctx}/foods/detailFoodsUI.do?id=${xcFood.id}">
    		<img src="${ctx}${xcFood.url}" alt="">
    		<p>美食——${xcFood.name }</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			 <address> <strong>${xcFood.addressName }</strong><br />价格人均  ${xcFood.price } 元<br />  </address>
		</div>
	</div>
    	</div>
    	
    	</c:forEach>
    
    <%-- <div class="pic pic1">
    		<img src="${ctx}/images/foods/roujiamo.jpg" alt="">
    		<p>美食——肉夹馍</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			 <address> <strong>杭州</strong><br /> 价格人均 100元 <br /> 西湖烧烤点<br /> <abbr title="Phone">电话：</abbr> (123) 456-7890</address>
		</div>
	</div>
    	</div>
    	<div class="pic pic2">
    		<img src="${ctx}/images/foods/xiaolongbao.jpg" alt="">
    		<p>美食——小笼包</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			 <address> <strong>杭州</strong><br /> 价格人均 100元 <br /> 西湖烧烤点<br /> <abbr title="Phone">电话：</abbr> (123) 456-7890</address>
		</div>
	</div>
    	</div>
    	<div class="pic pic3">
    		<img src="${ctx}/images/foods/waguantang.jpg" alt="">
    		<p>美食——瓦罐汤</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			<address> <strong>杭州</strong><br /> 价格人均 100元 <br /> 西湖烧烤点<br /> <abbr title="Phone">电话：</abbr> (123) 456-7890</address>
		</div>
	</div>
    	</div> --%>
    	
   </div>
	<div class="title" id="part3" style="margin-top:100px;">地方特色</div>
    <div class="content" style="height: 450px;">
    <c:forEach items="${spFood}" var="spFood" varStatus="current">
    
    	<div class="pic pic1"><a href="${ctx}/foods/detailFoodsUI.do?id=${spFood.id}">
    		<img src="${ctx}${spFood.url}" alt="">
    		<p>美食——${spFood.name }</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			 <address> <strong>${spFood.addressName }</strong><br />价格人均  ${spFood.price } 元<br />  </address>
		</div>
	</div>
    	</div>
    	
    	</c:forEach>
    <%-- <div class="pic pic1">
    		<img src="${ctx}/images/foods/luosifen.png" alt="">
    		<p>美食——螺蛳粉</p>
    		
	<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			 <address> <strong>杭州</strong><br /> 价格人均 100元 <br /> 西湖烧烤点<br /> <abbr title="Phone">电话：</abbr> (123) 456-7890</address>
		</div>
	</div>
</div>
    	<div class="pic pic2">
    		<img src="${ctx}/images/foods/reganmian.jpg" alt="">
    		<p>美食——热干面</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			 <address> <strong>杭州</strong><br /> 价格人均 100元 <br /> 西湖烧烤点<br /> <abbr title="Phone">电话：</abbr> (123) 456-7890</address>
		</div>
	</div>
    	</div>
    	<div class="pic pic3">
    		<img src="${ctx}/images/foods/shanxiliangpi.jpg" alt="">
    		<p>景点——陕西凉皮</p>
    		<div class="row clearfix">
		<div class="col-md-12 column" style="margin-top:30px;height:100px;color:#019875;">
			<address> <strong>杭州</strong><br /> 价格人均 100元 <br /> 西湖烧烤点<br /> <abbr title="Phone">电话：</abbr> (123) 456-7890</address>
		</div>
	</div>
    	</div> --%>
    	
   </div>
    
    <div class="blog-footer"style="margin-top:200px;height:40px;">
      <p>by <a href="http://www.tuniu.com" target="_blank">舌尖旅行</a>.</p>
    </div>
    <a href="" class="btt">顶部</a>
    
    <!-- Js-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugin.js"></script>
  </body>
</html>