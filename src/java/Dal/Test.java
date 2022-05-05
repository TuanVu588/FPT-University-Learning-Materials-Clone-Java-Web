/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import java.util.ArrayList;
import model.Role;
import model.curriculum;
import model.subject;
import model.user;

/**
 *
 * @author lemir
 */
public class Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SubjectDB db = new SubjectDB();
        CurriculumDAO dbc = new CurriculumDAO();
        AccountDB dbu = new AccountDB();
        subject s = new subject();
        s = db.getSubjectByCode("VOV124");
//        ArrayList<curriculum> c = dbc.getCurriculum();
//        System.out.println(s.getSubPreFor());    
//        System.out.println(db.getPreFor("VOV124"));
//        for (curriculum object : c) {
//            System.out.println(object);
//        }
//        System.out.println(dbu.getUser("admin", "admin"));
//        for (user object : dbu.getAllUser()) {
//            System.out.println(object.getUsername());
//        }
//        System.out.println(dbu.getUser("admin", "admin"));
//        user u = new user();
//        u.setUsername("user1");
//        u.setPassword("user");
//        dbu.insertUser(u);
          System.out.println(dbu.deleteUser(38));
    }
    
}
