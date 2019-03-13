<%@ page language="java" import="com.project.domain.entity.*"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<% 
		User loginSession = null;
		if(session.getAttribute("loginSession")==null||session.getAttribute("loginSession")==""){
			loginSession =null;
		}else{
			loginSession =(User)session.getAttribute("loginSession");
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx }/css/bootstrap.css">
<link rel="stylesheet" href="${ctx }/css/blog.css">
</head>
<body>
	<div class="blog-masthead">
		<div class="container">
			<nav class="blog-nav"> <a class="blog-nav-item"
				href="${ctx}/front/indexUI.do">首页</a> 
				<a class="blog-nav-item" href="${ctx}/foods/foodsUI.do">美食</a>
			    <a class="blog-nav-item" href="${ctx}/travel/travelUI.do">旅行</a> 
				 <c:if test="${loginSession ==null }" > <a
				class="blog-nav-item pull-right" href="${ctx}/front/user/loginUI.do">登录</a> <a
				class="blog-nav-item pull-right" href="${ctx}/front/user/registerUI.do">注册</a> </c:if>
				<c:if test="${loginSession !=null}"><a
				class="blog-nav-item" href="${ctx}/mine/mineUI.do">个人主页</a><a
				class="blog-nav-item pull-right" href="${ctx}/front/user/loginOut.do">安全退出</a> <a
				class="blog-nav-item pull-right" href="${ctx}/front/mine.do">${loginSession.name }</a> <a
				class="blog-nav-item pull-right">您好，欢迎来到舌尖旅行</a></c:if>
				
		</div>
	</div>
	<script src="${ctx }/js/jquery-1.9.1.min.js"></script>
	<script src="${ctx }/js/bootstrap.min.js"></script>
	<script src="${ctx }/js/plugin.js"></script>

</body>
</html>