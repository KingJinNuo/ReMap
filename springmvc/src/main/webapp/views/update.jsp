<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="styles.css">

</head>

<body>

<c:if test="${param.q==1}">
<form action="${pageContext.request.contextPath}/districtUpdate" class="updateDistrict" method="post">
    <input name="disId" type="text" value=${param.id}>
    <input name="disName" type="text"  value=${param.name}>
    <input type="hidden" name="_method" value="PUT"/>
    <input type="submit" value="提交">
</form>
</c:if>

<c:if test="${param.q==2}">
    <form action="${pageContext.request.contextPath}/organizationUpdate" class="updateOrg" method="post">
        <input name="orgId" type="text" value=${param.id}>
        <input name="orgName" type="text"  value=${param.name}>
        <input name="disId" type="text" value=${param.fid}>
        <input type="hidden" name="_method" value="PUT"/>
        <input type="submit" value="提交">
    </form>
</c:if>

<c:if test="${param.q==3}">
    <form action="${pageContext.request.contextPath}/unitUpdate" class="updateUnit" method="post">
        <input name="unitId" type="text" value=${param.id}>
        <input name="unitName" type="text"  value=${param.name}>
        <input name="orgId" type="text" value=${param.fid}>
        <input type="hidden" name="_method" value="PUT"/>
        <input type="submit" value="提交">
    </form>
</c:if>

<c:if test="${param.q==4}">
    <form action="${pageContext.request.contextPath}/studentUpdate" class="updateStudent" method="post">
        <input name="stuId" type="text" value=${param.id}>
        <input name="stuName" type="text"  value=${param.name}>
        <input name="stuSex" type="text" value="${param.sex}">
        <input name="stuAdd" type="text" value="${param.add}">
        <input name="unitId" type="text" value="${param.fid}">
        <input type="hidden" name="_method" value="PUT"/>
        <input type="submit" value="提交">
    </form>
</c:if>


</body>
</html>
