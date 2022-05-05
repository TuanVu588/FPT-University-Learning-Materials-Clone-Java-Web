<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : curriculumsTable
    Created on : Mar 7, 2022, 9:55:34 PM
    Author     : Zoe H. Hoa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html> 
    <div class="title-container align-content-center">
        <span class="text-center home-title ">Curriculums Listing</span>
    </div>
    <div class="d-flex flex-column align-items-center p-4">
        <c:if test="${user.ru.roleId==4&&user.status}">
            <button type="button" class="btn btn-success mb-3 align-self-end" onclick="window.location.href = 'addcurriculum'">Add curriculum</button>
        </c:if>
        <table class="table table-responsive" style="margin-bottom: 50px">
            <c:if test="${curriculumlist!=null}">          
                <tr class="thead">
                    <td>Curriculum Code</td>
                    <td>Curriculum Name</td>
                    <td>Total Credit</td>
                    <c:if test="${user.ru.roleId==4&&user.status}">
                        <td></td>
                    </c:if>
                </tr>
                <c:forEach var="curri" items="${curriculumlist}">
                    <tr class="t-row">
                        <td id ="cur">${curri.currID}</td>
                        <td><a href="curriculumdetails?id=${curri.currID}">${curri.currName}</a></td>
                        <td>${curri.totalCredit}</td>
                        <c:if test="${user.ru.roleId==4&&user.status}">
                            <td><input type="button" onclick="window.location.href = 'updatecurriculum?id=${curri.currID}'" value = "Edit"></td>
<!--                            <td><input type="button" onclick="window.location.href = 'deletecurriculum?id=${curri.currID}'" value = "Delete"></td>-->
                            </c:if>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</html>
