/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author tnteheh
 */
@WebServlet(name="UpdateProductServlet", urlPatterns={"/update-product"})
public class UpdateProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("admin-products.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8"); // nếu có tiếng Việt
            int productID = Integer.parseInt(request.getParameter("productID"));
            int brandID = Integer.parseInt(request.getParameter("brandID"));
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            double basePrice = Double.parseDouble(request.getParameter("basePrice"));
            String imageURL = request.getParameter("imageURL");
            String imageColorURL = request.getParameter("imageColorURL");

            Product p = new Product(productID, brandID, categoryID, productName, description, basePrice, imageURL, imageColorURL, null);

            ProductDAO dao = new ProductDAO();
            boolean success = dao.updateProduct(p);

            if (success) {
                response.sendRedirect("admin-products.jsp");
            } else {
                request.setAttribute("error", "Cập nhật sản phẩm thất bại!");
                request.getRequestDispatcher("admin-edit-products.jsp?productID=" + productID).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi cập nhật sản phẩm: " + e.getMessage());
            request.getRequestDispatcher("admin-edit-products.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
