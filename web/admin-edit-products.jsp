<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%
    int productID = Integer.parseInt(request.getParameter("productID"));
    ProductDAO productDAO = new ProductDAO();
    Product product = productDAO.getProductById(productID);
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap" rel="stylesheet">
    <link href="assets/admin-products.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin-dashboard.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin-edit-products.css" rel="stylesheet" type="text/css"/>
    <title>Sửa Sản Phẩm</title>
</head>
<body>
    <div class="container">
        <%@ include file="admin-navbar-left.jsp" %>

        <!-- Main Content -->
        <div class="main-content">
            <%@ include file="admin-header.jsp" %>
            <div class="header-title">
                <h1 style="font-family: 'Montserrat-Regular';">SỬA SẢN PHẨM</h1>
            </div>
            <!-- Edit Product Form -->
            <div class="edit-product-form">
                <form action="update-product" method="POST">
                    <input type="hidden" name="productID" value="<%=product.getProductID()%>">

                    <div class="form-group">
                        <label for="productName">Tên sản phẩm</label>
                        <input type="text" id="productName" name="productName" value="<%=product.getProductName()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="brandID">Thương hiệu (Brand ID)</label>
                        <input type="number" id="brandID" name="brandID" value="<%=product.getBrandID()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="categoryID">Danh mục (Category ID)</label>
                        <input type="number" id="categoryID" name="categoryID" value="<%=product.getCategoryID()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="basePrice">Giá (VND)</label>
                        <input type="number" id="basePrice" name="basePrice" step="0.01" value="<%=product.getBasePrice()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="description">Mô tả</label>
                        <textarea id="description" name="description" rows="4" required><%=product.getDescription()%></textarea>
                    </div>

                    <div class="form-group">
                        <label for="imageURL">Ảnh sản phẩm (Image URL)</label>
                        <input type="text" id="imageURL" name="imageURL" value="<%=product.getImageURL()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="imageColorURL">Ảnh màu (Image Color URL)</label>
                        <input type="text" id="imageColorURL" name="imageColorURL" value="<%=product.getImageColorURL()%>">
                    </div>

                    <div class="form-buttons">
                        <button type="submit" class="save-button">Lưu</button>
                        <a href="admin-products.jsp" class="cancel-button">Hủy</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>