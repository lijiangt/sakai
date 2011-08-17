<%@page language="java" contentType="text/html;charset=UTF-8"%><%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1    
response.setHeader("Pragma","no-cache"); //HTTP 1.0    
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server   
String s = request.getParameter("help");
if(s==null||"".equals(s)){
	response.sendRedirect("../index.html");
}else if(new java.io.File(getServletContext().getRealPath("/"+s+".html")).exists()){
	response.sendRedirect("../"+s+".html");
}else{
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>暂无此主题相关的帮助</title>
</head>
<body>
对不起，目前暂无此主题相关的帮助!
</body>
</html>
<%
//	response.sendRedirect("unavailable.html");
}
%>
