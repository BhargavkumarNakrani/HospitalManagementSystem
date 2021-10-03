
<%@page import="DAO.PatientDAO"%>
<%
    String sid = request.getParameter("id");
    int id = Integer.parseInt(sid);
    
    int result = PatientDAO.deletePatient(id);
    
    if(result>0){
        response.sendRedirect("mangptnts.jsp");
    }else{
        out.print("Not able to delete record. Try after some time.");
    }
%>