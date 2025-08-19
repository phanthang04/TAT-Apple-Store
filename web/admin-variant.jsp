<%-- 
    Document   : admin-products
    Created on : 17 thg 5, 2025, 20:13:38
    Author     : tnteheh
--%>

<%@page import="java.util.List"%>
<%@page import="model.ProductVariant"%>
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
                <h1 style="font-family: 'Montserrat-Regular';">QUẢN LÝ PHIÊN BẢN SẢN PHẨM</h1>
            </div>
            <div>
                <a href="admin-add-variant.jsp" class="add-product-button">Thêm phiên bản</a>
            </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>ID sản phẩm</th>
                            <th>Phiên bản</th>
                            <th>Giá</th>
                            <th>Số lượng còn</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>                
                    <tbody>
                    <%
                        List<ProductVariant> variants = (List<ProductVariant>) request.getAttribute("variants");
                        if (variants != null) {
                            for (ProductVariant v : variants) {
                    %>
                                <tr>
                                    <td><%= v.getVariantId() %></td>
                                    <td><%= v.getProductId() %></td>
                                    <td><%= v.getCapacity() %></td>
                                    <td><%= String.format("%,.0f", v.getPrice()) %></td>
                                    <td><%= v.getStock() %></td>
                                    <td>
                                        <a href="update-variant?id=<%= v.getVariantId() %>" class="edit-button" style="text-decoration: none">Sửa</a> |
                                        <a href="delete-variant?id=<%= v.getVariantId() %>" class="delete-button" style="text-decoration: none" onclick="return confirm('Bạn có chắc chắn muốn xóa phiên bản này không?');">Xóa</a>
                                    </td>
                                </tr>
                    <%
                            }
                        } else {
                    %>
                            <tr><td colspan="6">Không có dữ liệu</td></tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </body>
</html>
