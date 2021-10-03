
<%@page import="DAO.DoctorsDAO"%>
<%
    String sid = request.getParameter("id");
    int id = Integer.parseInt(sid);
    
    int result = DoctorsDAO.deleteDoctor(id);
    
    if(result>0){
        response.sendRedirect("mngdoc.jsp");
    }else{
        out.print("Not able to delete record. Try after some time.");
    }
%>