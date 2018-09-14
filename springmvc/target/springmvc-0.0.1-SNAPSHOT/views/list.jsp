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
    <title>Basic DataGrid - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>


    <script type="text/javascript">
        $(function () {
            $(".delete").click(function () {
                var href = $(this).attr("href");
                $("form").attr("action", href).submit();
                return false;
            });
        })
    </script>
</head>
<body>
<h2>学生 DataGrid</h2>&nbsp;
<c:if test="${! empty sessionScope.currentuser}">
    <big>欢迎登录~,${sessionScope.currentuser}</big>
    <a href="${pageContext.request.contextPath}/loginOut">登出</a>
</c:if>
<c:if test="${empty sessionScope.currentuser}">
    <big><a href="${pageContext.request.contextPath}/views/login.jsp">请先登录</a></big>
</c:if>
<div style="margin:20px 0;"></div>

<form action="" method="post">
    <!-- 将post请求转换成delete请求的过滤器 HiddenHttpMethodFilter 中接收的参数名  _method -->
    <input type="hidden" name="_method" value="DELETE"/>
</form>


<a href="${pageContext.request.contextPath}/district">查询地区</a>
<table class="easyui-datagrid" title="地区表[District]" style="width:700px;height:250px"
         data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:100">ID</th>
        <th data-options="field:'disNaame',width:250">DistrictName</th>
        <th data-options="field:'listprice',width:100">Edit</th>
        <th data-options="field:'unitcost',width:100">Delete</th>
        <th data-options="field:'attr1',width:150">Insert</th>
    </tr>
    </thead>
    <c:forEach items="${sessionScope.district}" var="dis">
        <tr>
            <td>${dis.disId}</td>
            <td>${dis.disName}</td>
            <td>
                <a href="${pageContext.request.contextPath}/views/update.jsp?id=${dis.disId}&name=${dis.disName}&q=1">Edit</a>
            </td>
            <td><a class="delete" href="district/${dis.disId}">Delete</a></td>
            <td><a class="Insert" href="${pageContext.request.contextPath}/views/insert.jsp?q=1">Insert</a></td>
        </tr>
    </c:forEach>
</table>
<br><br>
<a href="${pageContext.request.contextPath}/organization">查询学校</a>
<table class="easyui-datagrid" title="学校表[Organization]" style="width:700px;height:250px"
       data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:100">ID</th>
        <th data-options="field:'Name',width:250">OrgName</th>
        <th data-options="field:'Edit',width:100">Edit</th>
        <th data-options="field:'Delete',width:100">Delete</th>
        <th data-options="field:'Insert ',width:150">Insert</th>
    </tr>
    </thead>
    <c:forEach items="${sessionScope.organization}" var="org">
        <tr>
            <td>${org.orgId}</td>
            <td>${org.orgName}</td>
            <td>
                <a href="${pageContext.request.contextPath}/views/update.jsp?id=${org.orgId}&name=${org.orgName}&fid=${org.disId}&q=2">Edit</a>
            </td>
            <td><a class="delete" href="organization/${org.orgId}">Delete</a></td>
            <td><a class="Insert" href="${pageContext.request.contextPath}/views/insert.jsp?q=2">Insert</a></td>
        </tr>
    </c:forEach>
</table>
<br><br>
<a href="${pageContext.request.contextPath}/unit">查询班级</a>
<table class="easyui-datagrid" title="班级表[Unit]" style="width:700px;height:250px"
       data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:100">ID</th>
        <th data-options="field:'Name',width:250">UnitName</th>
        <th data-options="field:'Edit',width:100">Edit</th>
        <th data-options="field:'Delete',width:100">Delete</th>
        <th data-options="field:'Insert ',width:150">Insert</th>
    </tr>
    </thead>
    <c:forEach items="${sessionScope.unit}" var="u">
        <tr>
            <td>${u.unitId}</td>
            <td>${u.unitName}</td>
            <td>
                <a href="${pageContext.request.contextPath}/views/update.jsp?id=${u.unitId}&name=${u.unitName}&fid=${u.orgId}&q=3">Edit</a>
            </td>
            <td><a class="delete" href="${pageContext.request.contextPath}/unit/${u.unitId}">Delete</a></td>
            <td><a class="Insert" href="${pageContext.request.contextPath}/views/insert.jsp?q=3">Insert</a></td>
        </tr>
    </c:forEach>
</table>
<br><br>
<a href="${pageContext.request.contextPath}/student">查询学生</a>
<table class="easyui-datagrid" title="学生表[Student]" style="width:700px;height:250px"
       data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:100">ID</th>
        <th data-options="field:'Name',width:100">OrgName</th>
        <th data-options="field:'id',width:100">Sex</th>
        <th data-options="field:'Name',width:100">Address</th>
        <th data-options="field:'Edit',width:100">Edit</th>
        <th data-options="field:'Delete',width:100">Delete</th>
        <th data-options="field:'Insert ',width:150">Insert</th>
    </tr>
    </thead>
    <c:forEach items="${sessionScope.student}" var="stu">
        <tr>
            <td>${stu.stuId}</td>
            <td>${stu.stuName}</td>
            <td>${stu.stuSex}</td>
            <td>${stu.stuAdd}</td>
            <td>
                <a href="${pageContext.request.contextPath}/views/update.jsp?id=${stu.stuId}&name=${stu.stuName}&add=${stu.stuAdd}&sex=${stu.stuSex}&fid=${stu.unitId}&q=4">Edit</a>
            </td>
            <td><a class="delete" href="student/${stu.stuId}">Delete</a></td>
            <td><a class="Insert" href="${pageContext.request.contextPath}/views/insert.jsp?q=4">Insert</a></td>
        </tr>
    </c:forEach>
</table>
<br><br>
</body>
</html>