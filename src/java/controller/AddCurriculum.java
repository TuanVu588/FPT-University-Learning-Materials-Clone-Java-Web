/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dal.AccountDB;
import Dal.CurriculumDAO;
import Dal.SubjectDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.curriculum;

/**
 *
 * @author lemir
 */
public class AddCurriculum extends HttpServlet {

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
        request.setAttribute("listStaff", db.getStaff());
        SubjectDB dbs = new SubjectDB();
        request.setAttribute("listSubject", dbs.getSubjects());
        request.getRequestDispatcher("formCurriculum.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8;");
        String curriculumCode = request.getParameter("curriculumCode");
        String curriculumName = request.getParameter("curriculumName");
        String staff = request.getParameter("staff");
        String description = request.getParameter("description");
        curriculum c = new curriculum(curriculumCode, curriculumName, description, staff);      
        CurriculumDAO db = new CurriculumDAO();
        String[] listSubject = request.getParameterValues("subject");
        db.addCurriculum(c,listSubject);
        response.sendRedirect("curriculum.jsp");
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
