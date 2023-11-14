<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	<div class="container">
		<div class="login-form">
			<h1>
				<i>Welcome Back!</i>
			</h1>
			<form action="auth" method="POST">
				<table>
					<tr>
						<td><label><i class="fa fa-user"></i> Username:</label></td>
						<td><input type="text" id="txtUsername" name="username"
							placeholder="Email or Phone Number" /></td>
					</tr>
					<tr>
						<td><label><i class="fa fa-lock"></i> Password:</label></td>
						<td><input type="password" id="txtPassword" name="password"
							placeholder="Enter your password" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Login" /> <input
							type="reset" value="Reset" /></td>
					</tr>
				</table>
				<h4>${error}</h4>
			</form>
			<br>
		</div>
		<div class="quote"></div>
	</div>
</body>
</html>
