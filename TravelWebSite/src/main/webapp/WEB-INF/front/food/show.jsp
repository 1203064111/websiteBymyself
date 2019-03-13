<%@ page language="java" import="com.struts.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>
<% %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>美食分页显示</title>
</head>
<body>
	<div align="center">
		<div class="box" style="width: 800px; height: 500px">
		<c:forEach items="<%= %>" var="msg">
				<div class="msg"
					style="border: 1px solid pink; height: auto; width: 798px;">
					<table>
						<tbody>
							<tr>
								<td>标题：</td>
								<td>${ msg.name }</td>
							</tr>
							<tr>
								<td>内容：</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td align="left"
									style="width: 700px; height: 30px; font-style: normal;"><textarea
										style="width: 700px; height: 100px;" istyle="none"
										readonly="readonly">${ msg.intro }</textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:forEach>
		</div>
		<s:url var="url_pre" value="Show.action">
			<s:param name="pageNow" value="pageNow-1"></s:param>
		</s:url>
		<s:url var="url_next" value="Show.action">
			<s:param name="pageNow" value="pageNow+1"></s:param>
		</s:url>
		<s:a href="%{url_pre}">上一页</s:a>
		<s:iterator value="foods" status="strtus">
			<s:url var="url" value="Show.action">
				<s:param name="pageNow" value="pageNow" />
			</s:url>
		</s:iterator>
		<s:a href="%{url_next}">下一页</s:a>
	</div>
</body>
</html>