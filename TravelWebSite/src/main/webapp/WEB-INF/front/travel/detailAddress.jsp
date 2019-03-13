<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function(){
	if("${loginSession}" !=null){
		// 判断是否收藏
		$.ajax({
			url : '${ctx}/travel/isfavoriteAddress.do', 
			type : 'POST',
			data : {
				addressId:$("#addressId").val(),
				userId:$("#userId").val()
			},
			success : function(data) {
				if(data == 'collectioned'){
					$(".collection_y").show();
					$(".collection_n").hide();
				}else{
					$(".collection_n").show();
					$(".collection_y").hide();
				}
			}
		});
	}
});
function submit(){
	var content = $("#content").val();
	if(content == ""){
		 alert("评论不能为空!");
		return;
	}
	
	var addressId = $("#addressId").val();
	if(addressId == ""){
		 alert("景点ID不能为空!");
		return;
	}
	
	/* var validateCode = $("#validateCode").val();
	if(validateCode == ""){
	 	alert("验证码不能为空!"); 
		return;
	} */
	
	$("#form").submit();
}
function addToFavorite(aObj,addressId){
	var userId=$("#userId").val();
	var iObj = $(aObj).children("i"),
	flag = $(".collection_y").is(':hidden'); 
	if(flag){
		// 添加收藏
		$.ajax({
			url : '${ctx}/travel/addfavoriteAddress.do',
			type : 'POST',
			data : {
				userId:userId,
				addressId:addressId
			},
			success : function(data) {
				if(data == "success_collection"){
					$(".collection_y").show(); 
					$(".collection_n").hide();
					alert("收藏成功");  // 收藏成功
				}
			}
		});
	}else{
		// 删除收藏
		$.ajax({
			url : '${ctx}/travel/delfavoriteAddress.do', 
			type : 'POST',
			data : {
				userId:userId,
				addressId:addressId
			},
			success : function(data) {
				if(data == "delete_success"){
					$(".collection_n").show();
					$(".collection_y").hide();
					alert("取消收藏成功");  // 收藏成功 
				}
			}
		});
	}
}
function to_comment(){
	var addressId = $("#addressId").val();
	var content = $("#toContent").val();
	var userId = $("#userId").val();
	if(confirm("确认提交评论吗?")){
		$.post(
			"${ctx}/travel/toCommentAddress.do",
			{"userId":userId,"addressId":addressId,"content":content},
			function(data){
				if (data == "success") {
					alert("评论成功！");
					window.location.reload();
				} else {
					alert("评论失败！"); 
					window.location.reload();
				}
			},
			"json"
		);
	}
}
function gotoPage(action, nowPage) {
	  $("#doAction").val(action);
	  $("#nowPage").val(nowPage);
/* 	  $("#queryContractListForm").attr("action", "${ctx}/project/contract/contractList.do"); */
	  $("#queryCommentsListForm").submit();
	}
