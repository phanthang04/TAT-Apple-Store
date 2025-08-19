<%-- 
    Document   : login
    Created on : 17 thg 5, 2025, 17:35:30
    Author     : tnteheh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="assets/login.css"/>
    <title>Login - TAT Apple</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="main-container">
    <div class="container">
        <div class="image-container">
            <img src="https://www.digibox.com.vn/_nuxt/img/login.89bd579.png" alt="Hình ảnh minh họa">
        </div>
        <div class="login-box">
            <form action="login" method="post">
                <div class="login-header">
                    <h2>Đăng nhập</h2>
                    <a href="signup.jsp" class="login-link" style="font-size: 14px; color: rgb(55,55,55);">Tạo tài khoản</a>
                </div>
                <div class="input-group">
                    <i class="fa fa-user"></i>
                    <input type="email" name="email" placeholder="Email" required>
                    <span class="message"></span>
                </div>
                <div class="input-group">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="password" placeholder="Mật Khẩu" required>
                    <span class="message"></span>
                </div>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
                <% } %>
                <a href="#" class="forgot-password">Quên mật khẩu?</a>
                <button class="btn-login">Đăng nhập</button>
                <div class="or">Hoặc</div>
                <button class="btn-google" type="button">
                    <img src="https://speedshop.oss-cn-shanghai.aliyuncs.com/static/images/google.png" width="20" alt="Google">
                    Đăng nhập với Google
                </button>
                <button class="btn-google" type="button">
                    <img src="https://speedshop.oss-cn-shanghai.aliyuncs.com/static/images/facebook.png" width="20" alt="Facebook">
                    Đăng nhập với Facebook
                </button>
            </form>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>