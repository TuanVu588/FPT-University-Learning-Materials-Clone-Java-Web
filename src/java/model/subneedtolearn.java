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
public class subneedtolearn {
    private String preRequitesite;
    private String subCode;

    public String getPreRequitesite() {
        return preRequitesite;
    }

    public void setPreRequitesite(String preRequitesite) {
        this.preRequitesite = preRequitesite;
    }

    public String getSubCode() {
        return subCode;
    }

    public void setSubCode(String subCode) {
        this.subCode = subCode;
    }

    public subneedtolearn(String preRequitesite, String subCode) {
        this.preRequitesite = preRequitesite;
        this.subCode = subCode;
    }

    public subneedtolearn() {
    }


    
}
