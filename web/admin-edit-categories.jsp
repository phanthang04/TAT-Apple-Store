<%-- 
    Document   : admin-products
    Created on : 17 thg 5, 2025, 20:13:38
    Author     : tnteheh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Category"%>
<%
    Category c = (Category) request.getAttribute("category");
    if (c == null) {
        response.sendRedirect("admin-categories");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap" rel="stylesheet">
    <link href="assets/admin-products.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin-dashboard.css" rel="stylesheet" type="text/css"/>
    <link href="assets/admin-edit-products.css" rel="stylesheet" type="text/css"/>
    <title>Sửa Danh Mục</title>
</head>
<body>
    <div class="container">
        <%@ include file="admin-navbar-left.jsp" %>

        <!-- Main Content -->
        <div class="main-content">
            <%@ include file="admin-header.jsp" %>
            <div class="header-title">
                <h1 style="font-family: 'Montserrat-Regular';">SỬA DANH MỤC</h1>
            </div>
            <!-- Edit Category Form -->
            <div class="edit-product-form">
                <form action="update-category" method="post">
                    <input type="hidden" name="id" value="<%= c.getCategoryID() %>">
                    <div class="form-group">
                        <label for="categories-name">Tên danh mục</label>
                        <input type="text" id="categories-name" name="name" value="<%= c.getCategoryName() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Mô tả</label>
                        <textarea id="description" name="description" required><%= c.getDescription() %></textarea>
                    </div>
                    <div class="form-buttons">
                        <button type="submit" class="edit-button">Sửa</button>
                        <a href="admin-categories" class="cancel-button">Hủy</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>