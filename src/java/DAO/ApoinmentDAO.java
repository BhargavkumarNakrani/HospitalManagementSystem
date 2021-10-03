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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.Apoinments;
import pojo.Doctors;
import pojo.Patients;

/**
 *
 * @author rahul
 */
public class ApoinmentDAO {
    
    public static int deleteApoinment(int id){
        int result = 0;
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="DELETE FROM apoinments WHERE id=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,id);
            
            result= st.executeUpdate();
            con.close();
            
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    return result;
    }
    
    public static int apoinmentCount(){
        int count = 0;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT count(*) FROM apoinments";
            
            Statement st= con.createStatement();
            ResultSet resultSet;
            resultSet = st.executeQuery(sql);
            while(resultSet.next()){
                    count=resultSet.getInt(1);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public static List<Apoinments> getAllApoinments(){
        
        List<Apoinments> apnlist= new ArrayList<Apoinments>();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM apoinments";
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                
                Patients p = new Patients();
                Doctors d = new Doctors();
                
                p.setId(Integer.parseInt(rs.getString(2)));
                d.setId(Integer.parseInt(rs.getString(3)));
                
                Apoinments apn = new Apoinments(Integer.parseInt(rs.getString(1)),p,d,rs.getString(4));
                apnlist.add(apn);
                
            }
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apnlist;
    }
    
    public static int save(Apoinments apn){
        int result = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");  
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";

            Connection con = DriverManager.getConnection(mysqlURL);

            String sql ="INSERT INTO apoinments(patient_id,doctor_id,apndate)"
                    + "VALUES (?,?,?)";  // parameterized query
            PreparedStatement st = con.prepareStatement(sql);
            /*st.setInt(1,apn.getPatient().getId());
            st.setInt(2,apn.getDoctor().getId());
            st.setString(3,apn.getSpecialization());
            st.setString(4,apn.getApndate());*/
            
            st.setInt(1,apn.getPatient().getId());
            st.setInt(2,apn.getDoctor().getId());
            st.setString(3,apn.getApndate());
            
            result = st.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public static List<Apoinments> getSinglePatientApoinments(int id){
        
        List<Apoinments> apnlist= new ArrayList<Apoinments>();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM apoinments where patient_id = " + id;
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                
                Patients p = new Patients();
                Doctors d = new Doctors();
                
                p.setId(Integer.parseInt(rs.getString(2)));
                d.setId(Integer.parseInt(rs.getString(3)));
                
                Apoinments apn = new Apoinments(Integer.parseInt(rs.getString(1)),p,d,rs.getString(4));
                apnlist.add(apn);
                
            }
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apnlist;
    }


    public static List<Apoinments> getSingleDoctorApoinments(int id){
        
        List<Apoinments> apnlist= new ArrayList<Apoinments>();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM apoinments where doctor_id = " + id;
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                
                Patients p = new Patients();
                Doctors d = new Doctors();
                
                p.setId(Integer.parseInt(rs.getString(2)));
                d.setId(Integer.parseInt(rs.getString(3)));
                
                Apoinments apn = new Apoinments(Integer.parseInt(rs.getString(1)),p,d,rs.getString(4));
                apnlist.add(apn);
                
            }
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apnlist;
    }

}
