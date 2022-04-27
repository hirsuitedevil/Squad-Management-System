<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">
<link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet"/>
<script src="https://kit.fontawesome.com/d0f77abc70.js"></script>
</head>

<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>


	<jsp:include page="includes/header.jsp"></jsp:include>

	
	<div class="content">
		
		<div class="animated fadeIn">
			
			<div class="row">
				<%
					int count_today_vehentries = 0;
				    int out_entries = 0;
						Connection con = DatabaseConnection.getConnection();
						Statement statement = con.createStatement();
						ResultSet resultset = statement.executeQuery("select count(*) from tblplayer");
						while (resultset.next()) {
							count_today_vehentries = resultset.getInt(1);
						}
						ResultSet rst = statement.executeQuery("select count(*) from tblplayer");
						while(rst.next()){
							out_entries=rst.getInt(1);
						}
				%>

				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
							<div class="stat-icon dib flat-color-2">
								</div>
								<div class="stat-content">
								
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"><%=count_today_vehentries%> </span>
										</div>
										<div class="stat-heading">Total Players</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<%
						int count_yesterday_vehentries = 0;
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("select count(*) from tblteam");
							while (rs.next()) {
								count_yesterday_vehentries = rs.getInt(1);
							}
					%>
					
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-2">
									
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"> <%=count_yesterday_vehentries%>
											</span>
										</div>
										<div class="stat-heading">Total Teams</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-6">
					<%
						int count_spons = 0;
							Statement sta = con.createStatement();
							ResultSet res = sta.executeQuery("select count(*) from tblsponsor");
							while (res.next()) {
								count_spons = res.getInt(1);
							}
					%>
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-2">
									
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"> <%=count_spons%>
											</span>
										</div>
										<div class="stat-heading">Total Sponsors</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					<div class="col-lg-3 col-md-6">
					<%
						int count_grnd = 0;
							Statement stam = con.createStatement();
							ResultSet rest = stam.executeQuery("select count(*) from tblground");
							while (rest.next()) {
								count_grnd = rest.getInt(1);
							}
					%>
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-2">
									
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"> <%=count_grnd%>
											</span>
										</div>
										<div class="stat-heading">Total Grounds</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				
				

				<div class="col-lg-3 col-md-6">
					<%
						int count_coach = 0;
							Statement allstmt = con.createStatement();
							ResultSet allrst = allstmt.executeQuery("select count(distinct Coach_Name) from tblcoach");
							while (allrst.next()) {
								count_coach = allrst.getInt(1);
							}
					%>

					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-4">
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count"> <%=count_coach%>
											</span>
										</div>
										<div class="stat-heading">Total Coaches</div>
									</div>
								</div>
							</div>
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
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>
