<%-- 
    Document   : syllabusItem
    Created on : Mar 7, 2022, 11:04:14 PM
    Author     : Zoe H. Hoa
--%>
<%@page import="model.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="title-container align-content-center">
    <span class="text-center home-title">${s.subName}</span>
</div>
<table class="table table-responsive">
    <tr>
        <td class="left-col">Subject Code</td>
        <td class="right-col">${s.subCode}</td>
    </tr>
    <tr>
        <td class="left-col">Subject Name</td>
        <td class="right-col">${s.subName}</td>
    </tr>
    <tr>
        <td class="left-col">Description</td>
        <td class="right-col">${s.subDesc}</td>
    </tr>
    <tr>
        <td class="left-col">DecisionNo MM/dd/yyyy: </td>
        <td class="right-col">370/QĐ-ĐHFPT dated 04/01/2021</td>
    </tr>
</table>
<table class="table table-responsive">
    <c:if test="${user.ru.roleId==2&&user.status}">
        <tr class="thead">
            <td>Teacher Material</td>
            <td><a href="">Download material for Teacher</a></td>
        </tr> 
        <c:forEach var="mate" items="${m}"> 
            <c:if test="${mate.forTeacher}">
                <tr class="t-row"> 
                    <td>${mate.materialDesc}</td>
                </tr>
            </c:if>        
        </c:forEach>
    </c:if>
    <c:if test="${user.ru.roleId<2&&user.status}">
        <tr class="thead">
            <td>Student Material</td>
            <td><a href="">Download material for Student</a></td>
        </tr> 
        <c:forEach var="mate" items="${m}"> 
            <c:if test="${!mate.forTeacher}">
                <tr class="t-row"> 
                    <td>${mate.materialDesc}</td>
                </tr>
            </c:if>        
        </c:forEach>
    </c:if>
    <c:if test="${user.ru.roleId==4&&user.status}">
        <tr class="thead">
            <td>Teacher Material</td>
        </tr> 
        <c:forEach var="mate" items="${m}"> 
            <c:if test="${mate.forTeacher}">
                <tr class="t-row"> 
                    <td>${mate.materialDesc}</td>
                </tr>
            </c:if>        
        </c:forEach>        
        <tr class="thead">
            <td>Student Material</td>
        </tr> 
        <c:forEach var="mate" items="${m}"> 
            <c:if test="${!mate.forTeacher}">
                <tr class="t-row"> 
                    <td>${mate.materialDesc}</td>
                </tr>
            </c:if>        
        </c:forEach>
    </c:if>
</table>
        
<c:if test="${!isempty}">
    <table class="table table-responsive">
        <tr class="thead">
            <td>Session</td>
            <td>Topic</td>
        </tr>
        <c:forEach var="session" items="${list}"> 
            <tr class="t-row">                      
                <td>${session.sessID}</td>
                <td>${session.topic}</td>         
            </tr>
        </c:forEach>
    </table>
</c:if>
