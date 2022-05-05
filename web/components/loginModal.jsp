<%-- 
    Document   : loginModal
    Created on : Mar 15, 2022, 11:16:10 AM
    Author     : Zoe H. Hoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal" id="admin-signin" tabindex="-1" aria-labelledby="signInModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="modal-signin">
            <div class="modal-header">
                <h5 class="modal-title fw-bold">Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="login" method="post">
                    <div class="input-container">
                        <label for="username">Username</label>
                        <input type="text" name="username" class="input" id="username-input"
                               placeholder="Username" required>
                    </div>
                    <div class="input-container">
                        <label for="username">Password</label>
                        <input type="password" name="password" class="input" id="password-input"
                               placeholder="Password" required >
                    </div>
                    <input type="submit" value="Login" class="btn-submit">
                </form>
            </div>
            <!-- <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div> -->
        </div>
    </div>
</div>
