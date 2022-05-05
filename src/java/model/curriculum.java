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
public class curriculum {
    private String currID;
    private String currName;
    private String currDesc;
    private String staff;
    private int totalCredit;

    public curriculum() {
    }
    
    public curriculum(String currID, String currName, String currDesc, String staff) {
        this.currID = currID;
        this.currName = currName;
        this.currDesc = currDesc;
        this.staff = staff;
    }
    

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public String getCurrID() {
        return currID;
    }

    public void setCurrID(String currID) {
        this.currID = currID;
    }

    public String getCurrName() {
        return currName;
    }

    public void setCurrName(String currName) {
        this.currName = currName;
    }

    public String getCurrDesc() {
        return currDesc;
    }

    public void setCurrDesc(String currDesc) {
        this.currDesc = currDesc;
    }

    public int getTotalCredit() {
        return totalCredit;
    }

    public void setTotalCredit(int totalCredit) {
        this.totalCredit = totalCredit;
    }

    @Override
    public String toString() {
        return "curriculum{" + "currID=" + currID + ", currName=" + currName + ", currDesc=" + currDesc + ", totalCredit=" + totalCredit + '}';
    }

   
}
