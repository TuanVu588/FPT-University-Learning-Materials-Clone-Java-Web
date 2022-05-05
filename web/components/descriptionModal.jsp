<%-- 
    Document   : descriptionModal
    Created on : Mar 7, 2022, 10:01:53 PM
    Author     : Zoe H. Hoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal" id="description-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">${curri.currName}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>${curri.currDesc}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
