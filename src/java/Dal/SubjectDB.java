/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import model.material;
import model.session;
import model.subject;
import model.subneedtolearn;

/**
 *
 * @author lemir
 */
public class SubjectDB extends DAO {

    public ArrayList<String> getPre(String code) {
        ArrayList<String> list = new ArrayList<>();
        try {
            sql = "Select * from [SubNeedToLearn] where SubCode = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, code);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<String> getPreFor(String code) {
        ArrayList<String> list = new ArrayList<>();
        try {
            sql = "Select SubCode from [SubNeedToLearn] where [PreRequitesite] = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, code);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("SubCode"));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<subject> getSubjectsByName(String name) {
        ArrayList<subject> list = new ArrayList<>();
        if (name != "") {
            try {
                String sql = "SELECT * from Subject where SubName like ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + name + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    subject s = new subject();
                    s.setSubCode(rs.getString("SubCode"));
                    s.setSubName(rs.getString("SubName"));
                    s.setSubDesc(rs.getString("SubDesc"));
                    list.add(s);
                }
            } catch (SQLException e) {
            }
        }
        return list;
    }

    public subject getSubjectByCode(String code) {
        subject s = new subject();
        try {
            String sql = "SELECT * from Subject where SubCode = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, code);
            rs = ps.executeQuery();
            if (rs.next()) {
                s.setSubCode(rs.getString("SubCode"));
                s.setSubName(rs.getString("SubName"));
                s.setSubDesc(rs.getString("SubDesc"));
                s.setSubPre(getPre(rs.getString("SubCode")));
            }
        } catch (Exception e) {

        }
        return s;
    }

    public ArrayList<subject> getSubjectsByCode(String code) {
        ArrayList<subject> list = new ArrayList<>();
        if (code != "") {
            try {
                String sql = "SELECT * from Subject where SubCode like ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + code + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    subject s = new subject();
                    s.setSubCode(rs.getString("SubCode"));
                    s.setSubName(rs.getString("SubName"));
                    s.setSubDesc(rs.getString("SubDesc"));
                    list.add(s);
                }
            } catch (SQLException e) {
            }
        }
        return list;
    }

    public ArrayList<subject> getSubjects() {
        ArrayList<subject> list = new ArrayList<>();
        try {
            String sql = "SELECT * from Subject";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                subject s = new subject();
                s.setSubCode(rs.getString("SubCode"));
                s.setSubName(rs.getString("SubName"));
                s.setSubDesc(rs.getString("SubDesc"));
//                s.setSubPre(getPre(rs.getString("SubCode")));
//                s.setSubPreFor(getPreFor(rs.getString("SubCode")));
                list.add(s);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<session> getSessionOfSubject(String name) {
        ArrayList<session> list = new ArrayList<>();
        try {
            String sql = "SELECT * from Session where SubCode LIKE ? order by SessID asc";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                session s = new session();
                s.setSubCode(rs.getString("SubCode"));
                s.setTopic(rs.getString("Topic"));
                s.setSessID(rs.getInt("SessID"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public ArrayList<material> getMaterial(String name) {
        ArrayList<material> list = new ArrayList<>();
        try {
            String sql = "SELECT * from Material where SubCode LIKE ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                material m = new material();
                m.setSubCode(rs.getString("SubCode"));
                m.setMaterialDesc(rs.getString("MaterialDesc"));
                m.setForTeacher(rs.getBoolean("ForTeacher"));
                list.add(m);
            }
        } catch (SQLException e) {

        }
        return list;
    }

}
