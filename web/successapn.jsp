<%@page import="pojo.Doctors"%>
<%@page import="DAO.ApoinmentDAO"%>
<%@page import="DAO.DoctorsDAO"%>
<%@page import="pojo.Patients"%>
<%@page import="DAO.PatientDAO"%>
<%@page import="pojo.Apoinments"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>S.U.C.C.E.S.S</title>
</head>
<%
    String email = (String) session.getAttribute("email");
    String sdate=request.getParameter("date");
    String time=request.getParameter("time");
    String doctor=request.getParameter("doctor");
    
    String date = sdate + " " + time +":00";
    
    //int patient_id = PatientDAO.getPatientByEmail(email);
    Patients patient = PatientDAO.getPatientByEmail(email);
    Doctors doc = DoctorsDAO.getDoctorByName(doctor);
    
    Apoinments apn = new Apoinments(patient,doc,date);
    if(ApoinmentDAO.save(apn)>0){
        response.sendRedirect("apoinments.jsp");
    }else{
        System.out.print("bookapn.jsp");
    }
%>
<br><br>
<b><center>Success</center></b><br>
<center><a href="patientpage.jsp">Back</a></center><br>
<center><a href="/HospDBMS">Home</a></center><br>

</body>
</html>