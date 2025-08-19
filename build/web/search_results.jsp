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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css"/>
        <link href="assets/search-resultt.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main style="font-family: Montserrat, sans-serif">
            <h2>Kết quả tìm kiếm cho từ khóa: <b>${param.keyword}</b></h2>
            <div class="all-product-list">
                <div class="all-product-frame">
                    <c:choose>
                        <c:when test="${not empty productList}">
                            <c:forEach var="product" items="${productList}">
                                <div class="all-product" style="margin-left: 5px">
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
                        </c:when>
                        <c:otherwise>
                            <p>Không tìm thấy sản phẩm nào.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </main>
        <%@ include file="footer.jsp" %>
    </body>
</html>
