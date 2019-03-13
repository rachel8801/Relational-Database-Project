<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register New Account</title>
<link href="../css/form.css" rel="stylesheet">
</head>
<body>
	<form method="post" action="../server/createAccount.jsp" class="form-control">
		<h1 style="text-align: center;">Buy Me Shop</h1>
		<h3>Please Enter Your Information</h3>
		<%
			if((session.getAttribute("userExist") == "true")){
				out.print("<p style='color:red;'>Username is already exists.</p>");
			}
			if((session.getAttribute("registerfail") == "true")){
				out.print("<p style='color:red;'>Register Fail. Please try again.</p>");
			}
			session.invalidate();
		%>
		<div class="row">
			<label>First Name</label>
			<input type="text" class="input-field" name="fname" style="border-radius:.25rem">
		</div>
		<div class="row">
			<label>Last Name</label>
			<input type="text" class="input-field" name="lname" style="border-radius:.25rem">
		</div>
		<div class="row">
			<label>Email</label>
			<input type="text" class="input-field" name="email" style="border-radius:.25rem">
		</div>
		<div class="row">
			<label>Username</label>
			<input type="text" class="input-field" name="username" style="border-radius:.25rem">
		</div>
		<div class="row">
			<label>Password</label>
			<input type="password" class="input-field" name="password" style="border-radius:.25rem">
		</div>
		<div class="row">
			<input type="submit" value="Register" class="submit-btn">
			<p>Ready Register? <a href="../">Sign In Here</a></p>
		</div>	
	</form>
</body>
</html>