/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import java.sql.SQLException;
import java.util.ArrayList;
import model.curriculum;
import model.subject;

/**
 *
 * @author lemir
 */
public class CurriculumDAO extends DAO {

    public ArrayList<subject> getSubjectbyCurriculum(String id) {
        ArrayList<subject> list = new ArrayList<>();
        try {
            String sql = "SELECT * from Subject join Curr_Sub on Subject.SubCode = Curr_Sub.SubCode where CurrID=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
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
        return list;
    }

    public ArrayList<curriculum> getCurriculum() {
        ArrayList<curriculum> list = new ArrayList<>();
        try {
            String sql = "SELECT * from Curriculum";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                curriculum s = new curriculum();
                s.setCurrID(rs.getString(1));
                s.setCurrName(rs.getString(2));
                s.setCurrDesc(rs.getString(3));
                s.setTotalCredit(rs.getInt(4));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }
    
    public curriculum getCurriculum(String id) {
        curriculum s = new curriculum();
        try {           
            String sql = "SELECT * from Curriculum where CurrID=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {               
                s.setCurrID(rs.getString(1));
                s.setCurrName(rs.getString(2));
                s.setCurrDesc(rs.getString(3));
                s.setTotalCredit(rs.getInt(4));
            }
        } catch (SQLException e) {

        }
        return s;
    }

    public void addCurriculum(curriculum c, String[] subject) {
        try {
            String sql = "INSERT INTO Curriculum VALUES(?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getCurrID());
            ps.setString(2, c.getCurrName());
            ps.setString(3, c.getCurrDesc());
            ps.setInt(4, c.getTotalCredit());
            ps.executeUpdate();
            for (int i = 0; i < subject.length; i++) {
                insertCurrSub(c.getCurrID(), subject[i]);
            }
        } catch (SQLException e) {

        }
    }

    public void deleteCurriculum(String currid) {
        try {
            String sql = "Delete from Curriculum where CurrID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, currid);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateCurriculum(curriculum c) {
        try {
            String sql = "UPDATE [dbo].[Curriculum]\n"
                    + "   SET [CurrName] = ?\n"
                    + "      ,[CurrDesc] = ?\n"
                    + "      ,[TotalCredit] = ?\n"
                    + " WHERE [CurrID] = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getCurrName());
            ps.setString(2, c.getCurrDesc());
            ps.setInt(3, 148);
            ps.setString(6, c.getCurrID());
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }
    public void insertCurrSub(String SubCode, String CurrID){
        try {
            String sql = "INSERT INTO Curr_Sub VALUES(?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, CurrID);
            ps.setString(2, SubCode);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }
    public void insertPreRequisite(String SubCode, String Pre){
        try {
            String sql = "INSERT INTO SubNeedToLearn VALUES(?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, Pre);
            ps.setString(2, SubCode);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }
}
