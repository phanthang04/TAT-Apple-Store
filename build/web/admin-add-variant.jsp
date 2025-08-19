<%-- 
    Document   : admin-products
    Created on : 17 thg 5, 2025, 20:13:38
    Author     : tnteheh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap" rel="stylesheet">
    <link href="assets/admin-products.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin-dashboard.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin-edit-products.css" rel="stylesheet" type="text/css"/>
    <title>Thêm Phiên Bản Sản Phẩm</title>
</head>
<body>
    <div class="container">
        <%@ include file="admin-navbar-left.jsp" %>

        <!-- Main Content -->
        <div class="main-content">
            <%@ include file="admin-header.jsp" %>
            <div class="header-title">
                <h1 style="font-family: 'Montserrat-Regular';">THÊM PHIÊN BẢN SẢN PHẨM</h1>
            </div>
            <!-- Add Variant Form -->
            <div class="edit-product-form">
                <form action="add-variant" method="post">
                    <div class="form-group">
                        <label for="id-product">ID sản phẩm</label>
                        <input type="text" id="id-product" name="productId" required>
                    </div>
                    <div class="form-group">
                        <label for="capacity">Phiên bản</label>
                        <input type="text" id="capacity" name="capacity" required>
                    </div>
                    <div class="form-group">
                        <label for="price">Giá</label>
                        <input type="text" id="price" name="price" required>
                    </div>
                    <div class="form-group">
                        <label for="stock">Số lượng</label>
                        <input type="text" id="stock" name="stock" required>
                    </div>
                    <div class="form-buttons">
                        <button type="submit" class="add-button">Thêm</button>
                        <a href="admin-products.jsp" class="cancel-button">Hủy</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>