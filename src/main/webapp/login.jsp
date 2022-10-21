	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	</head>
	<body>
		<nav class="navbar" style="background-color: #e3f2fd;">
			<h1>Login Page</h1>
		</nav>
	
		<div class="m-1">
			<div class="p-4">
				<form action="login" method="post">
					${invalid}
					<div class="form-group row">
						<label class="col-2">Username</label><input type="text"
							class="col-3" name="uname" placeholder="username" required />
					</div>
					<div class="form-group row">
						<label class="col-2">Password</label><input type="password"
							class="col-3" name="pass" placeholder="password" required />
					</div>
					<div class="form-group row">
						<div class="col-sm-10">
							<input type="submit" class="btn btn-outline-primary" value="Login" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
	</html>