</script>
<style type="text/css">
form{
    /* background: #F8F8FF ; */
    /* border:#357FC4 solid 1px; */
    /* color:#575454;   */
    width:400px;
    margin:20px auto;
    font-size:15px;
}
td:first-child{
    text-align:right;
    padding:0 5px;
}
</style>
<title></title>
</head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/blog.css">
<link rel="stylesheet" href="css/struts.css">
<body>
	<div class="container">
		<div class="row clearfix">
			<ul class="hd-nav fl">
				<li><a href="#part1">景点详细</a>
				<li><a href="#part2">景点订购</a></li>
				<li><a href="#part3">每日推荐</a></li>
			</ul>
			<div class="col-md-12 column "
				style="margin-top: 40px; width: 400px; margin-left: -30px;">

				<form id="queryCommentsListForm" class="navbar-form navbar-left" role="search"
					action="${ctx}/travel/detailAddressUI.do" method="post">
					<div class="form-group">
					<input type="hidden" name="totalPages" id="totalPages"
										value="${page.totalPages }" /> <input type="hidden"
										name="pageSize" id="pageSize" value="${page.pageSize }" /> <input
										type="hidden" name="doAction" id="doAction" /> <input
										type="hidden" name="nowPage" id="nowPage" /><input
									 type="hidden" id="id" name="id" value="${address.id }">
					
						<input type="text" class="form-control" id="content"
							name="content" style="margin-bottom:10px;">
						
					</div>
					<button type="submit" class="btn btn-default">搜索评论</button>
				</form>
			</div>
		</div>

	</div>
	<div class="title" id="part1">景点详细</div>
	<div class="content">
	   
           <%-- <div class="pic pic1">
			<div class="item">
				<a href="#"> <img src="${ctx }${food.url} " class="img01" />
					<div class="img02">${food.name} </div>
				</a>
			</div>
		</div> --%>
		<div class="main clearfix"></div>
		<div class="persional_property">
			<div class="person_info_con">
				<i class="icon-edit icon-large person-info-edit"></i><a
					name="M_base"></a>
				<dl class="person-photo" style="display: inline-block; float: left;">
					<dt>
						<a href=""><img src="${ctx}${address.url}" class="header" style="width:300px;height:300px"><span
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
					<%-- <dt class="person-nick-name">
						<span>${user.name }</span><span><a
							onclick="updateUserUI(${user.id});"><span style="color: #e4e023;">☚☚☚</span> </a></span>
					</dt> --%>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info_null">名称：</span><span style="color: #eb7350;">
							<b>${address.name }</b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info_null">编号：</span><span style="color: #eb7350;">
							<b>${address.code } </b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info_null">热度：</span><span style="color: #eb7350;">
							<b>${address.commentTimes }</b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info_null">美食：</span><span style="color: #eb7350;">
							<b>${address.foodsName }</b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info_null">门票价格：</span><span style="color: #eb7350;">
							<b>${address.price }</b>
						</span>
					</dd>
					
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info-null">简介：</span><span style="color: #eb7350;">
							<b>${address.information }</b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info-null"></span><span style="color: #eb7350;">
							<b></b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info-null"><a href="javascript:void(0);" class="" onclick="addToFavorite(this,'${address.id }')"  id="J_favorite">
						<i class="collection_n " id="collection_n" data-opt='N'>加入收藏&nbsp;○</i>
						<i class="collection_y" id="collection_y" data-opt='Y' >取消收藏&nbsp;●</i></span><span style="color: #eb7350;">
							</a><b></b>
						</span>
					</dd>
					<dd class="person-detail" style="margin-top: 5px">
						<span class="info-null">添加评论：</span><span style="color: #eb7350;">
							<form class="form" id="form" action="${ctx}/travel/toCommentAddress.do" method="post">
				<table>
                       <tr><td colspan="1"><input type="text" name="content" id="toContent"  style= " margin-left: -170px; width: 400px; height: 50px;"/></td></tr>
                       <input type="hidden" name="addressId" id="addressId" value="${address.id }"/>
                       <input type="hidden" name="userId" id="userId"  value="${loginSession.id }"/>
                       <tr><td colspan="1"><input type="button"  value="提交评论"  onclick="javascript:to_comment()"style="margin-top: 30px; margin-right: 150px;color:#019875;"/></td></tr>
					</table>
				
				</form>
						</span>
					</dd>
					
				</dl>
			</div>
		</div>
            
		
		
		</div>
	<div class="title" id="part2">景点评价</div>
	<div class="content" style="min-height:250px;">
		<div>
		  <c:forEach items="${page.items }" var="f"
									varStatus="current">
				<ul style="margin-top:30px;"><div style="float:left;"><a><img src="${ctx}${f.user.photo }" class="header" style="width:40px;height:40px"></a></div>
				<div style="float:left;margin-top:2px;margin-left:10px;" ><a style="color:#019875;">${f.user.name } : </a></div>
				<div style="float:left;margin-top:2px;margin-left:10px;" ><a>${f.content }</a></div>
				<div style="float:right;margin-top:10px;">
				<a>${f.createDate }</a></div></ul>
        		
		</c:forEach>
		</div>
		
		</div>
	<div align="center">
		 <ul class="pagination" id="pageDiv1">
				<li><a href="#">共${page.totalCount }条</a></li>
				<li><a href="#" onclick="gotoPage('first','')" title="首页">
							<< </a></li>
				<li><a href="#" onclick="gotoPage('pre','${page.currPageNo }')" title="上一页">
						<</a></li>
						<script type="text/javascript">
	
	/*  $(document).ready(function(){
			$("th").each(function(){
				if($(this).text()=='操作'){
					var count = $(this).parent().parent().parent().children().last().children().find('td').eq(0).find('button').length;
					var width = count*27;
					$(this).find("div").css("width",width+"px");	
				}
			});
		}); */
	 
		var nowPage = ${page.currPageNo};
		var pageTotal = ${page.totalPages};
		if (pageTotal > 5) {
			var indexOf = 0;
			if (nowPage > 2) {
				if ((pageTotal - nowPage) >= 2) {
					indexOf = nowPage - 2;
				} else {
					if((pageTotal-nowPage)<2)
					{
						indexOf = nowPage - 2 - (2-(pageTotal - nowPage));
					}else
					{
						indexOf = nowPage - 2 - (pageTotal - nowPage);
					}
					
				}
			} else {
				indexOf = 1;
			}
			for ( var i = indexOf; i < (5 + indexOf); i++) {
				var wrtStr = "<li";
				if (i == nowPage) {
					wrtStr += "  class=\"active\"";
				}
				wrtStr += "><a href=\"#\" onclick=\"gotoPage('next','" + (i - 1)
						+ "')\">" + i + "</a></li>";
				document.write(wrtStr);
			}
		} else {
			for ( var i = 1; i <= pageTotal; i++) {
				var wrtStr = "<li";
				if (i == nowPage) {
					wrtStr += "  class=\"active\"";
				}
				wrtStr += "><a href=\"#\" onclick=\"gotoPage('next','" + (i - 1)
						+ "')\">" + i + "</a></li>";
				document.write(wrtStr);
			}
		}
	/* function changePageSize() {
	      $("#doAction").val("");
	      $("#nowPage").val("");
	      $("#totalPages").val("");
	      $("#pageSize").val($("#pageSize1").val());
	      if(afterClose)
	      {
	    	  afterClose();
	      }
	      //$("#myform").submit();
	} */
	
</script>
				
				<li><a href="#" onclick="gotoPage('next','${page.currPageNo }')" title="下一页">
						></a></li>
				<li><a href="#" onclick="gotoPage('last','')" title="尾页">
						>> </a></li>
				<li><a href="#">共${page.totalPages }页</a></li>
		</ul> 
		</div>
		<!-- <div class="title" id="part3">每日推荐</div>
	<div class="content">
		<div class="pic pic1">
			<div class="item">
				<a href="#"> <img src="" class="img01" />
					<div class="img02">景点</div>
				</a>
			</div>
		</div>
		</div> -->
			<a href="" class="btt">顶部</a>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugin.js"></script>
		
</body>
</html>