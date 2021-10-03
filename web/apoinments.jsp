<%@page import="pojo.Doctors"%>
<%@page import="DAO.DoctorsDAO"%>
<%@page import="pojo.Patients"%>
<%@page import="DAO.PatientDAO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ApoinmentDAO"%>
<%@page import="pojo.Apoinments"%>
<!DOCTYPE html>
<%
    String role = (String) session.getAttribute("role");
    String email = (String) session.getAttribute("email");
    int id = 0;
    if(role.equals("PATIENT"))
        id = PatientDAO.getPatientByEmail(email).getId();
    else if(role.equals("DOCTOR"))
        id = DoctorsDAO.getDoctorByEmail(email).getId();
%>
<html lang="en">
	<head>
		<title>Appointments</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
	</head>
	<body style="background-color:lightblue">
		<div id="app" >		
			<div class="app-content" >
				
						
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
                                                                    <h1 class="mainTitle"> <b>Manage Appointments </b   ></h1>
																	</div>
						</div>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white" style="border: 7px solid lightcyan  ; padding: 12px; border-radius: 9px 9px; ">
						
							<div class="row">
								<div class="col-md-12">
									<h5 class="over-title margin-bottom-15">Appointments <span class="text-bold">History</span></h5>
									<p style="color:red;">
									<table class="table table-hover" id="sample-table-1">
<thead>
    <tr>
											
        <th><b>Apoinment ID</b></th>
        <% if(!role.equals("PATIENT")){%>
	<th><b>Patient Name</b></th>				
	<th><b>Patient Contact</b></th>	
        <%}%>
        <% if(!role.equals("DOCTOR")){%>
	<th><b>Doctor Name</b></th>
	<th><b>Doctor Contact</b></th>
	<th><b>Specialization</b></th>	
        <%}%>
	<th><b>Date</b></th>
        <%if(role.equals("ADMIN")){%>
        <th>Action</th>
        <%}%>
    </tr>
</thead>

<%
    List<Apoinments> apnlist = null;
    if(role.equals("ADMIN")){
	apnlist= ApoinmentDAO.getAllApoinments();}
    else if(role.equals("DOCTOR")){
        apnlist = ApoinmentDAO.getSingleDoctorApoinments(id);
    }
    else if(role.equals("PATIENT")){
        apnlist= ApoinmentDAO.getSinglePatientApoinments(id);
    }
    for(Apoinments apn:apnlist){
        Patients p = PatientDAO.getPatientById(apn.getPatient().getId());
        Doctors doc = DoctorsDAO.getDoctorById(apn.getDoctor().getId());
%>
<tbody>
<tr>    
<td><%=apn.getId()%></td>
<% if(!role.equals("PATIENT")){%>
<td><%=p.getName()%></td>
<td><%=p.getContact_no()%></td>
<%}%>							
<% if(!role.equals("DOCTOR")){%>
<td><%=doc.getDname()%></td>
<td><%=doc.getPhone()%></td>
<td><%=doc.getSpecialization()%></td>	
<%}%>						
<td><%=apn.getApndate()%></td>	
<% if(role.equals("ADMIN")){%>
<td><a href="delapn.jsp?id=<%=apn.getId()%>">Delete</a></td>
<%}%>
</tr>
<%
}
%>
											
										</tbody>
									</table>
								</div>
<div class="form-actions" style="margin-left: 15px">
    <%  String redirect = null;
        if(role.equals("PATIENT"))
            redirect = "patientpage.jsp";
        else if(role.equals("DOCTOR"))
            redirect = "doctorpage.jsp";
        else if(role.equals("ADMIN"))
            redirect = "adminpage.jsp";
    %>
    <a href="<%=redirect%>" class="btn btn-primary pull-left">
									Back <i class="fa fa-arrow-circle-left"></i>
								</a>
                                                                     
                                                                                           
                                                                                                
                    </div>  
							</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		
	</body>
</html>
