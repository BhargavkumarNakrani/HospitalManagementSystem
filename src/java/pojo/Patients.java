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
public class Patients {
    
    private Integer id;
    private String name;
    private String email;
    private long contact_no;

    public Patients(String name, String email, long contact_no) {
        this.name = name;
        this.email = email;
        this.contact_no = contact_no;
    }
    
    public Patients(Integer id,String name, String email, long contact_no) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.contact_no = contact_no;
    }

    public Patients() { //To change body of generated methods, choose Tools | Templates.
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getContact_no() {
        return contact_no;
    }

    public void setContact_no(Long contact_no) {
        this.contact_no = contact_no;
    }
    
}