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
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.Accounts;
import pojo.Doctors;

/**
 *
 * @author rahul
 */
public class AccountDAO {
    public static Boolean validUser(String email,String password){
        boolean found = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");  
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";

            Connection con = DriverManager.getConnection(mysqlURL);

            String sql = "select * from accounts where email='"+email+"' and password = '" +password+"'";
            
            PreparedStatement st = con.prepareStatement(sql);
            
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()){
                found = true;}
            
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return found;
    }
    
    public static String getRole(String email){
        String role = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");  
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";

            Connection con = DriverManager.getConnection(mysqlURL);

            String sql = "select role from accounts where email='"+email+"'";
            
            Statement st = con.createStatement();
            
            ResultSet rs = st.executeQuery(sql);
            if(rs.next())
                role = rs.getString(1);
            System.out.println(role);
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return role;
        
    }
    
    public static void save(Accounts account){
        int result = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");  
            
            String mysqlURL = "jdbc:mysql://localhost:3306/hospital?user=root";

            Connection con = DriverManager.getConnection(mysqlURL);

            String sql ="INSERT INTO accounts(email,password,role)"
                    + "VALUES (?,?,?)";  // parameterized query
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,account.getEmail());
            st.setString(2,account.getPassword());
            st.setString(3,account.getRole());
            
            result = st.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
