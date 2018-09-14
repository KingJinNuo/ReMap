<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Basic PasswordBox - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/demo.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
</head>
<body>
	<h2>登录学生管理系统</h2>
	<p></p>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" style="width:400px;padding:50px 60px">
		<form action="${pageContext.request.contextPath}/userLogin" method="post">
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" name="username" prompt="Username" iconWidth="28" style="width:100%;height:34px;padding:10px;">
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-passwordbox" name="password" prompt="Password" iconWidth="28" style="width:100%;height:34px;padding:10px">
		</div>
			<div style="margin-bottom:20px">
				<input  type="submit" prompt="submit" value="点击登录" iconWidth="28" style="width:100%;height:34px;padding:10px;">
			</div>
		</form>
	</div>
</body>
</html>