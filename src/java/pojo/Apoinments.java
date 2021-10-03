/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.time.LocalDateTime;

/**
 
 * @author rahul
 */
public class Apoinments {
    
    private Integer id;
    private Patients patient;
    private Doctors doctor;
    private String apndate;

    public Apoinments(Integer id, Patients patient, Doctors doctor, String apndate) {
        this.id = id;
        this.patient = patient;
        this.doctor = doctor;
        this.apndate = apndate;
    }
    
    public Apoinments(Patients patient, Doctors doctor, String apndate) {
        this.patient = patient;
        this.doctor = doctor;
        this.apndate = apndate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Patients getPatient() {
        return patient;
    }

    public void setPatient(Patients patient) {
        this.patient = patient;
    }

    public Doctors getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctors doctor) {
        this.doctor = doctor;
    }

    public String getApndate() {
        return apndate;
    }

    public void setApndate(String apndate) {
        this.apndate = apndate;
    }

    
}
