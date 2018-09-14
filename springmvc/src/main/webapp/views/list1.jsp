<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <!-- Springmvc处理静态资源
        1.无法直接访问静态资源（No mapping found for HTTP request with URI……）
          优雅的restful风格的资源url 不希望带 .html  .do等后缀
         若将DispathcherServlet 请求映射配置为 /，
         则SpringMvc将捕获  web 容器所有的请求，包括静态资源的请求，SpringMvc会将静态资源请求当作一个普通资源
         因此找不到对应的处理器而报错
        2.解决办法
            在SpringMvc的配置文件中<defalut-servlet-handler/>

     -->


    <!-- src路径 -->

</head>

<body>
列出所有表数据<br>


<form action="" method="post">
    <!-- 将post请求转换成delete请求的过滤器 HiddenHttpMethodFilter 中接收的参数名  _method -->
    <input type="hidden" name="_method" value="DELETE"/>
</form>
<big>欢迎登录~,${sessionScope.currentuser}</big>
<a href="${pageContext.request.contextPath}/district">查询地区</a>
<div>
    <!--地区信息-->
    <c:if test="${empty sessionScope.district }">
        没有地区信息
    </c:if>
    <c:if test="${! empty sessionScope.district}">
        <table border="1" cellpadding="10" cellspacing="0">
            <h5>地区表[District]</h5>
            <tr>
                <th>ID</th>
                <th>DistrictName</th>
                <th>Edit</th>
                <th>Delete</th>
                <th>Insert</th>
            </tr>
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
    </c:if>
</div>
<br><br>
<a href="${pageContext.request.contextPath}/organization">查询学校</a>
<div>
    <!--学校信息-->
    <c:if test="${empty sessionScope.organization }">
        没有学校信息
    </c:if>
    <c:if test="${! empty sessionScope.organization}">
        <table border="1" cellpadding="10" cellspacing="0">
            <h5>学校表[Organization]</h5>
            <tr>
                <th>orgId</th>
                <th>OrgName</th>
                <th>Edit</th>
                <th>Delete</th>
                <th>Insert</th>
            </tr>
            <c:forEach items="${sessionScope.organization}" var="org">
                <tr>
                    <td>${org.orgId}</td>
                    <td>${org.orgName}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/views/update.jsp?id=${org.orgId}&name=${org.orgName}&fid=${org.disId}&q=2">Edit</a>
                    </td>
                    <td><a class="Delete" href="organization/${org.orgId}">Delete</a></td>
                    <td><a class="Insert" href="${pageContext.request.contextPath}/views/insert.jsp?q=2">Insert</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
<br><br>
<a href="${pageContext.request.contextPath}/unit">查询班级</a>
<div>
    <!--班级信息-->
    <c:if test="${empty sessionScope.unit }">
        没有班级信息
    </c:if>
    <c:if test="${! empty sessionScope.unit}">
        <table border="1" cellpadding="10" cellspacing="0">
            <h5>班级表[Unit]</h5>
            <tr>
                <th>unitId</th>
                <th>UnitName</th>
                <th>Edit</th>
                <th>Delete</th>
                <th>Insert</th>
            </tr>
            <c:forEach items="${sessionScope.unit}" var="u">
                <tr>
                    <td>${u.unitId}</td>
                    <td>${u.unitName}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/views/update.jsp?id=${u.unitId}&name=${u.unitName}&fid=${u.orgId}&q=3">Edit</a>
                    </td>
                    <td><a class="Delete" href="${pageContext.request.contextPath}/unit/${u.unitId}">Delete</a></td>
                    <td><a class="Insert" href="${pageContext.request.contextPath}/views/insert.jsp?q=3">Insert</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
<br><br>
<a href="${pageContext.request.contextPath}/student">查询学生</a>
<div>
    <!--学生信息-->
    <c:if test="${empty sessionScope.student }">
        没有学生信息
    </c:if>
    <c:if test="${! empty sessionScope.student}">
        <table border="1" cellpadding="10" cellspacing="0">
            <h5>学生表[Unit]</h5>
            <tr>
                <th>stuId</th>
                <th>stuName</th>
                <th>SEX</th>
                <th>ADDRESS</th>
                <th>Edit</th>
                <th>Delete</th>
                <th>Insert</th>
            </tr>
            <c:forEach items="${sessionScope.student}" var="stu">
                <tr>
                    <td>${stu.stuId}</td>
                    <td>${stu.stuName}</td>
                    <td>${stu.stuSex}</td>
                    <td>${stu.stuAdd}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/views/update.jsp?id=${stu.stuId}&name=${stu.stuName}&add=${stu.stuAdd}&sex=${stu.stuSex}&fid=${stu.unitId}&q=4">Edit</a>
                    </td>
                    <td><a class="Delete" href="student/${stu.stuId}">Delete</a></td>
                    <td><a class="Insert" href="${pageContext.request.contextPath}/views/insert.jsp?q=4">Insert</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
</body>
</html>
