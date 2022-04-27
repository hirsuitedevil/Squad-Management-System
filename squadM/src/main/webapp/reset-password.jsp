<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>

<title>Reset Page</title>

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

	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
						<h4><a href="index.jsp">Squad Management System</a></h4>
				</div>
				<%
					String mobileNo = request.getParameter("contactno");
					Connection con = DatabaseConnection.getConnection();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select password from tbladmin where MobileNumber='" + mobileNo + "'");
					if (rs.next()) {
				%>
				<div class="login-form">
					<div class="form-group">
						<label>Your Password :</label>
						<label><%=rs.getString(1)%></label>
					</div>
				</div>
				<%
					} else {
				%>
				<div class="login-form">
					<div class="form-group">
						<label>Sorry!! Your account is not present this system.</label>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>


</body>
</html>
