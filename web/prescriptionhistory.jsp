
<%@page import="pojo.Doctors"%>
<%@page import="pojo.Patients"%>
<%@page import="DAO.PatientDAO"%>
<%@page import="DAO.DoctorsDAO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.PrescriptionDAO"%>
<%@page import="pojo.Prescription"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title> Doctor | prescription </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		<div id="app">		
			<div class="app-content">
				
						
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
                                                                    <h1 class="mainTitle"> <b>Doctor | prescription History <b></h1>
																	</div>
						</div>
                                                  
                                                    
                                                    <table>
                                                        <tr>
                                                            <td>
                                                    
                                                    <div class="input-group " style="margin-left: 850px">
  <input class="search_input" type="search" class="form-control rounded" placeholder="Search patients" aria-label="Search"
         aria-describedby="search-addon" /> </div> </td>
         
         <td style="width: 15px"> </td>
                                                    
                                                  <td>  <div>
  <button type="button" class="btn btn-outline-primary">search</button> 
</div>
                                                  </td>
                                                        </tr>
                                                        
                                                    </table>
                                                    
                                                    
                                                    
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white" style="border: 7px solid lightcyan  ; padding: 12px; border-radius: 9px 9px; ">
						
							<div class="row">
								<div class="col-md-12">
									<h5 class="over-title margin-bottom-15"> Prescription History   </h5>
									<p style="color:red;">
									<table class="table table-hover" id="sample-table-1">
										<thead>
											<tr>
											
	<th><b>Sr.No.</b></th>											
	<th><b>Patient Name</b></th>
        <th><b>Doctor name</b></th>
        <th><b>Disease</b></th>
        <th><b>hospital Name</b></th>
        <th><b>Date</b></th>
	<th><b>Medicine1</b></th>
        <th><b>Medicine2</b></th>
        <th><b>Medicine3</b></th>
        <th><b>Medicine4</b></th>
        <th><b>Medicine5</b></th>
	<th><b>Locality</b></th>
	
												
											</tr>
										</thead>
<%
    List<Prescription> preslist = PrescriptionDAO.getPrescriptions();
    for(Prescription pres:preslist){
        Patients p = PatientDAO.getPatientById(pres.getPatient().getId());
        Doctors doc = DoctorsDAO.getDoctorById(pres.getDoctor().getId());
%>
<tbody class="table-body">

											<tr>
<td><%=pres.getId()%></td>
<td><%=p.getName()%></td>
<td><%=doc.getDname()%></td>
<td><%=pres.getDisease()%></td>
<td><%=pres.getHname()%></td>
<td><%=pres.getDate() %></td>
<td><%=pres.getMedicine1() %></td>
<td><%=pres.getMedicine2() %></td>
<td><%=pres.getMedicine3() %></td>
<td><%=pres.getMedicine4() %></td>
<td><%=pres.getMedicine5() %></td>
<td><%=pres.getPlocality()%></td>
												
								</tr>
								<%
}
%>
							
										</tbody>
									</table>
								</div>

                                                    <div class="form-actions" style="margin-left: 15px">
								
								<a href="doctorpage.jsp" class="btn btn-primary pull-left">
									Back <i class="fa fa-arrow-circle-left"></i>
								</a>
	
						</div>
      
							</div>
								</div>
							</div>
						</div>
						<!-- end: BASIC EXAMPLE -->
						<!-- end: SELECT BOXES -->
						
					</div>
				</div>
		
		<span class="text-bold">Patients</span>
	</body>
<script >

    $(document).ready(function()
    
    {
        $(".search_input").on("keyup", function()
        {  
            var value = $(this).val().toLowerCase();
            $(".table-body tr").filter(function() 
            {     
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            }); 
        });   
    });
    
</script>
</html>
