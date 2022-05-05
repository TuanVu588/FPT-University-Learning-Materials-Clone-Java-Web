<%-- 
    Document   : navAside
    Created on : Mar 7, 2022, 1:08:09 AM
    Author     : Zoe H. Hoa
--%>

<%@page import="model.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int role = 0;
    user u = new user();
    try {

        u = (user) session.getAttribute("user");
        role = u.getRu().getRoleId();
    } catch (Exception e) {
    }
%>
<nav class="col-md-3" id="nav-aside">
    <div class="d-flex justify-content-center flex-column col-md-3 logo-container">
        <img src="assets/img/FPT.jpg" alt="Logo FU" id="logo">
        <a href="index.jsp" class="text-center system-name text-decoration-none">
            FPT University Learning Materials</a>
    </div>
    <div class="d-flex flex-column col-md-3 nav-component">
        <c:if test="<%=role == 0%>">
            <p class="text-center guest-feature-text">Guest's features of FU</p>
        </c:if>
        <c:if test="<%=role > 0%>">
            <p class="text-center guest-feature-text">Member's features of FU</p>
        </c:if>
        <ul>
            <c:if test="<%=role == 3%>">
                <a href="accManage" class="feature-link">
                    <li class="nav-elements">
                        Account Management
                    </li>
                </a>
            </c:if>
            <a href="curriculum" class="feature-link">
                <li class="nav-elements">
                    View Curriculums
                </li>
            </a>            
            <c:if test="<%=role > 0%>">
                <a href="syllabus.jsp" class="feature-link">
                    <li class="nav-elements">View Syllabus</li>
                </a>
            </c:if>

            <a href="learningpath.jsp" class="feature-link">
                <li class="nav-elements">Show Learning Path of a Subject</li>
            </a>

            <a href="prerequisite.jsp" class="feature-link">
                <li class="nav-elements">A subject is the pre-requisite of</li>
            </a>
        </ul>
    </div>
    <c:if test="<%=role == 0%>">
        <div class="d-flex col-md-3 nav-component justify-content-center flex-column align-content-center">
            <p class="text-center guest-feature-text">Sign in</p>
            <div class="d-flex justify-content-around">
                <button type="button" class="btn">
                    <div class="g-signin2" data-onsuccess="onSignIn"></div>
                    <!--<div class="g-signin2" onclick="window.location.href = "></div>-->
                </button>
                <!--<a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/SES_NB/googlesignin&response_type=code&client_id=995306627477-qkusfkj0uj1bl7eclbrv9kooa18jfq6r.apps.googleusercontent.com&approval_prompt=force">Sign in with Google</a>-->
            </div>
            <p class="text-center mt-3 text-note">Sign in using @fpt.edu.vn</p>
            <a href="#" class="staff-sign-in text-center" data-bs-toggle="modal"
               data-bs-target="#admin-signin">Sign in for Syllabus
                Reviewer - Designer Administrator</a>
        </div>
    </c:if>
    <div class="d-flex col-md-3 nav-component flex-column mt-4">
        <p>© Bản quyền thuộc Đại học FPT - Hà Nội</p>
        <div class="d-flex">
            <i class="fa-solid fa-location-dot pe-1"></i>
            <p>Km29 Đại lộ Thăng Long, Hòa Lạc, Thạch Thất, Hà Nội</p>
        </div>
    </div>
</nav>

<c:if test="<%=role == 0%>">
    <jsp:include page="loginModal.jsp"></jsp:include>   
</c:if>
