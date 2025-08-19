<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm mới</title>
    <link href="assets/admin-products.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin-add-product.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <%@ include file="admin-navbar-left.jsp" %>
        <div class="main-content">
            <%@ include file="admin-header.jsp" %>
            <div class="header-title">
                <h1>THÊM SẢN PHẨM MỚI</h1>
            </div>
            <div class="edit-product-form">
                <form action="add-product" method="post">
                    <div class="form-group">
                        <label for="productName">Tên sản phẩm</label>
                        <input type="text" id="productName" name="productName" required />
                    </div>
                    <div class="form-group">
                        <label for="brandID">Thương hiệu (Brand ID)</label>
                        <input type="number" id="brandID" name="brandID" required />
                    </div>
                    <div class="form-group">
                        <label for="categoryID">Danh mục (Category ID)</label>
                        <input type="number" id="categoryID" name="categoryID" required />
                    </div>
                    <div class="form-group">
                        <label for="basePrice">Giá (Base Price)</label>
                        <input type="number" step="0.01" id="basePrice" name="basePrice" required />
                    </div>
                    <div class="form-group">
                        <label for="description">Mô tả</label>
                        <textarea id="description" name="description" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="imageURL">Ảnh sản phẩm (Image URL)</label>
                        <input type="text" id="imageURL" name="imageURL" required />
                    </div>
                    <div class="form-group">
                        <label for="imageColorURL">Ảnh màu (Image Color URL)</label>
                        <input type="text" id="imageColorURL" name="imageColorURL" />
                    </div>

                    <div class="form-buttons">
                        <button type="submit" class="add-button">Thêm sản phẩm</button>
                        <a href="admin-products.jsp" class="cancel-button">Hủy</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>