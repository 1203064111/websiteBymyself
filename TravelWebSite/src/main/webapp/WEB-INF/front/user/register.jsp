<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function(){
	if("${message}"=="false"){
		alert("注册失败"); 
	} 
});
	/* function refresh() {
		//IE存在缓存,需要new Date()实现更换路径的作用    
		document.getElementById("image").src = "createImageAction.action?+ Math.random()"
				+ new Date();
	} */
	function submit(){
		var loginName = $("#loginName").val();
		if(loginName == ""){
			 alert("用户名不能为空!");
			return;
		}
		
		var password = $("#password").val();
		var confirm_password = $("#confirm_password").val();
		if(password == ""){
			 alert("用户密码不能为空!");
			return;
		}
		if(password != confirm_password){
			 alert("用户密码不一致!"); 
			return;
		}
		
		var sex =$("#sex").val();
		if(sex==""){
			alert("性别不能为空!");
			return ;
		}
		var phone =$("#phone").val();
		if(phone==""){
			alert("手机不能为空!");
			return;
		}
		var email =$("#email").val();
		if(email==""){
			alert("邮箱不能为空!"); 
			return;
		}
		
		/* var validateCode = $("#validateCode").val();
		if(validateCode == ""){
		 	alert("验证码不能为空!"); 
			return;
		} */
		
		$("#form").submit(); 
	}
</script>
<title>注册页面</title>
<style>
div{
    /* background:#009FCC; */
    /* font-size:24px; */
    /* padding:5px; */
    color:white;
}
form{
    /* background: #F8F8FF ; */
    /* border:#357FC4 solid 1px; */
    /* color:#575454;   */
    width:400px;
    margin:20px auto;
    font-size:15px;
}
table{
    margin:10px auto;
}
a{
    text-decoration:none;
}
input[type="button"]{
    background:#228B22;
    color:white;
    font-size:15px;
    font-weight:bold;
    width:120px;
    height:40px;
}
td:first-child{
    text-align:right;
    padding:0 5px;
}
td:only-child{
    text-align:center;
    font-size:12px;
}
span:before{
    /* content:"* "; */
    /* color:red; */
}
input[type="text"]:read-only{
    border:#888484 solid 2px;
    background:#888484;
    font-weight:bold;   
}
input[type="text"]:hover{
    background:#EFD9AC;
}
</style>
<link rel="stylesheet" href="${ctx }/css/bootstrap.css">
<link rel="stylesheet" href="${ctx }/css/blog.css">
<link rel="stylesheet" href="${ctx }/css/struts.css">
</head>
<body >
	<div class="blog-masthead" style="margin-top: -40px;">
		<div class="container">
			<nav class="blog-nav"> 
				<a class="blog-nav-item "
			>已有账号</a><a class="blog-nav-item "
				href="${ctx}/front/user/loginUI.do">登录</a> <a class="blog-nav-item pull-right"
				href="${ctx}/front/indexUI.do">首页</a> </nav>
		</div>
	</div>

	<div class="content" style="margin-top: 40px;">

		<div class="title" id="part1">请填写注册信息</div>
		<div class="content">
			<div class="content-message clearfix">
				<%-- <form class="form" id="form" action="${ctx}/front/user/toRegister.do" method="post">
					
					<label >用户名：<input type="text" id="loginName" name="loginName" /></label>
					<label >密码：&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="password" name="password" /></label>
					<label >性别：&nbsp;&nbsp;&nbsp;&nbsp;<select name="sex" id="sex" style="width:40px;"><option value="1">男</option><option value="2">女</option></select></label>
					<label >手机号：<input type="text" id="phone" name="phone" /></label>
					<label style="text-align:center;"><input type="button"  value="注册" onclick="submit()" ></label></div>
				</form> --%>
				<form  class="form" id="form" action="${ctx}/front/user/toRegister.do" method="post">
				
					<table>
                       <tr><td><span>用户名</span></td><td><input type="text" name="loginName" id="loginName" /></td></tr>
                       <tr><td><span>密码</span></td><td><input type="password" name="password"  id="password"/></td></tr>
                       <tr><td><span>确认密码</span></td><td><input type="password" name="confirm_password" id="confirm_password" /></td></tr>   
                       <tr><td>性别</td><td><input type="radio" id="sex" value="1" name="sex" checked />男<input type="radio" id="sex"  value="2" name="sex" />女</td></tr>
                       <tr><td>手机号码</td><td><input type="text" name="phone" id="phone" /></td></tr>
                       <tr><td><span>email</span></td><td><input type="text" name="email" id="email" /></td></tr>
                       <tr><td colspan="2"><input type="checkbox" checked/>我已看过并接受<a href="#">《用户协议》</a></td></tr>
                       <tr><td colspan="2"><input type="button"  value="立即注册"  onclick="submit()"/></td></tr>
					</table>
				</form>

			</div>
		</div>
	</div>
</body>
<!-- Js-->
	<script src="${ctx }/js/jquery-1.9.1.min.js"></script>
	<script src="${ctx }/js/bootstrap.min.js"></script>
	<script src="${ctx }/js/plugin.js"></script>
</body>

</html>