/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dal.SubjectDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.subject;
import model.subneedtolearn;

/**
 *
 * @author lemir
 */
public class SubjectSearch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sub = request.getParameter("subject").trim();
        String type = request.getParameter("name");
        String url = request.getParameter("url");
        SubjectDB db = new SubjectDB();
        subject s = new subject();
        List<subject> list = new ArrayList<>();
        switch (url) {
            case "/PRJ301.SES/syllabus.jsp": {
                if(sub.trim().length() == 0){
                    list = db.getSubjects();
                }else {
                    if (type.contentEquals("name")) {
                        list = db.getSubjectsByName(sub);
                    } else {
                        list = db.getSubjectsByCode(sub);
                    }
                }
                
                request.setAttribute("substr", sub);
                request.setAttribute("list", list);
                request.getRequestDispatcher("syllabus.jsp").forward(request, response);
                break;
            }
            case "/PRJ301.SES/learningpath.jsp": {
                s = db.getSubjectByCode(sub);
                request.setAttribute("sub", s);
                request.setAttribute("isempty", s.getSubPre().isEmpty());
                request.setAttribute("substr", sub);
                request.getRequestDispatcher("learningpath.jsp").forward(request, response);
                break;
            }
            case "/PRJ301.SES/prerequisite.jsp": {
                s = db.getSubjectByCode(sub);
                ArrayList<String> prefor = db.getPreFor(sub);
                request.setAttribute("iempty", prefor.isEmpty());
                request.setAttribute("prefor", prefor);
                request.setAttribute("sub", s);
                request.setAttribute("substr", sub);
                request.getRequestDispatcher("prerequisite.jsp").forward(request, response);
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
