<%@page import="dal.CategoriesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.CategoriesDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>

<%
    // Lấy danh sách danh mục từ database
    CategoriesDAO categoryDAO = new CategoriesDAO();
    List<Category> categories = categoryDAO.getAllCategories();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/headerr.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
        <title>TAT Apple - Đại lý uỷ quyền Apple</title>
        <style>
            .menu-tieu-de a {
                pointer-events: auto;
                z-index: 10;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="header-warning">
                <p class="header-warning_text">
                    ‼️ Siêu hạ giá. Siêu nhiều ưu đãi. Tìm hiểu thêm về TAT Apple tránh giả mạo <a href="infor-tatapple.jsp">tại đây.</a>
                </p>
            </div>
            <div class="header-bar">
                <div class="header-bar-logo">
                    <a href="home"><img style="width: 250px" src="images/Logo.jpg"></a>
                </div>
                <div class="header-bar_search">
                    <form action="search" method="get">
                        <button type="submit" style="display: none;"></button>
                        <input type="text" class="search" name="keyword" placeholder="Tìm kiếm sản phẩm tại TAT Apple...">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </form>
                </div>
                <div class="icon-user">
                    <a style="color: black">
                        <i class="fa-solid fa-user"></i>
                    </a>
                    <ul class="header-user">
                        <div class="header-user_header">
                            <h3><%= (user != null) ? ("Xin chào, " + user.getFullName()) : "Xin chào" %></h3>
                        </div>
                        <hr/>
                        <% if (user == null) { %>
                            <div class="user-before-login">
                                <li class="header-user_item">
                                    <a href="login.jsp">Đăng nhập</a>
                                </li>
                                <li class="header-user_item">
                                    <a href="signup.jsp">Đăng ký</a>
                                </li>
                            </div>
                        <% } else { %>
                            <div class="user-after-login">
                                <li class="header-user_item">
                                    <a href="user-profile.jsp">Thông tin cá nhân</a>
                                </li>
                                <li class="header-user_item">
                                    <a href="logout">Đăng xuất</a>
                                </li>
                            </div>
                        <% } %>
                    </ul>
                </div>
                <div class="header-bar_cart">
                    <a href="CartServlet" style="color: black"><i class="fa-solid fa-cart-shopping"></i></a>
                </div>
            </div>
            <ul class="menu-tieu-de">
                <%
                    for (Category category : categories) {
                %>
                <li style="width: 200px">
                    <a href="productServlet?categoryId=<%= category.getCategoryID() %>">
                        <%= category.getCategoryName() %>
                    </a>
                </li>
                <%
                    }
                %>
                <li style="width: 200px">
                    <a href="infor-tatapple.jsp">Tìm hiểu thêm</a>
                </li>
            </ul>
            <hr>
        </header>
    </body>
</html>