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
                <h1 style="font-family: 'Montserrat-Regular';">QUẢN LÝ TÀI KHOẢN ADMIN</h1>
            </div>
            <!-- Danh sách sản phẩm -->
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Họ và tên</th>
                            <th>Email</th>
                            <th>Mật khẩu</th>
                            <th>Điện thoại</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dữ liệu sản phẩm sẽ được thêm vào đây -->
                        <tr>
                            <td>1</td>
                            <td>Tạ Ngọc Tài</td>
                            <td>tangoctai2004@icloud.com</td>
                            <td>123456</td>
                            <td>0969259650</td>
                            <td><button class="edit-button">Sửa</button> | <button class="delete-button">Xóa</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </body>
</html>
