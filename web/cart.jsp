<%-- 
    Document   : cart
    Created on : 17 thg 5, 2025, 18:47:52
    Author     : tnteheh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/cart.css" rel="stylesheet" type="text/css"/>
        <title>Giỏ hàng</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <main>
            <div class="container">
                <h2 class="title">Giỏ hàng của bạn</h2>
                <form action="CartServlet" method="post">
                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th style="display: none;">ID Giỏ hàng</th>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                        List<model.Cart> cartList = (List<model.Cart>) request.getAttribute("cartList");
                        int index = 0;
                        int total = 0;
                        if (cartList != null) {
                            for (model.Cart item : cartList) {
                                int itemTotal = (int)(item.getPrice() * item.getCount());
                                total += itemTotal;
                    %>
                    <tr>
                        <td style="display: none;"><%= item.getCartId()%></td>
                        <td><%= item.getProductName() %></td>
                        <td><%= String.format("%,.0f VND", item.getPrice()) %></td>
                        <td>
                            <input type="number" name="quantity_<%= index %>" value="<%= item.getCount() %>" min="1">
                        </td>
                        <td><%= String.format("%,d VND", itemTotal) %></td>
                        <td>
    <a href="delete?action=remove&cartID=<%= item.getCartId()%>" class="remove-btn">Xóa</a>
</td>
                    </tr>
                    <%
                                index++;
                            }
                        }
                    %>
                </tbody>

                    </table>
                    <div class="cart-total">
                        <span>Tổng cộng:</span>
                        <span><%= String.format("%,d VND", total) %></span>
                    </div>

                    <button type="submit" name="action" value="checkout" class="checkout-btn">Thanh toán</button>
                </form>
            </div>
        </main>
        <%@ include file="footer.jsp" %>
    </body>
</html>
