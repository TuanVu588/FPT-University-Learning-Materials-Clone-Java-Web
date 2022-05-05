<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : learningPathTable
    Created on : Mar 7, 2022, 10:19:22 PM
    Author     : Zoe H. Hoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="title-container align-content-center">
    <span class="text-center home-title ">Learning Path</span>
</div>

<div class="align-self-center mb-4">
    <form action="subsearch" method="get">
        <label for="subject-search" class="fs-5">Subject code:</label>
        <input type="hidden" name="url" value="<%= request.getRequestURI()%>" />
        <input type="text" name="subject" id="subject-code" placeholder="Subject Code" value="${substr}">
        <input type="submit" value="Search" id="btn-search">
    </form>
</div>
<c:if test="${sub!=null}">
    <div class="d-flex flex-column align-items-center p-4">
        <c:if test="${sub.subName!=null}">
            <table class="table table-responsive">
                <tr class="thead">
                    <td>Subject Code</td>
                    <td>Syllabus Name</td>
                    <td>Decision No</td>
                    <td>All subjects need to learn before</td>
                </tr>

                <tr class="t-row">
                    <td>${sub.subCode}</td>
                    <td>
                        ${sub.subName}
                    </td>
                    <td>1485/QĐ-ĐH-FPT dated 12/31/2021</td>
                    <td>
                        <c:if test="${!isempty}">
                            <c:forEach var="pre" items="${sub.subPre}">
                        <li>${pre}</li>                            
                        </c:forEach>
                    </c:if>
                    <c:if test="${isempty}">
                    <p>This subject doesn't have required subject</p>
                </c:if>
                </td>
                </tr>
            </table>
        </c:if>
        <c:if test="${sub.subName==null}">
            <p style="color: red;"> The subject "${substr}" is not found</p>
        </c:if>


    </div>
</c:if>