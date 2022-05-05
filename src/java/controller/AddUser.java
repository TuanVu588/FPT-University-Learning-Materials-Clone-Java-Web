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
 * @author lemir
 */
public class AddUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("accManage");
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountDB db = new AccountDB();
        String output = "Add " + username + " Failed";
        if (!request.getParameter("roleSel").equals("")) {
            int role = Integer.parseInt(request.getParameter("roleSel"));

            if (!db.isExisitedUser(username)) {
                user u = new user();
                u.setUsername(username);
                u.setPassword(password);
                int result = db.insertUser(u);
                db.insertRoleUser(db.getUser(username, password).getUserID(), role);
                if (result > 0) {
                    output = "Add " + u.getUsername() + " Successfully";
                }
            }
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
