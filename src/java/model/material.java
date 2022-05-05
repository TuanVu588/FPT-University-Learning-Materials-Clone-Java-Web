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
public class material {
    private String materialDesc;
    private String subCode;
    private boolean forTeacher;

    public String getMaterialDesc() {
        return materialDesc;
    }

    public void setMaterialDesc(String materialDesc) {
        this.materialDesc = materialDesc;
    }

    public String getSubCode() {
        return subCode;
    }

    public void setSubCode(String subCode) {
        this.subCode = subCode;
    }

    public boolean isForTeacher() {
        return forTeacher;
    }

    public void setForTeacher(boolean forTeacher) {
        this.forTeacher = forTeacher;
    }

    public material() {
    }
    
}
