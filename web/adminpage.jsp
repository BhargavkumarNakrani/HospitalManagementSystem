
<%@page import="DAO.ApoinmentDAO"%>
<%@page import="DAO.DoctorsDAO"%>
<%@page import="DAO.PatientDAO"%>
<%
    String role = (String) session.getAttribute("role");
    if(role.equals("")){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Admin  | Dashboard</title>
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
		<div id="app">		
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
                                                                    <b><h1 class="mainTitle">  <b>Admin | Dashboard </b></h1></b>
                                                                    
                                                                    <ul style="margin-left: 1150px"   >
                                                                                                <li> <a href="logout.jsp"> Logout </a></li>

                                                                                            </ul>   
																	</div>
							</div>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
							<div class="container-fluid container-fullw bg-white" style="border: 7px solid lightcyan  ; padding: 12px; border-radius: 9px 9px; ">
							<div class="row">
								<div class="col-sm-4">
									<div class="panel panel-white no-radius text-center" style="border: 2px solid lightcyan  ; padding: 12px; border-radius: 15px 15px; ">
										<div class="panel-body">
											<span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-smile-o fa-stack-1x fa-inverse"></i> </span>
											<h2 class="StepTitle">Manage Patients</h2>
											
											<p class="links cl-effect-1">
												<a href="mangptnts.jsp">Total patients: <%=PatientDAO.patientCount()%></a>
											</p>
										</div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="panel panel-white no-radius text-center" style="border: 2px solid lightcyan  ; padding: 12px; border-radius: 15px 15px; ">
										<div class="panel-body">
											<span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-users fa-stack-1x fa-inverse"></i> </span>
											<h2 class="StepTitle">Manage Doctors</h2>
										
											<p class="cl-effect-1">
												<a href="mngdoc.jsp">
												
											Total Doctors: <%=DoctorsDAO.doctorCount()%>
												</a>
												
											</p>
										</div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="panel panel-white no-radius text-center" style="border: 2px solid lightcyan  ; padding: 12px; border-radius: 15px 15px; ">
										<div class="panel-body">
											<span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-terminal fa-stack-1x fa-inverse"></i> </span>
											<h2 class="StepTitle"> Appointments</h2>
											
											<p class="links cl-effect-1">
												<a href="apoinments.jsp">
													
											

											Total Appointments :<%=ApoinmentDAO.apoinmentCount()%>
										
												</a>
											</p>
										</div>
                                                                                        
									</div>
                                                                                        
                                                                                         
								</div>
							</div>
						</div>
			
					
					
						
					</div>
				</div>
			</div>
			
		</div>

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
