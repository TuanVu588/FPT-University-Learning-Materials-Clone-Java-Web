/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author lemir
 */
public class Role_User {
    private int userId;
    private int roleId;

    public Role_User(int userId, int roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }

    public Role_User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "Role_User{" + "userId=" + userId + ", roleId=" + roleId + '}';
    }
    
}
