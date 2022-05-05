/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Role;
import model.Role_User;
import model.user;

/**
 *
 * @author lemir
 */
public class AccountDB extends DAO {

    public user getUser(String username, String password) {
        user u = new user();
        try {
            sql = "Select * from [User] where UserName =? and Password =?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                u.setUserID(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setStatus(rs.getBoolean(4));
                u.setRole(getRolebyUser(u).getRoleId());
                u.setRu(getRolebyUser(u));
            }
        } catch (SQLException e) {
        }
        return u;
    }
    
    public boolean isExisitedUser(String username) {
        boolean check = false;              
        try {
            sql = "Select * from [User] where UserName =?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } catch (SQLException e) {
        }
        return check;
    }

    public ArrayList<Role> getRoles() {
        ArrayList<Role> list = new ArrayList<>();
        try {
            sql = "Select * from [Role]";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(1));
                r.setRoleName(rs.getString(2));
                list.add(r);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Role_User getRolebyUser(user s) {
        Role_User ru = new Role_User();
        try {
            sql = "Select * from [Role_User] where UserId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, s.getUserID());
            rs = ps.executeQuery();
            if (rs.next()) {
                ru = new Role_User(rs.getInt(1), rs.getInt(2));
            }
        } catch (SQLException e) {
        }
        return ru;
    }
    
    public int getRoleUser(int id) {
        int role = 0;
        try {
            sql = "Select * from [Role_User] where UserId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                role = rs.getInt("RoleID");
            }
        } catch (SQLException e) {
        }
        return role;
    }

    public ArrayList<user> getStaff() {
        ArrayList<user> list = new ArrayList<>();
        try {
            sql = " Select * from [User] inner join [Role_User] on [User].UserId = [Role_User].UserId where RoleId = 4";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                user s = new user();
                s.setUserID(rs.getInt("UserId"));
                s.setUsername(rs.getString("UserName"));
                s.setPassword(rs.getString("Password"));
                s.setStatus(rs.getBoolean("Status"));
                list.add(s);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<user> getAllUser() {
        ArrayList<user> users = new ArrayList<>();
        try {
            sql = "select * from [User] join [Role_User] on [User].UserID=Role_User.UserID";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                user u = new user();
                u.setUserID(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setStatus(rs.getBoolean(4));
                users.add(u);
            }
        } catch (SQLException e) {
        }
        return users;
    }

    public user getUserById(int id) {
        user u = new user();
        try {
            sql = "select * from [User] where UserId =?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                u.setUserID(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setStatus(rs.getBoolean(4));
            }
        } catch (SQLException e) {
        }
        return u;
    }

    public int updateUser(user u) {
        int result = 0;
        try {
            sql = "update [User] SET UserName=?,Password=?,Status=? where [UserID]=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setBoolean(3, u.isStatus());
            ps.setInt(4, u.getUserID());
            result = ps.executeUpdate();
        } catch (SQLException e) {
        }
        return result;
    }
    
    public int updateRole(int role, int userid){
        int result = 0;
        try {
            sql = "update [Role_User] SET RoleID=? where [UserID]=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, role);
            ps.setInt(2, userid);
            result = ps.executeUpdate();
        } catch (SQLException e) {
        }
        return result;
    }

    public int deleteUser(int id) {
        int result = 0;
        try {
            sql = "delete from [User] where UserId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate();
        } catch (SQLException e) {
        }
        return result;
    }

    public int insertUser(user u) {
        int result = 0;
        try {
            sql = "insert into [User](UserName,Password,Status) values(?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setBoolean(3, true);
            result = ps.executeUpdate();
        } catch (SQLException e) {
        }
        return result;
    }
    
    public void insertRoleUser(int userid, int roleid) {
        try {
            sql = "insert into [Role_User](UserId, RoleId) values(?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, roleid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {

    }

}
