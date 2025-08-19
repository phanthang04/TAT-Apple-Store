<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%@page import="model.ProductVariant"%>
<%@page import="dal.InforProductDAO"%>

<%
    String productIDParam = request.getParameter("productID");
    Product product = null;
    String baseName = "";
    List<ProductVariant> variants = null;

    if (productIDParam != null) {
        try {
            int productID = Integer.parseInt(productIDParam);
            InforProductDAO dao = new InforProductDAO();
            product = dao.getProductWithVariants(productID);
            if (product != null) {
                baseName = product.getProductName();
                variants = product.getVariants();
            }
        } catch (NumberFormatException e) {
            // lỗi productID không hợp lệ
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>TAT Apple - <%= product != null ? product.getProductName() : "Sản phẩm không tồn tại" %></title>
        <link href="assets/infor-product.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    </head>
    <body style="font-family: Montserrat, sans-serif">
        <%@ include file="header.jsp" %>

        <main>
        <%
            if (product == null) {
        %>
            <h2>Sản phẩm không tồn tại hoặc ID không hợp lệ.</h2>
        <%
            } else {
                ProductVariant defaultVariant = variants != null && !variants.isEmpty() ? variants.get(0) : null;
                String defaultPrice = defaultVariant != null ? String.format("%,.0f", defaultVariant.getPrice()) : "N/A";
                String defaultCapacity = defaultVariant != null ? defaultVariant.getCapacity() : "";
        %>
            <div class="product-name-price">
                <div><h3 id="product-name-header"><%= baseName + " " + defaultCapacity %></h3></div>
                <div><p id="product-price-header" class="product-name-price_price"><%= defaultPrice %> <u>đ</u></p></div>
            </div>
            <hr>
            <div class="container">
                <div class="product-container">
                    <div class="product-image">
                        <img src="<%= product.getImageURL() %>" alt="<%= baseName %>"/>
                    </div>
                    <div class="product-details">
                        <div class="product-details_name" id="product-name-detail" style="margin-bottom: 30px">
                                    <h2 name ="baseName" style="display: inline; font-weight: bold;"><%= baseName %> </h2>
                                    <h2 name ="defaultCapacity" style="display: inline; font-weight: bold;"><%= defaultCapacity %></h2>
                        </div>

                        <div class="product-detail_price" id="product-price-detail" style="margin-bottom: 30px; color: crimson; font-size: 22px; font-weight: bold;">
                            <p name = "defaultPrice"><%= defaultPrice %> <u>đ</u></p>
                        </div>
                        <hr>
                        <div class="product-details_capacity">
                            <h4>Variant</h4>
                            <span class="product-details_capacity_button">
                            <%
                                for (ProductVariant variant : variants) {
                                    String variantPrice = String.format("%,.0f", variant.getPrice());
                            %>
                                <button type="button" class="capacity-button" data-price="<%= variantPrice %>" data-capacity="<%= variant.getCapacity() %>">
                                    <%= variant.getCapacity() %>
                                </button>
                            <%
                                }
                            %>
                            </span>
                        </div>
                        <div class="product-detail_delivery">
                            <span class="product-detail_delivery_item">
                                <i class="fa-solid fa-bag-shopping"></i>
                                <span>Hàng hoá:</span>
                                <span><%= variants.stream().anyMatch(v -> v.getStock() > 0) ? "Còn hàng" : "Hết hàng" %></span>
                            </span>
                        </div>
                        <form id="addToCartForm" action="AddToCartServlet" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                            <input type="hidden" name="variantID" id="selectedVariantID" value="<%= defaultVariant != null ? defaultVariant.getVariantId() : 0 %>">
                            <input type="hidden" name="capacity" id="selectedCapacity" value="<%= defaultCapacity %>">
                            <input type="hidden" name="price" id="selectedPrice" value="<%= defaultVariant != null ? defaultVariant.getPrice() : 0 %>">
                            <button type="submit" class="product-add-cart_btn">Thêm vào giỏ hàng</button>
                        </form>
                    </div>
                </div>
            </div>
             <%
                    String error =(String) request.getAttribute("error");
                       if(error != null){
                     %>
                     <p style="color: red;"> <%= error %> </p>
                     <%
                    }
                 %>
            <div class="container-discribe" style="margin-top: 50px">
                <div class="container-discribe-box">
                    <div class="container-discribe_btn">Mô tả</div>
                </div>
                <div class="container-discribe-box">
                    <div class="container-discribe_detail">
                        <p><%= product.getDescription() %></p>
                    </div>
                </div>
            </div>
        <%
            }
        %>
        </main>

        <%@ include file="footer.jsp" %>
            <%
        Integer userID = (Integer) session.getAttribute("userID");
        if (userID == null) {
            userID = (Integer) request.getAttribute("userID");
        }
    %>
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const capacityButtons = document.querySelectorAll(".capacity-button");
                const priceHeader = document.getElementById("product-price-header");
                const priceDetail = document.getElementById("product-price-detail");
                const nameHeader = document.getElementById("product-name-header");
                const nameDetail = document.querySelector(".product-details_name h2");
                const selectedCapacityInput = document.getElementById("selectedCapacity");
                const selectedPriceInput = document.getElementById("selectedPrice");
                const baseName = "<%= baseName.replace("\"", "\\\"") %>";

                if (capacityButtons.length > 0) {
                    capacityButtons[0].classList.add("active");
                }

                capacityButtons.forEach(button => {
                    button.addEventListener("click", () => {
                        const price = button.getAttribute("data-price");
                        const capacity = button.getAttribute("data-capacity");

                        priceHeader.textContent = price + " đ";
                        priceDetail.textContent = price + " đ";

                        nameHeader.textContent = baseName + " " + capacity;
                        nameDetail.textContent = baseName + " " + capacity;

                        selectedCapacityInput.value = capacity;
                        selectedPriceInput.value = price.replace(/,/g, "");

                        capacityButtons.forEach(btn => btn.classList.remove("active"));
                        button.classList.add("active");
                    });
                });
            });
        </script>
    </body>
</html>