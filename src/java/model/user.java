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
public class user {
    private int userID;
    private String username;
    private String password;
    private boolean status;
    private Role_User ru;
    private int role;

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Role_User getRu() {
        return ru;
    }

    public void setRu(Role_User ru) {
        this.ru = ru;
    }

    public String getPassword() {
        return password;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public user() {
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public user(int userID, String username, String password, boolean status) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public String getUsername() {
        return username;
    }

    @Override
    public String toString() {
        return "user{" + "userID=" + userID + ", username=" + username + ", password=" + password + ", status=" + status + ", role=" + role + '}';
    }



    
}
