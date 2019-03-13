<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Buy Me Shop</title>
<link href="../css/form.css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="message-table">
		<h3>Your Messages:</h3>
		<ul class="item-list">
			<%
				try{
					//Get the database connection
					ApplicationDB db = new ApplicationDB();	
					Connection con = db.getConnection();		
			
					//Create a SQL statement
					Statement stmt = con.createStatement();
					String buyerId = (String) session.getAttribute("userId");
					String str= "SELECT * FROM Alert where buyer_ID ="+buyerId+" or seller_ID = "+buyerId+";";
				
					ResultSet result = stmt.executeQuery(str);
					while(result.next()){
						out.print("<li class='menu-item'>");
						out.print("<label>"+result.getString("message")+"</label");
						out.print("</li>");
					}
					db.closeConnection(con);
				}catch (Exception e) {
					out.print(e);
				}
			%>			
		</ul>
	</div>
</body>
</html>