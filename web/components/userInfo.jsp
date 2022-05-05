<%@page import="model.Role_User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : userInfo
    Created on : Mar 7, 2022, 1:09:30 AM
    Author     : Zoe H. Hoa
--%>

<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = "";
    try {
        user u = (user) session.getAttribute("user");
        switch (u.getRu().getRoleId()) {
            case 1: {
                role = "student";
                break;
            }
            case 2: {
                role = "teacher";
                break;
            }
            case 3: {
                role = "admin";
                break;
            }
            case 4: {
                role = "IT Staff";
                break;
            }
            case 5: {
                role = "EN Staff";
                break;
            }
            case 6: {
                role = "BA Staff";
                break;
            }
        }
    } catch (Exception e) {
    }
%>

<c:if test="${user!=null}">
    <div class="user-info">
        <img src="assets/img/avatar_default.png" alt="avatar" id="avatar">
        <div id="info-listing">
            <ul>
                <li>Name: ${user.username} </li>
                <li>User's role: <%=role%></li>
                <li>Status: ${user.status?"Active":"De-active"}</li>
                <a href="logout" onclick="signOut()" id="btn-sign-out">
                    <li>Sign out</li>
                </a>
            </ul>
        </div>
    </div>
</c:if>
