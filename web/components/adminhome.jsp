<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%-- 
    Document   : adminhome
    Created on : Mar 20, 2022, 11:45:38 PM
    Author     : Zoe H. Hoa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${output!=null}">
    <c:if test="${fn:contains(output, 'Failed')}">
        <div id="alertMes" class="alert">
            <strong>${output}</strong>           
        </div>          
    </c:if>
    <c:if test="${fn:contains(output, 'Success')}">
        <div id="alertMes" class="alert" style = "background-color: green">
            <strong>${output}</strong>   
        </div>
    </c:if>
</c:if>
<div class="title-container align-content-center">
    <span class="text-center home-title ">Account Management</span>
</div>
<% request.getSession().removeAttribute("output");%>
<c:if test="${user.ru.roleId!=3}">
    <% response.sendRedirect("../index.jsp");%>
</c:if>
<table class="table table-responsive">

    <button type="button" class="btn btn-success mb-3 align-self-end" data-bs-toggle="modal"
            data-bs-target="#admin-form">Add Member</button>
    <tr class="thead">
        <td>ID</td>
        <td>Username</td>
        <td>Password</td>
        <td>Role</td>
        <td>Status</td>
    </tr>   
    <c:forEach var="user" items="${listU}">
        <form action="accManage" method="POST">
            <tr class="t-row">
                <td>
                    ${user.userID}
                    <input type="hidden" name="userID" value="${user.userID}" />
                </td>
                <td>
                    <input type="hidden" name="username" value="${user.username}"/>
                    ${user.username}
                </td>
                <td>
                    <input id="1stPass" type="hidden" value="${user.password}"/>
                    <input type="password" name="password" class="input" id="password-input"
                           placeholder="Password" required value="${user.password}" onchange="checkUpdate()" >
                </td>
                <td>
                    <input id="1stRole" type="hidden" value="${user.ru.roleId}"/>
                    <select id="selection role-sel" name="roleSel" class="selection role-sel" onchange="checkUpdate()" >
                        <c:forEach var="r" items="${listR}">
                            <option ${r.roleID==user.ru.roleId?"selected":""} value="${r.roleID}">${r.roleName}</option> 
                        </c:forEach>                                            
                    </select>
                </td>
                <td>
                    <input id="1stStatus" type="hidden" value="${user.status}"/>
                    <select id="statuschange" name="statusSel" class="selection status-sel" onchange="checkUpdate()">
                        <option ${user.status==true?"selected":""} value="1">active</option>
                        <option ${user.status==false?"selected":""} value="0">de-active</option>
                    </select>
                </td>
                <td>
                    <input id="submitform" type="submit" value="Save" />
                </td>           
        </form>
        <td>
            <input type="hidden" name="userID" value="${user.userID}" />
            <input type="button" onclick="doDelete(${user.userID})" style ="color: red" value="Delete">     
        </td>
    </tr>
</c:forEach>  
</table>


<script>
    var username = document.getElementById("username-field").value;
    var password = document.getElementById("password-field").value;
    var role = document.getElementById("role-sel").value;
    const autohide = setTimeout(function () {
        document.getElementById("alertMes").style.display = 'none'
    }, 3000);
    function doDelete(id) {
        var c = confirm("Are you sure? This account will be deleted permantly.");
        if (c) {
            window.location.href = "deleteUser?id=" + id;
        }
    }

    function check() {
        if (username !== "" && password !== "" && role !== 0) {
            var d = document.getElementById("submit").style.backgroundColor = "green";
            var c = document.getElementById("submit").disabled = false;
            console.log(c);
        } else {
            var d = document.getElementById("submit").style.backgroundColor = "gray";
            var c = document.getElementById("submit").disabled = true;
        }
    }

    

</script>

<div class="modal" id="admin-form" tabindex="-1" aria-labelledby="signInModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="modal-signin">
            <div class="modal-header">
                <h5 class="modal-title fw-bold">Add member</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="adduser" method="post">
                    <div class="input-container">
                        <label for="username">Username</label>
                        <input type="text" name="username" class="input" id="username-field"
                               placeholder="Username" required onchange="check()">
                    </div>
                    <div class="input-container">
                        <label for="username">Password</label>
                        <input type="password" name="password" class="input" id="password-field"
                               placeholder="Password" required onchange="check()">
                        <!--<i id="security" class="fa-solid fa-eye"></i>-->
                    </div>
                    <div class="input-container">
                        <label for="username">Role</label>
                        <!-- Demo nhé. Nhớ thay dữ liệu trong DB vào -->
                        <select name="roleSel" id="role-sel" class="input" onchange="check()">
                            <option value="" selected>Choose Role</option>
                            <c:forEach var="r" items="${listR}">
                                <c:if test="${r.roleID!=3}">
                                    <option ${r.roleID==user.ru.roleId?"selected":""} value="${r.roleID}">${r.roleName}</option> 
                                </c:if>                                                           
                            </c:forEach> 
                        </select>
                    </div>
                    <input id="submit" type="submit" disabled="" style="background-color: gray" value="Add" class="btn-submit">
                </form>
            </div>
            <!-- <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div> -->
        </div>
    </div>
</div>
<style>
    .alert {
        padding: 20px;
        background-color: red;
        transition: opacity 3s;
        color: white;
    }
</style>