<%-- 
    Document   : home
    Created on : 16 thg 5, 2025, 13:24:36
    Author     : tnteheh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/iphone.css" rel="stylesheet" type="text/css"/>
        <link href="assets/home.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <title>TAT Apple - Đại lý uỷ quyền Apple</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main>
        <!-- SLIDE CHẠY ẢNH  -->
            <div class="slide-show">
                <div class="list-images">
                    <!-- Slide 1 -->
                    <div class="slide-item">
                        <img class="banner" src="images/Banner0.png" alt=""/>
                    </div>
                </div>
            </div>
            <h1 style="margin-top: 50px">SẢN PHẨM MỚI</h1>
            </div>
            <div class="all-product-list" style="margin-top: 20px">
                <div class="all-product-frame">
                    <c:forEach var="product" items="${productList}">
                        <div class="all-product">
                            <a href="infor-product.jsp?productID=${product.productID}">
                                <img class="all-product-img" src="${product.imageURL}" alt="${product.productName}">
                            </a>
                            <p class="all-product-name">${product.productName}</p>
                            <p class="all-product-price">
                                <fmt:formatNumber value="${product.basePrice}" type="number" groupingUsed="true"/> <u>đ</u>
                            </p>
                            <div class="all-product-color">
                                <span>
                                    <img class="all-product-color_icon" src="${product.imageColorURL}" alt="Color icon"/>
                                </span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            
            
                    <!-- iPhone mới nhất -->
            <h1>iPhone</h1>
            <div class="all-product-list" style="margin-top: 20px">
                <div class="all-product-frame">
                    <c:forEach var="product" items="${iphoneList}">
                        <div class="all-product">
                            <a href="infor-product.jsp?productID=${product.productID}">
                                <img class="all-product-img" src="${product.imageURL}" alt="${product.productName}">
                            </a>
                            <p class="all-product-name">${product.productName}</p>
                            <p class="all-product-price">
                                <fmt:formatNumber value="${product.basePrice}" type="number" groupingUsed="true"/> <u>đ</u>
                            </p>
                            <div class="all-product-color">
                                <span>
                                    <img class="all-product-color_icon" src="${product.imageColorURL}" alt="Color icon"/>
                                </span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- iPad mới nhất -->
            <h1>iPad</h1>
            <div class="all-product-list" style="margin-top: 20px">
                <div class="all-product-frame">
                    <c:forEach var="product" items="${ipadList}">
                        <div class="all-product">
                            <a href="infor-product.jsp?productID=${product.productID}">
                                <img class="all-product-img" src="${product.imageURL}" alt="${product.productName}">
                            </a>
                            <p class="all-product-name">${product.productName}</p>
                            <p class="all-product-price">
                                <fmt:formatNumber value="${product.basePrice}" type="number" groupingUsed="true"/> <u>đ</u>
                            </p>
                            <div class="all-product-color">
                                <span>
                                    <img class="all-product-color_icon" src="${product.imageColorURL}" alt="Color icon"/>
                                </span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            
            <h1>Mac</h1>
            <div class="all-product-list" style="margin-top: 20px">
                <div class="all-product-frame">
                    <c:forEach var="product" items="${macbookList}">
                        <div class="all-product">
                            <a href="infor-product.jsp?productID=${product.productID}">
                                <img class="all-product-img" src="${product.imageURL}" alt="${product.productName}">
                            </a>
                            <p class="all-product-name">${product.productName}</p>
                            <p class="all-product-price">
                                <fmt:formatNumber value="${product.basePrice}" type="number" groupingUsed="true"/> <u>đ</u>
                            </p>
                            <div class="all-product-color">
                                <span>
                                    <img class="all-product-color_icon" src="${product.imageColorURL}" alt="Color icon"/>
                                </span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
                                
                <!-- WHY-CHOOSE-TAT-APPLE  -->
            <div class="why-choose-TAT-Apple">
                <img src="images/Why-choose-TAT-Apple.png"
                    style="width: 100%; padding-left: 300px; padding-right: 300px" alt="">
            </div>

                <!-- WORKSHOP-TIN TỨC  -->
            <div class="workshops-tintuc">
                <div class="workshop">
                    <a href="https://www.google.com/maps/place/H%E1%BB%8Dc+vi%E1%BB%87n+C%C3%B4ng+ngh%E1%BB%87+B%C6%B0u+ch%C3%ADnh+vi%E1%BB%85n+th%C3%B4ng/@20.978057,105.7938073,15z/data=!4m6!3m5!1s0x3135accdd8a1ad71:0xa2f9b16036648187!8m2!3d20.980913!4d105.7874165!16s%2Fg%2F12168p16?entry=ttu&g_ep=EgoyMDI1MDIxOS4xIKXMDSoASAFQAw%3D%3D">
                        <img src="images/Workshop.png" alt="workshop">
                        <p class="text-workshop">Workshop</p>
                    </a>
                </div>
                <div class="tintuc">
                        <a href="">
                            <img src="images/TinTuc.png" alt="tintuc">
                            <p class="text-tintuc">Tin tức</p>
                        </a>
                </div>
            </div>
        </main>
        <%@ include file="footer.jsp" %>
    </body>
    
</html>
