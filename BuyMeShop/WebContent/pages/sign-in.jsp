<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy Me Shop</title>
<link href="css/form.css" rel="stylesheet">
</head>
<body>
	<form method="post" action="server/authentication.jsp" class="form-control">
		<h1 style="text-align: center;">Buy Me Shop</h1>
		<h3 style="text-align: center;">Please Sign In</h3>
		<%
			if((session.getAttribute("failAuth") == "false")){
				out.print("<p style='color:red;'>Sign In fail, Please try again.</p>");
				session.invalidate();
			}
		%>		
		<input type="text" name="username" placeholder="User Name" class="input-field" style="margin-bottom:-1px;">
		<input type="password" name="password" placeholder="Password" class="input-field">
		<input type="submit" value="Sign In" class="submit-btn">
		<p>No Account? <a href="pages/register.jsp">Please Register Here</a></p>
	</form>
</body>
</html>