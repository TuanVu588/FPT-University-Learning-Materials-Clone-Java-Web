<%-- 
    Document   : carousel
    Created on : Mar 7, 2022, 1:10:38 AM
    Author     : Zoe H. Hoa
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Carousel -->

<div id="demo" class="carousel slide" data-bs-ride="carousel">

    <!-- Indicators/dots -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
    </div>

    <!-- The slideshow/carousel -->
    <div class="carousel-inner">
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
        <% request.getSession().removeAttribute("output");%>
                
        <div class="carousel-item active">
            <img src="assets/img/123047967_100499325205002_8977019490039524020_n.jpg" alt="FU HCM"
                 class="d-block w-100">
        </div>
        <div class="carousel-item">
            <img src="assets/img/119841081_3924498517579720_270195607207500304_n.jpg"
                 alt="International Day" class="d-block w-100">
        </div>
        <div class="carousel-item">
            <img src="assets/img/131389468_151096456811955_2057784811922913958_n.jpg" alt="FU HN"
                 class="d-block w-100">
        </div>
        <div class="carousel-item">
            <img src="assets/img/IMG_0005-HDR.jpg" alt="FU dawn" class="d-block w-100">
        </div>
    </div>

    <!-- Left and right controls/icons -->
    <!-- <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button> -->
</div>
<style>
    .alert {
        padding: 20px;
        background-color: red;
        transition: opacity 1s;
        color: white;
        position: absolute;
        z-index: 1;
        width: 100%;
    }
</style>
<script>
    const autohide = setTimeout(function () {
        document.getElementById("alertMes").style.display = 'none'
    }, 3000);
</script>