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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.Patients;

/**
 *
 * @author rahul
 */
public class PatientDAO {
    public static int save(Patients patient){
        int result = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");  
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";

            Connection con = DriverManager.getConnection(mysqlURL);

            String sql ="INSERT INTO patients(name,email,contact_no)"
                    + "VALUES (?,?,?)";  // parameterized query
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,patient.getName());
            st.setString(2,patient.getEmail());
            st.setLong(3,patient.getContact_no());
            
            result = st.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public static int patientCount(){
        int count = 0;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT count(*) FROM patients";
            
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
    
    public static Patients getPatientById(int id){
        Patients patient = new Patients();
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM patients where id=" + id ;
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()){
                   patient.setId(Integer.parseInt(rs.getString("id")));
                   patient.setName(rs.getString("name"));
                   patient.setEmail(rs.getString("email"));
                   patient.setContact_no(Long.parseLong(rs.getString("contact_no")));
                   
            }
            
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return patient;
    }
    
    public static Patients getPatientByEmail(String email){
        Patients patient = new Patients();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM patients where email = '"+email+"'" ;
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()){
                   patient.setId(Integer.parseInt(rs.getString(1)));
                   patient.setName(rs.getString(2));
                   patient.setEmail(rs.getString(3));
                   patient.setContact_no(Long.parseLong(rs.getString(4)));
                   
            }
            
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return patient;
    }
    
    public static List<Patients> getAllPatients(){
        
        List<Patients> patientlist= new ArrayList<Patients>();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM patients";
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                Patients patient = new Patients(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),Long.parseLong(rs.getString(4)));
                patientlist.add(patient);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return patientlist;
    }
    
    public static int deletePatient(int id){
        int result = 0;
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="DELETE FROM patients WHERE id=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,id);
            
            result= st.executeUpdate();
            con.close();
            
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    return result;
    }
}
