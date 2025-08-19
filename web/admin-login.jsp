<%-- 
    Document   : admin login
    Created on : 17 thg 5, 2025, 17:35:30
    Author     : tnteheh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/login.css"/>
        <title>Login Admin - TAT Apple</title>
    </head>
    <body>
        <div class="main-container">
            <div class="container">
                <div class="image-container">
                    <img src="https://www.digibox.com.vn/_nuxt/img/login.89bd579.png" alt="Hình ảnh minh họa">
                </div>
                <div class="login-box">
                    <form action="AdminLoginServlet" method="post">
                        <div class="login-header">
                            <h2 style="text-align: center">Đăng nhập tài khoản ADMIN - TAT Apple</h2>
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
                        <button class="btn-login">Đăng nhập</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>