<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : curriculumItem
    Created on : Mar 7, 2022, 11:03:31 PM
    Author     : Zoe H. Hoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="title-container align-content-center">
    <span class="text-center home-title">${curriculum.currName}</span>
</div>
<table class="table table-responsive">
    <tr>
        <td class="left-col">Curriculum Code</td>
        <td class="right-col">${curriculum.currID}</td>
    </tr>
    <tr>
        <td class="left-col">Curriculum Name</td>
        <td class="right-col">${curriculum.currName}</td>
    </tr>
    <tr>
        <td class="left-col">Description</td>
        <td class="right-col">${curriculum.currDesc}</td>
    </tr>
    <tr>
        <td class="left-col">Subjects in this Curriculum </td>
        <td class="right-col">
            <c:forEach var="s" items="${subjects}">
        <li ><a href="subjectdetail?SubjectCode=${s.subCode}">${s.subCode} - ${s.subName}</a></li>
        </c:forEach>
</td>
</tr>
</table>

