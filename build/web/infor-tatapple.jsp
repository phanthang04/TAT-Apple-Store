<%-- 
    Document   : infor-tatapple
    Created on : 17 thg 5, 2025, 17:50:37
    Author     : tnteheh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        main{
            margin: 0;
            padding: 0;
        }
        .infor{
            margin: 30px 60px 100px 60px;
            font-family: Montserrat, sans-serif;
            line-height: 2;
        }
        .infor p{
            margin-top: 30px;
        }
    </style>
    <body>
        <%@ include file="header.jsp" %>
        <main>
        <div class="banner-infor">
            <img style="width: 100%; height: 70vh" src="images/Banner-thong-tin-tataple.jpg"/>
        </div>
        <div class="infor">
            <div class="text-box">
                <p>
                    <span>
                      Website <strong>www.tatapple.com.vn</strong> được vận hành bởi Công ty TNHH Mapple Mitra Adiperka Việt Nam với mã số đăng ký
                      doanh nghiệp 0969259650 với địa chỉ đăng ký công ty tại Tầng 9, Tòa nhà Lim Tower 3, 29A Nguyễn Đình Chiểu,
                      Phường Đa Kao, Quận 1, Thành phố Hồ Chí Minh, Việt Nam.
                    </span>
                </p>
                <p>
                    <span>
                        Tech Apple Trend là chuỗi cửa hàng chuyên cung cấp các sản phẩm, dịch vụ chính hãng của Apple trực thuộc công ty TNHH
                      Mapple Mitra Adiperka Việt Nam. Chuỗi cửa hàng Tech Apple Trend được Apple ủy quyền là nhà phân phối chính thức sản
                      phẩm Apple tại Việt Nam (Apple Authorized Resellers - viết tắt là AAR). Chính vì vậy, khách hàng có thể yên
                      tâm về nguồn gốc xuất xử sản phẩm chính hãng, được nhập khẩu chính ngạch và đồng thời được trải nghiệm dịch
                      vụ và không gian mua sắm theo tiêu chuẩn toàn cầu của Apple.
                    </span>
                </p>
                <p>
                    <span>
                        Tất cả sản phẩm iPhone, iPad, Macbook và phụ kiện Apple tại đây đều là hàng nguyên seal, phân phối chính
                      ngạch trực tiếp bởi Apple (có dán tem niêm phong của Apple), và được Apple quản lý nghiêm ngặt theo mã vạch
                      số serial, số lô IMEI. Tech Apple Trend cam kết không phân phối những sản phẩm đã qua sửa chữa hoặc làm mới, không
                      bán hàng xách tay trôi nổi với nguồn gốc không rõ ràng. Quy định này nhằm đảm bảo tất cả hàng Apple tại
                      Tech Apple Trend đều là hàng chính hãng mới nguyên và bảo vệ quyền lợi khách hàng.
                    </span>
                </p>
            </div>
        </div>
        </main>
        <%@ include file="footer.jsp" %>
    </body>
</html>
