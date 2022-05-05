<%@page import="model.user"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : syllabusTable
    Created on : Mar 7, 2022, 10:17:59 PM
    Author     : Zoe H. Hoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="title-container align-content-center">
    <span class="text-center home-title ">Syllabus Management</span>
</div>

<div class="align-self-center mb-4">
    <form action="subsearch" method="get">
        <label for="subject-search" class="fs-5">Subject search:</label>
        <select name="name" id="searching-selection" class="align-self-center">
            <option value="code" selected="selected">Code</option>
            <option value="name">Name</option>
        </select>
        <input type="hidden" name="url" value="<%= request.getRequestURI()%>" />
        <input type="text" name="subject" id="subject-code" placeholder="Subject Code" value="">
        <input type="submit" value="Search" id="btn-search">
    </form>
</div>

<div class="d-flex flex-column align-items-center p-4">
    <c:if test="${user.ru.roleId==4&&user.status}">
        <button type="button" class="btn btn-success mb-3 align-self-end" onclick="window.location.href = 'addcurriculum'">Add Syllabus</button>
    </c:if>
    <c:if test="${list!=null}">
        <table class="table table-responsive">
            <tr class="thead">
                <td>Subject Code</td>
                <td>Subject Name</td>
                <td>Decision No</td>
                <c:if test="${ru.roleId==4&&user.status}">
                    <td></td>
                    <td></td>
                </c:if>
            </tr>
            <c:forEach var="s" items="${list}"> 
                <tr class="t-row">                      
                    <td>${s.subCode}</td>
                    <td><a href="subjectdetail?SubjectCode=${s.subCode}">${s.subName}</td>
                    <td>1485/QĐ-ĐH-FPT dated 12/31/2021</td>
                    <c:if test="${user.ru.roleId==4&&user.status}">
                        <td><a href="#">Edit</a></td>
                        <td><a href="#">Delete</a></td>
                    </c:if>                  
                </tr>
            </c:forEach>
        </table>
    </c:if>

</div>