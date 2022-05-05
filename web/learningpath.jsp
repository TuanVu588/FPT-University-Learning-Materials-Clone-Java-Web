<%-- 
    Document   : learningpath
    Created on : Mar 7, 2022, 10:18:55 PM
    Author     : Zoe H. Hoa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="components/header.jsp"></jsp:include>

    <body class="d-flex">
        <jsp:include page="components/navAside.jsp"></jsp:include>
            <main class="col-md-9" id="main-container">
            <c:if test="${user.ru.roleId>0}">
            <jsp:include page="components/userInfo.jsp"></jsp:include>
            </c:if>
            <jsp:include page="components/learningPathTable.jsp"></jsp:include>
            </main>
        </body>
    <jsp:include page="components/scriptEmbeded.jsp"></jsp:include>
</html>
