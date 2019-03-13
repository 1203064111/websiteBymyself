<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/blog.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body style="margin-top: -20px;">

	<div class="content">

		<div class="title" id="part1" style="margin-top: 50px;">请填写个人资料</div>
		<div class="content">

			<div class="content-message">

				<form class="form" action="${ctx}/mine/toUpdateUser.do" method="post"  enctype="multipart/form-data">
					<input type="hidden" name="id"
						value="${user.id }"/>
					<input type="hidden" name="password"
						value="${user.password }"/>
					<p>
						<lable for="nicheng">头像：</lable>
						<img src="${ctx}${user.photo}" style="width:100px;height:100px"/>
					    <input type="file" id="file" name="file" accept="image/jpg,image/jpeg,image/png" style="padding-left: 80px;" />
						
					</p>
					<p>
						<lable for="nicheng">昵称：</lable>
						<input type="text" id="name" name="name"
							value="${user.name }" />
					</p>
					<p>
						<lable for="age">年龄：</lable>
						<input type="text" id="age" name="age"
							value="${user.age }" />
					</p>
					<p>
						<lable for="phone">手机：</lable>
						<input type="text" id="phone" name="phone"
							value="${user.phone }" />
					</p>
					<p>
						<lable for="phone">email：</lable>
						<input type="text" id="email" name="email"
							value="${user.email }" />
					</p>
					<p>
						<lable for="birthday">生日：</lable>
						<input type="text" id="birthday" name="birthday"
							value="${user.birthday }" />
					</p>
					<p>
						<lable for="diqu">地区：</lable>
						<input type="text" id="area" name="area"
							value="${user.area }" />
					</p>
					<p>
						<lable for="diqu">简介：</lable>
						<input type="text" id="info" name="info"
							value="${user.info }" />
					</p>
					<p class="submit">
						<input type="submit" id="submit" value="确认修改"
							style="margin-top: 20px;" />
					</p>


				</form>
			</div>


		</div>
	</div>
	<!-- Js-->
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugin.js"></script>
</body>
</html>