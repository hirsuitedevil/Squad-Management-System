<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<title> Add Player</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="includes/header.jsp"></jsp:include>

	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
				<div class="col-sm-12">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
								<li class="breadcrumb-item"><a href="add-player.jsp">Player</a></li>
								<li class="breadcrumb-item active">Add Player</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>

	<div class="content">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-lg-6">
					<div class="card"></div>
					<!-- .card -->
				</div>
				<!--/.col-->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong>Add </strong> Player
						</div>
							<%
								String message = (String) session.getAttribute("message");
									if (message != null) {
										session.removeAttribute("message");
							%>
						
						<h6>
							Pool is full, Wait for sometimes.
						</h6>
						<%
							}
						%>
						<div class="card-body card-block">
							<form action="AddPlayer" method="post">
								<p style="font-size: 16px; color: red" align="center">
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Team ID</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="teamid" name="teamid"
											class="form-control" placeholder="Team ID" required>
									</div>
								</div>

								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Name</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="playername" name="playername"
											class="form-control" placeholder="Player name" required>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Role</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="role" name="role"
											class="form-control" placeholder="Role" required>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Runs</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="runs" name="runs"
											class="form-control" placeholder="0" required>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Batting Strike Rate</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="batsr" name="batsr"
											class="form-control" placeholder="0.0">
									</div>
								</div>		
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Centuries</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="centuries" name="centuries"
											class="form-control" placeholder="0">
									</div>
								</div>	
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Bowling Strike Rate</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="bowlsr" name="bowlsr"
											class="form-control" placeholder="0.0">
									</div>
								</div>		
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Economy</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="economy" name="economy"
											class="form-control" placeholder="0.0">
									</div>
								</div>	
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Wickets</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="wickets" name="wickets"
											class="form-control" placeholder="0">
									</div>
								</div>			
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Is Captain</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="isCap" name="isCap"
											class="form-control" placeholder="Yes/No">
									</div>
								</div>				
								
								<p style="text-align: center;">
									<button type="submit" class="btn btn-primary btn-sm"
										name="submit">Add</button>
								</p>
							</form>
						</div>
						
					</div>

				</div>
				<div class="col-lg-6"></div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<div class="clearfix"></div>

	<jsp:include page="includes/footer.jsp"></jsp:include>

	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>
