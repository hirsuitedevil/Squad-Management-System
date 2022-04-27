<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>

<html class="no-js" lang="">
<head>

<title> View Coach Detail</title>
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
								<li class="breadcrumb-item"><a href="viewTeam.jsp">Team</a></li>
								<li class="breadcrumb-item active">Coach Details</li>
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
							<strong class="card-title">View Coach Details</strong>
						</div>
						<div class="card-body">
						<table class="table">
								<thead>
									<tr>
										<th>Team Name</th>
										<th>Coach Name</th>
										<th>Role</th>
										<th>Experience</th>
									</tr>
								</thead>
								<%
								int cid = Integer.parseInt(request.getParameter("viewid"));
							      session.setAttribute("cid", cid);
										Connection con = DatabaseConnection.getConnection();
										Statement statement = con.createStatement();
										ResultSet resultset = statement.executeQuery("select * from  tblcoach where Team_ID='" + cid + "'");
										while (resultset.next()) {
											int team=resultset.getInt(5);
											Statement stat = con.createStatement();
											ResultSet result = stat.executeQuery("select * from  tblteam where Team_ID=" +"'"+ team+ "'");
											while(result.next()){
											String TeamName=result.getString(2);
											
								%>
								<tr>
									<td><%=TeamName%></td>
									<td><%=resultset.getString(2)%></td>
									<td><%=resultset.getString(4)%></td>
									<td><%=resultset.getInt(3)%></td>
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
	<jsp:include page="includes/footer.jsp"></jsp:include>

	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>
