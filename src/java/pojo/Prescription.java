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
public class Prescription {
    
    private Integer id;
    private Patients patient;
    private Doctors doctor;
    private String disease;
    private String hname;
    private String date;
    private String medicine1;
    private String medicine2;
    private String medicine3;
    private String medicine4;
    private String medicine5;
    private String plocality;

    public Prescription(Integer id, Patients patient, Doctors doctor, String disease, String hname, String date, String medicine1, String medicine2, String medicine3, String medicine4, String medicine5, String plocality) {
        this.id = id;
        this.patient = patient;
        this.doctor = doctor;
        this.disease = disease;
        this.hname = hname;
        this.date = date;
        this.medicine1 = medicine1;
        this.medicine2 = medicine2;
        this.medicine3 = medicine3;
        this.medicine4 = medicine4;
        this.medicine5 = medicine5;
        this.plocality = plocality;
    }

    
   

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }
    

    public Integer getId() {
        return id;
    }

    public String getHname() {
        return hname;
    }

    public String getDate() {
        return date;
    }

    public String getMedicine1() {
        return medicine1;
    }

    public String getMedicine2() {
        return medicine2;
    }

    public String getMedicine3() {
        return medicine3;
    }

    public String getMedicine4() {
        return medicine4;
    }

    public String getMedicine5() {
        return medicine5;
    }

    public String getPlocality() {
        return plocality;
    }

    public Patients getPatient() {
        return patient;
    }

    public Doctors getDoctor() {
        return doctor;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setMedicine1(String medicine1) {
        this.medicine1 = medicine1;
    }

    public void setMedicine2(String medicine2) {
        this.medicine2 = medicine2;
    }

    public void setMedicine3(String medicine3) {
        this.medicine3 = medicine3;
    }

    public void setMedicine4(String medicine4) {
        this.medicine4 = medicine4;
    }

    public void setMedicine5(String medicine5) {
        this.medicine5 = medicine5;
    }

    public void setPlocality(String plocality) {
        this.plocality = plocality;
    }

    public void setPatient(Patients patient) {
        this.patient = patient;
    }

    public void setDoctor(Doctors doctor) {
        this.doctor = doctor;
    }
    
    
    
    
}
