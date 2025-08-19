<%-- 
    Document   : admin-products
    Created on : 17 thg 5, 2025, 20:13:38
    Author     : tnteheh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProductVariant"%>
<%
    ProductVariant variant = (ProductVariant) request.getAttribute("variant");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap" rel="stylesheet">
    <link href="assets/admin-products.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin-dashboard.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin-edit-products.css" rel="stylesheet" type="text/css"/>
    <title>Sửa Phiên Bản Sản Phẩm</title>
</head>
<body>
    <div class="container">
        <%@ include file="admin-navbar-left.jsp" %>

        <!-- Main Content -->
        <div class="main-content">
            <%@ include file="admin-header.jsp" %>
            <div class="header-title">
                <h1 style="font-family: 'Montserrat-Regular';">SỬA PHIÊN BẢN SẢN PHẨM</h1>
            </div>
            <!-- Edit Product Form -->
            <div class="edit-product-form">
                <form action="update-variant" method="post">
                    <input type="hidden" name="variantId" value="<%= variant.getVariantId() %>">
                    <div class="form-group">
                        <label for="productId">ID sản phẩm</label>
                        <input type="text" id="productId" name="productId" value="<%= variant.getProductId() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="capacity">Phiên bản</label>
                        <input type="text" id="capacity" name="capacity" value="<%= variant.getCapacity() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="price">Giá</label>
                        <input type="text" id="price" name="price" value="<%= variant.getPrice() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="stock">Số lượng</label>
                        <input type="text" id="stock" name="stock" value="<%= variant.getStock() %>" required>
                    </div>
                    <div class="form-buttons">
                        <button type="submit" class="add-button">Lưu</button>
                        <a href="admin-variant" class="cancel-button">Hủy</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>