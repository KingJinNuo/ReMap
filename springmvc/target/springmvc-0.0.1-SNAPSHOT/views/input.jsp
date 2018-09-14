<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'input.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<!--
  	form标签快速的开发页面，并更方便的回显
  	可以通过modelAndView属性指定绑定的数据属性
  	如果没有指定该属性，默认从request域对象中读取command的表单中bean
  	如果该属性也不存在，则发生错误
  	path---name
  	
  	
  	如果c标签的test不支持el表达式，则导入core_rt库
   -->


	<
	<form:errors path="*"> </form:errors>

	<c:if test="${employee.id == null}">
		LastName:<form:input path="lastName" />
		<form:errors path="lastName"></form:errors>
		<br>
	</c:if>
	<c:if test="${employee.id!=null}">
		<form:hidden path="id" />
		<input type="hidden" name="_method" value="PUT" />
	</c:if>
	Email:<form:input path="email" />
	<form:errors path="email"> </form:errors>
	<br>
	<%
		Map<String, String> genders = new HashMap<>();
		genders.put("1", "Male");
		genders.put("0", "Female");
		request.setAttribute("genders", genders);
	%>
	Gender:<form:radiobuttons path="gender" items="${genders}" />
	<br>
	Department:<form:select path="department.id" items="${departments}"
							itemLabel="departmentName" itemValue="id"></form:select>
	Birth:<form:input path="birth" />
	<br>
	<input type="submit" value="submit" />

	<br>
	<br>
	<br>
	<form action="${pageContext.request.contextPath}/fileUpLoad" method="post" enctype="multipart/form-data">
		<input type="file" name="file" /> 
		<input type="submit" value="UpLoad" />
	</form>
	<br>
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/exceptionHandlerResolver?i=10">Test exceptionHandlerResolver</a>
	<br>
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/testSimpleMappingExceptionResolver?i=5">Test SimpleMappingExceptionResolver</a>
	<br>
	This is my JSP page.
	<br>
</body>
</html>
