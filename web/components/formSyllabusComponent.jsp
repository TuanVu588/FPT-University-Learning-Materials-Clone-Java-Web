<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : formSyllabusComponent
    Created on : Mar 12, 2022, 12:32:28 AM
    Author     : Zoe H. Hoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${ru.roleId!=4}">
    <%response.sendRedirect("../index.jsp");%>
</c:if>
<div class="title-container align-content-center">
    <span class="text-center home-title ">Add Syllabus</span>
</div>

<div class="align-items-center form-container">
    <form action="/" method="post" class="m-4">
        <div class="form-controller d-flex flex-column">
            <label for="syllabus-name" class="label">Syllabus Name</label>
            <input value="${subject.subName}" type="text" name="syllabusName" id="syllabus-name" class="input" placeholder="Syllabus Name">
        </div>
        <div class="form-controller d-flex flex-column">
            <label for="subject-code" class="label">Subject Code</label>
            <input value="${subject.subCode}" type="text" name="subjectCode" id="subject-code" class="input" placeholder="Subject Code">
        </div>
        <div class="form-controller d-flex flex-column">
            <label for="pre-requisite" class="label">Pre-requisite</label>
            <select name="subjectPre">
                <c:forEach var="sub" items="${listSubject}">
                    <option value="${sub.subCode}">${sub.subName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-controller d-flex flex-column">
            <label for="description" class="label">Description</label>
            <textarea name="description" id="description" cols="120" rows="10"
                      placeholder="Syllabus Description" >${subject.subDesc} </textarea>
        </div>
        <%--
        <div class="form-controller d-flex flex-column">
            <label for="given-materials" class="label">Upload Materials</label>
            <input type="file" name="givenMaterials" id="given-materials">
        </div>
        --%>
        <input type="submit" value="Submit" id="btn-submit">
    </form>
</div>

