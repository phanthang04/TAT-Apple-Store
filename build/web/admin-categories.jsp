<%-- 
    Document   : admin-products
    Created on : 17 thg 5, 2025, 20:13:38
    Author     : tnteheh
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/admin-products.css" rel="stylesheet" type="text/css"/>
        <link href="assets/admin-dashboard.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
        <%@ include file="admin-navbar-left.jsp" %>

        <!-- Main Content -->
        <div class="main-content">
            <%@ include file="admin-header.jsp" %>
            <div class="header-title">
                <h1 style="font-family: 'Montserrat-Regular';">QUẢN LÝ DANH MỤC - CATEGORIES</h1>
            </div>
            <div>
                <a href="admin-add-categories.jsp" class="add-product-button">Thêm danh mục</a>
            </div>
            <!-- Danh sách sản phẩm -->
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên danh mục</th>
                            <th>Mô tả</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<model.Category> categoryList = (List<model.Category>) request.getAttribute("categoryList");
                            if (categoryList != null) {
                                for (model.Category c : categoryList) {
                        %>
                            <tr>
                                <td><%= c.getCategoryID() %></td>
                                <td><%= c.getCategoryName() %></td>
                                <td><%= c.getDescription() %></td>
                                <td>
                                    <a href="update-category?id=<%= c.getCategoryID() %>" class="edit-button" style="text-decoration: none">Sửa</a> |
                                    <a href="delete-category?id=<%= c.getCategoryID() %>" class="delete-button" style="text-decoration: none" onclick="return confirm('Bạn có chắc muốn xóa danh mục này không?');">Xóa</a>
                                </td>
                            </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </body>
</html>
