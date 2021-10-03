
<%@page import="DAO.ApoinmentDAO"%>
<%
    String sid = request.getParameter("id");
    int id = Integer.parseInt(sid);
    
    int result = ApoinmentDAO.deleteApoinment(id);
    
    if(result>0){
        response.sendRedirect("apoinments.jsp");
    }else{
        out.print("Not able to delete record. Try after some time.");
    }
%>