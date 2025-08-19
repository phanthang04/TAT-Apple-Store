<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User currentUser = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hồ sơ người dùng</title>
    <link href="assets/headerr.css" rel="stylesheet" type="text/css"/>
    <link href="assets/user-profile.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div>
        <div class="container">
            <div class="card">
                <!-- Avatar và tên -->
                <div class="avatar-wrapper">
                    <img src="https://cdn-icons-png.flaticon.com/512/6596/6596121.png" alt="Avatar">
                    <div class="username"><%= user.getFullName() %></div>
                </div>

                <!-- Form -->
                <form action="userupdatedetail" method="post">
                    <label class="form-label" for="fullname">Họ và tên</label>
                    <input type="text" class="form-control" name="fullname" id="fullname"
                           value="<%= user.getFullName() %>" required>

                    <label class="form-label" for="email">Email (không thay đổi)</label>
                    <input type="email" class="form-control" name="email" id="email"
                           value="<%= user.getEmail() %>" readonly>

                    <label class="form-label" for="phone">Số điện thoại</label>
                    <input type="text" class="form-control" name="phone" id="phone"
                           value="<%= user.getPhone() != null ? user.getPhone() : "" %>">

                    <label class="form-label" for="address">Địa chỉ</label>
                    <input type="text" class="form-control" name="address" id="address"
                           value="<%= user.getAddress() != null ? user.getAddress() : "" %>">

                    <div class="d-grid">
                        <button type="submit" class="btn-black" style="font-family: 'Montserrat', sans-serif; font-size: 13px">Cập nhật thông tin</button>
                    </div>
                </form>

                <div class="text-center mt-3" style="margin-top: 20px;">
                    <a href="change-password.jsp" class="btn-black">Đổi mật khẩu</a>
                </div>
            </div>
        </div>
    </div>                      
    <%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>