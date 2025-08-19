<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đổi mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .card {
            border-radius: 12px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        .form-control {
            background-color: #fafafa;
            border: 1px solid #ccc;
        }
        .btn-submit {
            background-color: #333;
            color: #fff;
            border-radius: 50px;
        }
        .btn-submit:hover {
            background-color: #555;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card p-4">
                <h4 class="mb-4 text-center">Đổi mật khẩu</h4>
                <%
                    String error = (String) request.getAttribute("error");
                    String success = (String) request.getAttribute("success");

                    if (error != null) {
                %>
                    <div style="color: red; text-align: center; margin-bottom: 15px;"><%= error %></div>
                <%
                    }

                    if (success != null) {
                %>
                    <div style="color: green; text-align: center; margin-bottom: 15px;"><%= success %></div>
                <%
                    }
                %>
                <form action="change-password" method="post">
                    <div class="mb-3">
                        <label for="oldPassword" class="form-label">Mật khẩu cũ</label>
                        <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
                    </div>
                    <div class="mb-3">
                        <label for="newPassword" class="form-label">Mật khẩu mới</label>
                        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                    </div>
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-submit">Xác nhận</button>
                    </div>
                </form>
                <div class="text-center mt-3">
                    <a href="user-profile.jsp">← Trở về hồ sơ</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>