<%@page import="java.util.List"%>
<%@page import="model.user"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : formCurriculum
    Created on : Mar 12, 2022, 12:01:42 AM
    Author     : Zoe H. Hoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<user> listStaff = (List<user>) request.getAttribute("listStaff");
%>
<c:if test="${ru.roleId!=4}">
    <%response.sendRedirect("../index.jsp");%>
</c:if>
<div class="title-container align-content-center">
    <span class="text-center home-title ">Add Curriculums</span>
</div>
<div class="align-items-center form-container">
    <form action="addcurriculum" method="post" class="m-4">
        <div class="form-controller d-flex flex-column">
            <label for="curriculum-code" class="label">Curriculum Code</label>
            <input value="${curr.currID}" type="text" name="curriculumCode" id="curriculum-code" placeholder="Curriculum Code">
        </div>
        <div class="form-controller d-flex flex-column">
            <label for="curriculum-name" class="label">Curriculum Name</label>
            <input value="${curr.currName}"type="text" name="curriculumName" id="curriculum-name" placeholder="Curriculum Name">
        </div>
        <div class="form-controller d-flex flex-column">
            <label for="staff" class="label">Subject in Curriculum</label>
            <select name="staff">
<!--                <c:forEach var="staff" items="${listStaff}">
                    <option value="${staff.getUserID()}">${staff.getUsername()}</option>
                </c:forEach>                -->
                <c:forEach var="s" items="${listSubject}">
                    <option value="${s.subCode}">${s.subName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-controller d-flex flex-column">
            <label for="description" class="label">Description</label>
            <textarea name="description" id="description" cols="120" rows="10"
                      placeholder="Curriculum Description" >${curr.currDesc}</textarea>
        </div>
        <input type="submit" value="Submit" id="btn-submit">
    </form>
</div>
