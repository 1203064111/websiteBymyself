<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/taglibs.jsp"%>
<%@include file="/WEB-INF/commons/header.jsp"%>
<% 
    String path = request.getContextPath(); 
    String basePath = request.getScheme() + "://" 
            + request.getServerName() + ":" + request.getServerPort() 
            + path + "/"; 
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>美食分页</title>
</head>
<body>
<center> 
        共<s:property value="intRowCount"/>记录&nbsp;&nbsp; 
        第<s:property value="pageNow"/>页&nbsp;&nbsp; 
         <s:url id="url_pre" value="list.action">   
         <s:param name="pageNow" value="pageNow-1"></s:param>   
     </s:url>   
  
     <s:url id="url_next" value="list.action">   
         <s:param name="pageNow" value="pageNow+1"></s:param>   
     </s:url>   
     <s:iterator value="Foods" status="status">   
        <s:url id="url" value="list.action">   
            <s:param name="pageNow" value="pageNow"/>   
        </s:url>   
     </s:iterator>    
     <s:if test="pageNow==1"> 
    <s:a href="%{url_pre}">最前一页</s:a> 
     </s:if> 
     <s:else> 
     <s:a href="%{url_pre}">上一页</s:a> 
     </s:else> 
     <s:if test="pageNow==k"> 
     <s:a href="%{url_next}">最后一页</s:a> 
       </s:if> 
       <s:else> 
       <s:a href="%{url_next}">下一页</s:a> 
       </s:else> 
       </center> 
</body>
</html>