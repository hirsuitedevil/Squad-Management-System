<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>

<!doctype html>
<html class="no-js" lang="">
<head>

<title>Forgot Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/styles.css">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

</head>
<body>
	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
						<h4 style="color: #FFFFFF">	<a href="index.jsp">Squad Management System</a></h4>
				</div>
				<div class="login-form">
					<form action="reset-password.jsp" method="post">
						<div class="form-group">
							<label>Mobile Number</label> <input type="text"
								class="form-control" name="contactno"
								placeholder="Mobile Number" required>
						</div>
						<div class="checkbox">
							<label class="pull-right"> <a href="index.jsp">Signin</a>
							</label>
						</div>
						<button type="submit" name="submit"
							class="btn btn-success">Find Password</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>
