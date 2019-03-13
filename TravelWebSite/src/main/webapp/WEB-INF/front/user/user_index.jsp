<%@ page language="java"
	import="java.util.*,com.struts.dao.*,com.struts.dao.impl.*,com.struts.domain.*"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>
<%
	FoodsDao fdDao = new FoodDaoImpl();
	ArrayList<Foods> foods = fdDao.getAllFoods();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的网站</title>
<script type="text/javascript">
<%-- function getfood(id){
	window.location.href="../struts2/select.action?id=<%>"
	} --%> </script>
<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/blog.css">
<link rel="stylesheet" href="css/struts.css">
</head>
<body>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column "
				style="margin-top: 40px; width: 400px; margin-left: -30px;">

				<s:form class="navbar-form navbar-left" role="search"
					action="/Search.action" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="keyword"
							name="keyword">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</s:form>
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
					<img src="images/shejianlvxing.jpg" alt="...">
				</div>
				<div class="item">
					<img src="images/jiweixia.jpg" alt="...">
				</div>
				<div class="item">
					<img src="images/hangzhou.jpg" alt="...">
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

		<%
			for (Foods food : foods) {
		%>
		<div class="pic pic1">
		<div class="item">
				<a href="../struts2/select.action?id=<%=food.getFid()%>" onclick="getfood()">
				 <img src="<%=food.getImg()%>" class="img01" />
					<div class="img02"><%=food.getName()%></div>
				</a>
				<a onclick="showwin()" href="#part1">评论</a>
			</div>
			
				<div id="win">
					<s:form class="form" id="form" action="Comment.action"
						method="post">
						<div id="title">
							标题栏<span id="close" onclick="hide()">X</span>
						</div>
						<div id="content">
							<input type="text" name="content" label="评论信息" id="content"
								style="color: #019875;" /> <input type="hidden"
								value="<%=food.getFid()%>" id="fid" name="fid" />
							<s:submit value="提交" align="center" float="right"
								style="margin-top: 200px;
margin-left: 120px;color: #019875;" />
						</div>
					</s:form>
				</div>
			</div>
<%
		}
	%>
	
	<div class="pic-more">
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
	</div>
	</div>
	<div class="title" id="part2">旅行</div>
	<div class="content">
		<div class="pic pic1">
			<div class="item">
				<a href="#"> <img src="images/hangzhou.jpg" class="img01" />
					<div class="img02"></div>
				</a>
				<a onclick="showwin()" href="#part1">评论</a>
			</div>
		</div>
		<div class="pic pic1">
			<div class="item">
				<a href="#"> <img src="images/xian.jpg" class="img01" />
					<div class="img02"></div>
				</a>
			</div>
		</div>
		<div class="pic pic1">
			<div class="item">
				<a href="#"> <img src="images/nanjing.jpg" class="img01" />
					<div class="img02"></div>
				</a>
				
			</div>
		</div>
		<div class="pic-more">
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
		</div>
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
					<div class="row clearfix">
						<div class="pic pic1">
							<div class="item">
								<a href="#"> <img src="images/maodou.jpg" class="img01" />
									<div class="img02"></div>
								</a>
							</div>
						</div>
						<div class="pic pic1">
							<div class="item">
								<a href="#"> <img src="images/sichuan.jpg" class="img01" />
									<div class="img02"></div>
								</a>
							</div>
						</div>
						<div class="pic pic1">
							<div class="item">
								<a href="#"> <img src="images/nanjing.jpg" class="img01" />
									<div class="img03"></div>
								</a>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="tab-pane" id="profile">
				<div class="container">
					<div class="row clearfix">
						<div class="pic pic1">
							<div class="item">
								<a href="#"> <img src="images/nanjing.jpg" class="img01" />
									<div class="img03"></div>
								</a>
							</div>
						</div>
						<div class="pic pic1">
							<div class="item">
								<a href="#"> <img src="images/maodou.jpg" class="img01" />
									<div class="img03"></div>
								</a>
							</div>
						</div>
						<div class="pic pic1">
							<div class="item">
								<a href="#"> <img src="images/beijingkaoya.jpg"
									class="img01" />
									<div class="img02"></div>
								</a>
							</div>
						</div>
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
	<s:debug></s:debug>
	<a href="" class="btt">顶部</a>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugin.js"></script>

</body>
</html>