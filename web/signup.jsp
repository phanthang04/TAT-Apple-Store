<%-- 
    Document   : signup
    Created on : 17 thg 5, 2025, 18:00:00
    Author     : tnteheh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="assets/login.css"/>
    <title>Sign Up - TAT Apple</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="main-container">
    <div class="container">
        <div class="image-container">
            <img src="https://www.digibox.com.vn/_nuxt/img/login.89bd579.png" alt="Hình ảnh minh họa">
        </div>
        <div class="login-box">
            <form action="register" method="post">
                <div class="login-header">
                    <h2>Tạo tài khoản</h2>
                    <a href="login.jsp" class="login-link" style="font-size: 14px; color: rgb(55,55,55);">Đã có tài khoản? Đăng nhập</a>
                </div>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
                <% } %>
                <div class="input-group">
                    <i class="fa fa-user"></i>
                    <input type="text" name="fullname" placeholder="Họ và tên" required>
                    <span class="message"></span>
                </div>
                <div class="input-group">
                    <i class="fa fa-envelope"></i>
                    <input type="email" name="email" placeholder="Email" required>
                    <span class="message"></span>
                </div>
                <div class="input-group">
                    <i class="fa fa-phone"></i>
                    <input type="text" name="phone" placeholder="Số điện thoại">
                    <span class="message"></span>
                </div>
                <div class="input-group">
                    <i class="fa fa-map-marker"></i>
                    <input type="text" name="address" placeholder="Địa chỉ">
                    <span class="message"></span>
                </div>
                <div class="input-group">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="password" placeholder="Mật khẩu" required>
                    <span class="message"></span>
                </div>
                <div class="input-group">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="confirm_password" placeholder="Xác nhận mật khẩu" required>
                    <span class="message"></span>
                </div>
                <button class="btn-login">Tạo tài khoản</button>
                <div class="or">Hoặc</div>
                <button class="btn-google" type="button">
                    <img src="https://speedshop.oss-cn-shanghai.aliyuncs.com/static/images/google.png" width="20" alt="Google">
                    Đăng ký với Google
                </button>
                <button class="btn-google" type="button">
                    <img src="https://speedshop.oss-cn-shanghai.aliyuncs.com/static/images/facebook.png" width="20" alt="Facebook">
                    Đăng ký với Facebook
                </button>
            </form>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>