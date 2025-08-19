<%-- 
    Document   : iphone
    Created on : 16 thg 5, 2025, 18:48:54
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
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap"
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main style="margin-bottom: 50px; text-align: center">
            <div class="banner-iphone" style="">
                <img src="${bannerURL}" style=" width: 100%; height: 100%"/>
            </div>
            <form action="" method="">
                <div class="filter-product" style=" margin-top: 50px">
                    <div class="filter-product__title_menu">
                        <div class="filter-product__title">Tất cả sản phẩm (13)</div>
                    </div>
                <div class="filter-product__menu">
                    <div class="filter-product__menu_item">
                        <span>
                            <span class="icon-container">
                                Brand
                                <ul class="filter-product__menu_item_list_header scrollable-list">
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone</p>
                                        </div>
                                    </li>
                                </ul>
                                <i class="fa-solid fa-chevron-down icon first" style="margin-left: 2px"></i>
                                <i class="fa-solid fa-chevron-up icon second"></i>
                            </span>
                        </span>
                        <span>
                            <span class="icon-container">
                                Collection
                                <ul class="filter-product__menu_item_list_header scrollable-list">
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone SE</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 14</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 14 Plus</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 14 Pro</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 14 Pro Max</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 15</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 15 Plus</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 15 Pro</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 15 Pro Max</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 16</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 16 Plus</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 16 Pro</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">iPhone 16 Pro Max</p>
                                        </div>
                                    </li>
                                </ul>
                                <i class="fa-solid fa-chevron-down icon first" style="margin-left: 2px"></i>
                                <i class="fa-solid fa-chevron-up icon second"></i>
                            </span>
                        </span>
                        <span>
                            <span class="icon-container">
                                Color
                                <ul class="filter-product__menu_item_list_header scrollable-list">
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Black</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Pink</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Teal</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Ultramarine</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">White</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Red</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Blue</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Midnight</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Purple</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Starlight</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Deep Purple</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Gold</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Silver</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Space Black</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Black iPhone 15</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Pink iPhone 15</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Green iPhone 15</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Yellow iPhone 15</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Blue iPhone 15</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Black Titanium</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Blue Titanium</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Natural Titanium</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">White Titanium</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Desert Titanium</p>
                                        </div>
                                    </li>
                                </ul>
                                <i class="fa-solid fa-chevron-down icon first" style="margin-left: 2px"></i>
                                <i class="fa-solid fa-chevron-up icon second"></i>
                            </span>
                        </span>
                        <span>
                            <span class="icon-container">
                                Campacity
                                <ul class="filter-product__menu_item_list_header scrollable-list">
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">64GB</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">128GB</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">256GB</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">512GB</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">1TB</p>
                                        </div>
                                    </li>
                                </ul>
                                <i class="fa-solid fa-chevron-down icon first" style="margin-left: 2px"></i>
                                <i class="fa-solid fa-chevron-up icon second"></i>
                            </span>
                        </span>
                        <span>
                            <span class="icon-container">
                                Stock
                                <ul class="filter-product__menu_item_list_header scrollable-list">
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">Out of Stock</p>
                                        </div>
                                    </li>
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="filter-product__menu_item_list_item_icon">
                                            <input type="checkbox" name="" value="">
                                            <p style="margin-left: 7px; color: grey">In Stock</p>
                                        </div>
                                    </li>
                                </ul>
                                <i class="fa-solid fa-chevron-down icon first" style="margin-left: 2px"></i>
                                <i class="fa-solid fa-chevron-up icon second"></i>
                            </span>
                        </span>
                        <span>
                            <span class="icon-container">
                                Price
                                <ul class="filter-product__menu_item_list_header scrollable-list" style="width: 150px">
                                    <li class="filter-product__menu_item_list_item" style="list-style-type: none">
                                        <div class="price-slide-container" style="margin: 10px">
                                            <input type="range" min="0" max="40990000" value="40990000" class="slider" id="priceRange" oninput="this.nextElementSibling.value = this.value">
                                            <output class="value-label">40990000</output> <u>đ</u>
                                        </div>
                                    </li>
                                </ul>
                                <i class="fa-solid fa-chevron-down icon first" style="margin-left: 3px"></i>
                                <i class="fa-solid fa-chevron-up icon second"></i>
                            </span>
                        </span>
                    </div>
                </div>
                <button type="submit" class="filter-button" style="background-color: black; color: #ffffff; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-size: 14px; transition: background-color 0.3s ease;">Lọc sản phẩm</button>
            </div>
            </form>

            <div class="all-product-list">
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
        </main>
        <%@ include file="footer.jsp" %>
    </body>
    
</html>

