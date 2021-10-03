<%@page import="DAO.AccountDAO"%>
<%@page import="pojo.Accounts"%>
<%@page import="DAO.PatientDAO"%>
<%@page import="pojo.Patients"%>
<%@page import="DAO.DoctorsDAO"%>
<%@page import="pojo.Doctors"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String role = request.getParameter("role");
    String name = request.getParameter("name");
    String email = request.getParameter("email").toLowerCase();
    String password = request.getParameter("password");
    long phone = Long.parseLong(request.getParameter("number"));
    String specialization = "";
    
    if(role.equals("DOCTOR")){
       specialization = request.getParameter("dspec");
       Doctors doctor = new Doctors(name, email, phone, specialization);
       int result = DoctorsDAO.save(doctor);
       if(result>0){
           response.sendRedirect("doctorpage.jsp");
           Accounts obj = new Accounts(email, password, role);
           AccountDAO.save(obj);
       }
    }else if(role.equals("PATIENT")){
        Patients patient = new Patients(name,email,phone);
        int result = PatientDAO.save(patient);
        if(result>0){
            response.sendRedirect("patientpage.jsp");
            Accounts obj = new Accounts(email, password, role);
            AccountDAO.save(obj);
        }
    }
    
%>