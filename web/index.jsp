<%-- 
    Document   : index
    Created on : Mar 6, 2022, 10:09:21 PM
    Author     : Zoe H. Hoa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="components/header.jsp"></jsp:include>
        <body class="d-flex">
            <jsp:include page="components/navAside.jsp"></jsp:include>
        <main class="col-md-9" id="main-container">
            <c:if test="${user.ru.roleId>0}">
                <jsp:include page="components/userInfo.jsp"></jsp:include>
            </c:if>
            <jsp:include page="components/carousel.jsp"></jsp:include>
            </main>
        </body>
    <jsp:include page="components/scriptEmbeded.jsp"></jsp:include>
</html>