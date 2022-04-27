<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<title>Login Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
		<div class="container1">
			<div class="login-content">
				<div class="login-logo">
						<h4 style="color: #FFF"><a href="index.jsp">Squad Management System</a></h4>
				</div>
				<div class="login-form">
					<form action="AdminLogin" method="post">
						<div class="form-group">
							<label>User Name</label> 
							<input class="form-control" type="text" placeholder="Username" required name="username">
						</div>
						<div class="form-group">
							<label>Password</label> 
							<input type="password" class="form-control" name="password" placeholder="Password" required>
						</div>
							 <a href="forgot-password.jsp">Forgot Password?</a>
						<button type="submit" name="login" class="btn btn-success btn-flat">Sign in</button>
					</form>
				</div>
			</div>
		</div>
</body>
</html>
