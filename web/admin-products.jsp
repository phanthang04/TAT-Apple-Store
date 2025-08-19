<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@ page import="java.text.DecimalFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ProductDAO dao = new ProductDAO();
    List<Product> productList = dao.getAllProducts();
    productList.sort((p1, p2) -> Integer.compare(p1.getProductID(), p2.getProductID()));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin - Products</title>
        <link href="assets/admin-products.css" rel="stylesheet" type="text/css"/>
        <link href="assets/admin-dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
                <%@ include file="admin-navbar-left.jsp" %>

                <!-- Main Content -->
                <div class="main-content">
                    <%@ include file="admin-header.jsp" %>
                <div class="header-title">
                    <h1 style="font-family: 'Montserrat-Regular';">SẢN PHẨM</h1>
                </div>

                <!-- Thêm sản phẩm -->
                <div>
                    <a href="admin-add-products.jsp" class="add-product-button">Thêm sản phẩm</a>
                </div>
                <%
                    String deleteSuccess = request.getParameter("deleteSuccess");
                    if (deleteSuccess != null) {
                        if ("true".equals(deleteSuccess)) {
                %>
                            <div class="success-message" style="color: green; margin-bottom: 20px">Sản phẩm đã được xóa thành công!</div>
                <%
                        } else {
                %>
                            <div class="error-message" style="color: red; margin-bottom: 20px">Lỗi: Không thể xóa sản phẩm!</div>
                <%
                        }
                    }
                %>
                <!-- Bảng danh sách sản phẩm -->
                <div>
                    <table border="1" cellspacing="0" cellpadding="5" style="width: 100%; text-align: center;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Thương hiệu (BrandID)</th>
                                <th>Danh mục (CategoryID)</th>
                                <th>Giá</th>
                                <th>Mô tả</th>
                                <th>Hình ảnh</th>
                                <th>Ảnh màu</th>
                                <th>Ngày tạo</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Product p : productList) {
                            %>
                            <tr>
                                <td><%= p.getProductID() %></td>
                                <td><%= p.getProductName() %></td>
                                <td><%= p.getBrandID() %></td>
                                <td><%= p.getCategoryID() %></td>
                                <td>
                                    <%
                                        DecimalFormat formatter = new DecimalFormat("#,###");
                                        String formattedPrice = formatter.format(p.getBasePrice());
                                    %>
                                    <%= formattedPrice %> đ
                                </td>
                                <td>
                                    <%
                                        String desc = p.getDescription();
                                        if (desc != null) {
                                            if (desc.length() > 50) {
                                                desc = desc.substring(0, 50) + "...";
                                            }
                                        } else {
                                            desc = "";
                                        }
                                    %>
                                    <%= desc %>
                                </td>
                                <td>
                                    <% if (p.getImageURL() != null && !p.getImageURL().isEmpty()) { %>
                                        <img src="<%= p.getImageURL() %>" alt="Image" style="width: 60px; height: 60px;"/>
                                    <% } %>
                                </td>
                                <td>
                                    <% if (p.getImageColorURL() != null && !p.getImageColorURL().isEmpty()) { %>
                                        <img src="<%= p.getImageColorURL() %>" alt="Color Image" style="width: 60px; height: 60px;"/>
                                    <% } %>
                                </td>
                                <td><%= p.getCreatedAt() %></td>
                                <td>
                                    <a href="admin-edit-products.jsp?productID=<%= p.getProductID() %>" class="edit-button" style="display: inline-block;margin-right: 10px;margin-bottom: 5px; text-decoration: none">Sửa</a>
                                    <br>
                                    <a href="#" onclick="confirmDelete('<%= p.getProductID() %>', '<%= p.getProductName() %>');" class="delete-button" style="display: inline-block; text-decoration: none">Xóa</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script>
        function confirmDelete(productID, productName) {
            if (confirm("Bạn có chắc chắn muốn xóa sản phẩm '" + productName + "' không?")) {
                window.location.href = "delete-product?productID=" + productID;
            }
        }
    </script>
</html>