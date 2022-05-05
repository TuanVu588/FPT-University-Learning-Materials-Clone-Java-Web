/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dal.AccountDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Role;
import model.user;

/**
 *
 * @author Vi Tuan Vu
 */
public class AccountManagement extends HttpServlet {

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
            out.println("<title>Servlet AccountManagement</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountManagement at " + request.getContextPath() + "</h1>");
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
        AccountDB db = new AccountDB();
        List<user> listU = db.getAllUser();
        listU.remove(0);
        for (user u : listU) {
            u.setRu(db.getRolebyUser(u));
        }
        request.setAttribute("listU", listU);
        ArrayList<Role> listR = new AccountDB().getRoles();
        listR.remove(2);
        request.setAttribute("listR", listR);
        request.getRequestDispatcher("admin.jsp").forward(request, response);     
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
        response.setContentType("text/html;charset=UTF-8");
        int userid = Integer.parseInt(request.getParameter("userID"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int roleSel = Integer.parseInt(request.getParameter("roleSel"));
        boolean status = request.getParameter("statusSel").equals("1");
        user u = new user(userid, username, password, status);
        AccountDB db = new AccountDB();
        int check1 = db.updateRole(roleSel, userid);
        int check2 = db.updateUser(u);
        String output="Update "+username+" Failed"; 
        if(check1>0||check2>0){
            output = "Update "+username+" Successfully";
        }
        request.getSession().setAttribute("output", output);
        response.sendRedirect("accManage");
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
