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
<!--
  form标签快速的开发页面，并更方便的回显
  可以通过modelAndView属性指定绑定的数据属性
  如果没有指定该属性，默认从request域对象中读取command的表单中bean
  如果该属性也不存在，则发生错误
  path---name
  如果c标签的test不支持el表达式，则导入core_rt库
-->
<c:if test="${param.q==1}">
    <form action="${pageContext.request.contextPath}/districtInsert" class="insertDistrict" method="post">
        <input name="disId" type="text" placeholder="地区id"/>
        <input name="disName" type="text" placeholder="地区名称"/>
        <input type="submit" value="提交">
    </form>
</c:if>

<c:if test="${param.q==2}">
<form action="${pageContext.request.contextPath}/organizationInsert" class="insertOrganization" method="post">
    <input name="orgId" type="text" placeholder="学校id"/>
    <input name="orgName" type="text" placeholder="学校名称"/>
    <input name="disId" type="text" placeholder="地区编号"/>
    <input type="submit" value="提交">
</form>
</c:if>


<c:if test="${param.q==3}">
    <form action="${pageContext.request.contextPath}/unitInsert" class="insertUnit" method="post">
        <input name="unitId" type="text" placeholder="班级id"/>
        <input name="unitName" type="text" placeholder="班级名称"/>
        <input name="orgId" type="text" placeholder="学校编号"/>
        <input type="submit" value="提交">
    </form>
</c:if>

<c:if test="${param.q==4}">
    <form action="${pageContext.request.contextPath}/studentInsert" class="insertStudent" method="post">
        <input name="stuId" type="text" placeholder="学生id"/>
        <input name="stuName" type="text" placeholder="学生名称"/>
        <input name="stuSex" type="text" placeholder="学生性别"/>
        <input name="stuAdd" type="text" placeholder="学生住址"/>
        <input name="unitId" type="text" placeholder="班级编号"/>
        <input type="submit" value="提交">
    </form>
</c:if>

</body>
</html>
