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
import dal.CartDAO;

/**
 *
 * @author phant
 */
@WebServlet(name = "delete", urlPatterns = {"/delete"})
public class delete extends HttpServlet {

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
            out.println("<title>Servlet delete</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet delete at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if ("remove".equals(action)) {
            String cartIDStr = request.getParameter("cartID");
            if (cartIDStr != null) {
                try {
                    int cartID = Integer.parseInt(cartIDStr.trim());
                    CartDAO cartDAO = new CartDAO();
                    boolean success = cartDAO.deleteProduct(cartID); // Giả sử có phương thức deleteCart
                    if (success) {
                        response.sendRedirect("CartServlet");
                    } else {
                        request.setAttribute("error", "Xóa thất bại!");
                        request.getRequestDispatcher("CartServlet").forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "ID giỏ hàng không hợp lệ!");
                    request.getRequestDispatcher("CartServlet").forward(request, response);
                }
            } else {
                request.setAttribute("error", "ID giỏ hàng không được cung cấp!");
                request.getRequestDispatcher("CartServlet").forward(request, response);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
