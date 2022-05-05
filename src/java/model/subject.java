/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author lemir
 */
public class subject {
    private String subCode; 
    private String subName;
    private String subDesc;
    private ArrayList<String> subPre = new ArrayList<>();
    private ArrayList<String> subPreFor = new ArrayList<>();

    public ArrayList<String> getSubPreFor() {
        return subPreFor;
    }

    public void setSubPreFor(ArrayList<String> subPreFor) {
        this.subPreFor = subPreFor;
    }
    

    public ArrayList<String> getSubPre() {
        return subPre;
    }

    public void setSubPre(ArrayList<String> subPre) {
        this.subPre = subPre;
    }

    @Override
    public String toString() {
        return "subject{" + "subCode=" + subCode + ", subName=" + subName + ", subDesc=" + subDesc + ", subPre=" + subPre + ", subPreFor=" + subPreFor + '}';
    }



    public subject(String subCode, String subName, String subDesc) {
        this.subCode = subCode;
        this.subName = subName;
        this.subDesc = subDesc;
    }
    public subject() {
    }

    public String getSubCode() {
        return subCode;
    }

    public void setSubCode(String subCode) {
        this.subCode = subCode;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public String getSubDesc() {
        return subDesc;
    }

    public void setSubDesc(String subDesc) {
        this.subDesc = subDesc;
    }

}

