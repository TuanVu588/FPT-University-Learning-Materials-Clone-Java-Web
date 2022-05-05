<%-- 
    Document   : admin
    Created on : Mar 20, 2022, 11:57:27 PM
    Author     : Zoe H. Hoa
--%>

<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int role;
    try {
        user u = (user) session.getAttribute("user");
        role = u.getRu().getRoleId();
        if (role != 3) {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        role = 0;
    }
%>
<html>
    <%
        if (role != 3) {
            response.sendRedirect("index.jsp");
        }
    %>
    <jsp:include page="components/header.jsp" ></jsp:include>
        <body class="d-flex">
        <jsp:include page="components/navAside.jsp"></jsp:include>
            <main class="col-md-9" id="main-container">
            <%if (role > 0) {%>
            <jsp:include page="components/userInfo.jsp"></jsp:include>
            <%}%>           
            <%if (role == 3) {%>
            <jsp:include page="components/adminhome.jsp"></jsp:include>
            <%}%>
        </main>
    </body>
    <jsp:include page="components/scriptEmbeded.jsp"></jsp:include>
</html>