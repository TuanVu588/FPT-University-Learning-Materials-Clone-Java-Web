<%-- 
    Document   : curriculums.jsp
    Created on : Mar 7, 2022, 9:51:17 PM
    Author     : Zoe H. Hoa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="components/header.jsp" ></jsp:include>
        <body class="d-flex">
        <jsp:include page="components/navAside.jsp"></jsp:include>
            <main class="col-md-9" id="main-container">
            <c:if test="${user.ru.roleId>0}">
            <jsp:include page="components/userInfo.jsp"></jsp:include>
            </c:if>
            <a>${ru}</a>
            <jsp:include page="components/curriculumsTable.jsp"></jsp:include>
            </main>
        <jsp:include page="components/descriptionModal.jsp"></jsp:include>
        </body>
    <jsp:include page="components/scriptEmbeded.jsp"></jsp:include>
</html>
