<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>

<html class="no-js" lang="">
<head>

<title>View Sponsors</title>
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
				<div class="col-sm-12">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
								<li class="breadcrumb-item active">View Sponsors</li>
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



				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">View Sponsors</strong>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th>Team Name</th>
										<th>Sponsor Name</th>
										<th>Sponsorship Amount</th>
									</tr>
								</thead>
								<%
									String status = null;
										Connection con = DatabaseConnection.getConnection();
										Statement statement = con.createStatement();
										ResultSet resultset = statement.executeQuery("select * from  tblsponsor_team");
										while (resultset.next()) {
											int sponsorid=resultset.getInt(1);
											int teamid=resultset.getInt(2);
											Statement stat1 = con.createStatement();
											Statement stat2 = con.createStatement();
											ResultSet result1 = stat1.executeQuery("select * from  tblsponsor where Sponsor_ID=" +"'"+ sponsorid+ "'");
											ResultSet result2 = stat2.executeQuery("select * from  tblteam where Team_ID=" +"'"+ teamid+ "'");
											while(result1.next() && result2.next()){
								%>
								<tr>
									<td><%=result2.getString(2)%></td>
									<td><%=result1.getString(2)%></td>
									<td><%=resultset.getString(3)%></td>
								</tr>
								<%
											}
											 	}
								%>
							</table>

						</div>
					</div>
				</div>



			</div>
		</div>
		
	</div>
	<div class="clearfix"></div>

	<jsp:include page="includes/footer.jsp"></jsp:include>

	<%
		} else {
			response.sendRedirect("adminlogin.jsp");
		}
	%>

</body>
</html>
