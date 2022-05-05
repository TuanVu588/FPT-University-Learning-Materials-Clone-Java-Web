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
public class curr_sub {
    private String currID;
    private String subCode;

    public curr_sub(String currID, String subCode) {
        this.currID = currID;
        this.subCode = subCode;
    }
    

    public String getCurrID() {
        return currID;
    }

    public void setCurrID(String currID) {
        this.currID = currID;
    }

    public String getSubCode() {
        return subCode;
    }

    public void setSubCode(String subCode) {
        this.subCode = subCode;
    }

 
}
