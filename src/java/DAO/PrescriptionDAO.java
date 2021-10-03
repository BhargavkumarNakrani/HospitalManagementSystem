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
import pojo.Doctors;
import pojo.Patients;
import pojo.Prescription;

/**
 *
 * @author rahul
 */
public class PrescriptionDAO {
    public static int save(Prescription pres){
        int result = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");  
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";

            Connection con = DriverManager.getConnection(mysqlURL);

            String sql ="INSERT INTO prescription(patient_id,doctor_id,disease,hname,medicine1,medicine2,medicine3,medicine4,medicine5,plocality)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?)";  // parameterized query
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1,pres.getPatient().getId());
            st.setInt(2,pres.getDoctor().getId());
            st.setString(3,pres.getDisease());
            st.setString(4,pres.getHname());
            st.setString(5,pres.getMedicine1());
            st.setString(6,pres.getMedicine2());
            st.setString(7,pres.getMedicine3());
            st.setString(8,pres.getMedicine4());
            st.setString(9,pres.getMedicine5());
            st.setString(10,pres.getPlocality());
            
            result = st.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public static List<Prescription> getPrescriptions(){
        
        List<Prescription> preslist= new ArrayList<Prescription>();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";
            
            Connection con = DriverManager.getConnection(mysqlURL);
            
            String sql ="SELECT * FROM prescription";
            
            Statement st= con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            
            
            while(rs.next()){
       
                Patients p = new Patients();
                Doctors d = new Doctors();

                p.setId(Integer.parseInt(rs.getString(2)));
                d.setId(Integer.parseInt(rs.getString(3)));
                
                Prescription apn = new Prescription(Integer.parseInt(rs.getString(1)),p,d,rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12));
                preslist.add(apn);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return preslist;
    }
}
