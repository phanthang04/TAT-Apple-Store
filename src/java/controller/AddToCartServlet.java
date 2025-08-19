/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dal.CartDAO;
import dal.InforProductDAO;
import dal.ProductVariantDAO;
import model.Cart;
import model.Product;
import model.ProductVariant;
import java.util.List;
/**
 *
 * @author phant
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    HttpSession session = request.getSession();
    Integer userID = (Integer) session.getAttribute("userID");  
    if (userID == null){
        request.setAttribute("error", "Đăng nhập đi, đừng xem chùa!");
        request.getRequestDispatcher("infor-product.jsp").forward(request, response);
        return;
    }
    if ("add".equals(action)) {
        // Lấy thông tin sản phẩm từ form
        
        String productIdStr = request.getParameter("productID");
        String variantIdStr = request.getParameter("variantID");
        String capacity = request.getParameter("capacity");
        String priceStr = request.getParameter("price");
        
        try {
            int productID = Integer.parseInt(productIdStr);
            int variantID = Integer.parseInt(variantIdStr);
            double price = Double.parseDouble(priceStr);
            
            
            // In ra log để kiểm tra
            System.out.println(userID);
            System.out.println("Product ID: " + productID);
            System.out.println("Variant ID: " + variantID);
            ProductVariantDAO pvdao = new ProductVariantDAO();
            if(pvdao.getVariantById(variantID) != null){
                if(pvdao.getVariantById(variantID).getStock() == 0){
                    request.setAttribute("error", "HẾT HÀNG, MÙ À");
                    request.getRequestDispatcher("infor-product.jsp").forward(request, response);
                    return;
                }
                
            }else{
                request.setAttribute("error", "HẾT HÀNG, MÙ À");
                    request.getRequestDispatcher("infor-product.jsp").forward(request, response);
                    return;
            }
            System.out.println("Capacity: " + capacity);
            System.out.println("Price: " + price);
            InforProductDAO dal = new InforProductDAO();
            Product p = dal.getProductWithVariants(productID);
            String name = p.getProductName();
            Cart c = new Cart(0, userID, name, capacity, price);
            CartDAO cDao = new CartDAO();
            boolean success = cDao.insertCart(c);
            if (success){
                response.sendRedirect("CartServlet");
            }else{
                response.sendRedirect("infor-product.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Xử lý lỗi định dạng
        }
    }

   
}


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
