/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author rahul
 */
public class Doctors {
    
    private Integer id;
    private String dname;
    private String email;
    private long phone;
    private String specialization;

    public Doctors() { //To change body of generated methods, choose Tools | Templates.
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public Integer getId() {
        return id;
    }

    public String getDname() {
        return dname;
    }

    public String getEmail() {
        return email;
    }


    public String getSpecialization() {
        return specialization;
    }

    /*public Doctors(String dname, String email, long phone, String specialization) {
        this.dname = dname;
        this.email = email;
        this.phone = phone;
        this.specialization = specialization;
    }
    
    public Doctors(Integer id, String dname, String email, long phone, String specialization) {
        this.id = id;
        this.dname = dname;
        this.email = email;
        this.phone = phone;
        this.specialization = specialization;
    }*/

    public Doctors(Integer id, String dname, String email, long phone, String specialization) {
        this.id = id;
        this.dname = dname;
        this.email = email;
        this.phone = phone;
        this.specialization = specialization;
    }
    
    public Doctors(String dname, String email, long phone, String specialization) {
        this.dname = dname;
        this.email = email;
        this.phone = phone;
        this.specialization = specialization;
    }
    
    
        
}
