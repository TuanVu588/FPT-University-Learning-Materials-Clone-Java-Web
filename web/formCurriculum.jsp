<%-- 
    Document   : formCurriculum
    Created on : Mar 12, 2022, 12:24:05 AM
    Author     : Zoe H. Hoa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="components/header.jsp"></jsp:include>
        <body class="d-flex">
        <jsp:include page="components/navAside.jsp"></jsp:include>
            <main class="col-md-9" id="main-container">
            <c:if test="${user.ru.roleId>0}">
                <jsp:include page="components/userInfo.jsp"></jsp:include>
            </c:if>
            <c:if test="${user.ru.roleId==4}">
                <jsp:include page="components/formCurComponent.jsp"></jsp:include>
            </c:if>
            <c:if test="${user.ru.roleId!=4}">
                <jsp:include page="components/carousel.jsp"></jsp:include>
            </c:if>
        </main>

    </body>
    <jsp:include page="components/scriptEmbeded.jsp"></jsp:include>
    <script src="https://cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('description');
    </script>
</html>
