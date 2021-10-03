
<%@page import="DAO.DoctorsDAO"%>
<%@page import="pojo.Doctors"%>
<%@page import="pojo.Apoinments"%>
<%@page import="DAO.ApoinmentDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>User  | Book Appointment</title>
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
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
                                                                    <h1 class="mainTitle"> <b>User | Book Appointment </b></h1>
																	</div>
								<ol class="breadcrumb">
									
									<li class="active">
										<span>Book Appointment</span>
									
									</li>
									
									
								</ol>
								
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white" style="border: 7px solid lightcyan  ; padding: 12px; border-radius: 9px 9px; ">
							<div class="row">
								<div class="col-md-12">
									
									<div class="row margin-top-30">
										<div class="col-lg-8 col-md-12">
											<div class="panel panel-white">
												<div class="panel-heading">
													<h5 class="panel-title">Book Appointment</h5>
												</div>
												<div class="panel-body">
													<form method="post" action="successapn.jsp">
													
<div class="form-group">
    <label for="DoctorSpecialization">
            Doctor Specialization
    </label>
    <select name="dspec" class="form-control">
            <option value="">Select Specialization</option>
            <option value="Brain surgery">Brain surgery</option>
            <option value="Heart surgery">Heart surgery</option>
            <option value="Plastic surgery">Plastic surgery</option>
            <option value="Cancer treatment">Cancer treatment</option>

            <option value="Basic treatment">Basic treatment</option>
    </select>
</div>

											
														
<div class="form-group">
    <label for="Doctors">
            Doctor
    </label>
    <select name="doctor" class="form-control">
            <option value="">Select Doctor</option>
        <%
            List<Doctors> doclist = DoctorsDAO.getAllDoctors();
            
            for(Doctors doc: doclist){
        %>
        <option value="<%=doc.getDname()%>"><%=doc.getDname()%></option>
        <%}%>
    </select>
</div>

<div class="form-group">
    <label for="AppointmentDate">
            Date
    </label>
    <input type="date" class="form-control datepicker" name="date"  required="required" data-date-format="yyyy-mm-dd">
	
    </div>                                                                                                             
                                                                                                            
<div class="form-group">
    <label for="Appointmenttime">
        Time
    </label>
    <input class="form-control" name="time" type="time" id="timepicker1" required="required" data-time-format="HH:MM:ss">
</div>	<br>													
														
                                                        <div class="form-actions">
								
                                                                <button type="submit" class="btn btn-primary pull-left">
									Submit </i>
								</button>
                                                        </div> 
													</form>
												</div>
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
</html>
