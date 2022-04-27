<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<title>Team Capacity</title>
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
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Dashboard</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
								<li class="breadcrumb-item active">Pool</li>
							</ol>
						</div>
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
				</div>
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong>Team </strong> Capacity
						</div>
						<%
						int team_cap=0;
						Connection con = DatabaseConnection.getConnection();
						Statement statement = con.createStatement();
						ResultSet resultset = statement.executeQuery("select * from tblteamcapacity");
						while (resultset.next()) {
							team_cap = resultset.getInt(1);
						}
						%>
						<div class="card-body card-block">
							<form action="update-team-capacity.jsp" method="post">
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Team Capacity</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="pseats" name="pseats" class="form-control" 
											required value="<%=team_cap%>">
									</div>
								</div>
								<p style="text-align: center;">
									<button type="submit" class="btn btn-primary btn-sm"
										name="submit">Update Team Capacity</button>
								</p>
							</form>
						</div>

					</div>
				</div>

				<div class="col-lg-6"></div>
			</div>
		</div>
	</div>

	<div class="clearfix"></div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>
<%
	} else {
		response.sendRedirect("admin-login.jsp");
	}
%>