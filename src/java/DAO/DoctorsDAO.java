/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.Doctors;
import pojo.Patients;

/**
 *
 * @author rahul
 */
public class DoctorsDAO {
    
    public static int deleteDoctor(int id){
        int result = 0;
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="DELETE FROM doctors WHERE id=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,id);
            
            result= st.executeUpdate();
            con.close();
            
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    return result;
    }
    
    
    public static int save(Doctors doctor){
        int result = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");  
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";

            Connection con = DriverManager.getConnection(mysqlURL);

            String sql ="INSERT INTO doctors(dname,email,contact,specialization)"
                    + "VALUES (?,?,?,?)";  // parameterized query
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,doctor.getDname());
            st.setString(2,doctor.getEmail());
            st.setLong(3,doctor.getPhone());
            st.setString(4,doctor.getSpecialization());
            
            result = st.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public static int doctorCount(){
        int count = 0;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT count(*) FROM doctors";
            
            Statement st= con.createStatement();
            ResultSet resultSet;
            resultSet = st.executeQuery(sql);
            while(resultSet.next()){
                    count=resultSet.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    
    public static Doctors getDoctorByEmail(String email){
        
        Doctors doc = new Doctors();
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM doctors where email='" +email+ "'";
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()){
                   doc.setId(Integer.parseInt(rs.getString("id")));
                   doc.setDname(rs.getString("dname"));
                   doc.setEmail(rs.getString("email"));
                   doc.setPhone(Long.parseLong(rs.getString("contact")));
                   doc.setSpecialization(rs.getString("specialization"));
            }
            
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return doc;
    }
    
    public static Doctors getDoctorByName(String name){
        Doctors doc = new Doctors();
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM doctors where dname='" +name+ "'";
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()){
                
                   doc.setId(Integer.parseInt(rs.getString("id")));
                   doc.setDname(rs.getString("name"));
                   doc.setEmail(rs.getString("email"));
                   doc.setPhone(Long.parseLong(rs.getString("contact_no")));
                   doc.setSpecialization(rs.getString("specialization"));
                   
            }
            
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return doc;
    }
    
    public static List<Doctors> getAllDoctors(){
        
        List<Doctors> doctorlist= new ArrayList<Doctors>();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM doctors";
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                Doctors doctor = new Doctors(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),Long.parseLong(rs.getString(4)),rs.getString(5));
                doctorlist.add(doctor);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return doctorlist;
    }
    
    public static Doctors getDoctorById(int id){
        
        Doctors doctor = new Doctors();
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM doctors where id=" + id ;
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()){
                
                   doctor.setId(Integer.parseInt(rs.getString(1)));
                   doctor.setDname(rs.getString(2));
                   doctor.setEmail(rs.getString(3));
                   doctor.setPhone(Long.parseLong(rs.getString(4)));
                   doctor.setSpecialization(rs.getString(5));
                   
                   
            }
            
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return doctor;
    }
}
