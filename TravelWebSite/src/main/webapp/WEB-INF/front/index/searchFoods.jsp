<%@ page language="java"  import="java.util.*"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function gotoPage(action, nowPage) {
	  $("#doAction").val(action);
	  $("#nowPage").val(nowPage);
/* 	  $("#queryContractListForm").attr("action", "${ctx}/project/contract/contractList.do"); */
	  $("#queryFoodListForm").submit();
	}
</script> 

<link rel="stylesheet" href="css/bootstrap.css" >
    <link rel="stylesheet"  href="css/blog.css" >
</head>
<body>
	<div class="container">
		<div class="row clearfix" >
			<div class="col-md-12 column "
				style="margin-top: 40px; width: 400px; margin-left: -30px;">

				<form id="queryFoodListForm" class="navbar-form navbar-left" role="search" action="${ctx}/front/index/searchFoods.do" method="post">
					<div class="form-group">
					<input type="hidden" name="totalPages" id="totalPages"
										value="${page.totalPages }" /> <input type="hidden"
										name="pageSize" id="pageSize" value="${page.pageSize }" /> <input
										type="hidden" name="doAction" id="doAction" /> <input
										type="hidden" name="nowPage" id="nowPage" />
						<input type="text" class="form-control" id="name" name="name"/>
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</div>
		</div>
	</div>
<div class="container">
		<div class="content">
		<c:forEach items="${page.items }" var="f"
									varStatus="current">
        		<div class="pic pic1">
					<div class="item">
						<a href="${ctx}/foods/detailFoodsUI.do?id=${f.id}"> <img src="${ctx }${f.url}" class="img01" />
							<div class="img02" style="color:#019875;">${f.name }</div>
						</a>
					</div>
						<div class="item a" style="color:#428bca;">${f.infomation }</div>
				</div>
									
								</c:forEach>
		<%-- <s:iterator  var="sf" value="foods">
		<div class="pic pic1">
			<div class="item">
				<a href="#"> <img src="<s:property value="#sf.img"/>" class="img01" />
					<div class="img02"><s:property value="#sf.name"/></div>
				</a>
			</div>
			<div class="item a"><s:property value="#sf.comments"/></div>
		</div>
		</s:iterator> --%>
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
		<!-- <s:url var="url_pre" value="Search.action">
			<s:param name="pageNow" value="pageNow-1"></s:param>
			<s:param name="keyword" value="keyword"/>
			
		</s:url>
		<s:url var="url_next" value="Search.action">
			<s:param name="pageNow" value="pageNow+1"></s:param>
			<s:param name="keyword" value="keyword"/>
		</s:url>
		<s:url var="url" value="Search.action">
				<s:param name="pageNow" value="pageNow" />
				<s:param name="keyword" value="keyword"/>
		</s:url>
		<s:a href="%{url_pre}">上一页</s:a>
		<s:a href="%{url}">本页</s:a>
		<s:a href="%{url_next}">下一页</s:a>
		<s:if test="hasFiledErrors()">
		<s:iterator value="fileldErrors">
		<s:iterator value="value">
		<script type="text/javascript">alert('<s:property/>');</script>
		</s:iterator>
		</s:iterator>
		</s:if> -->
		</div>
	</div>
</div>
<div class="blog-footer"style="margin-top:200px;height:40px;">
      <p>by <a href="http://www.tuniu.com" target="_blank">舌尖旅行</a>.</p>
    </div>
    <a href="" class="btt">顶部</a>
<script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugin.js"></script>
</body>
</html>