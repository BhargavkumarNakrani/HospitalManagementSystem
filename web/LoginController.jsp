
<%@page import="DAO.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String email = request.getParameter("email").toLowerCase();
    String password = request.getParameter("password");
    
    Boolean isValid = false;
    isValid = AccountDAO.validUser(email,password);
    String role = AccountDAO.getRole(email);
    if(isValid){
        session.setAttribute("email", email);
        session.setAttribute("role", role);
        if(role.equals("PATIENT"))
            response.sendRedirect("patientpage.jsp");
        else if(role.equals("DOCTOR"))
            response.sendRedirect("doctorpage.jsp");
        else if(role.equals("ADMIN"))
            response.sendRedirect("adminpage.jsp");
    }else{
        session.setAttribute("errorMessages", "Incorrect Email or Password");
        response.sendRedirect("login.jsp");
    }
%>
