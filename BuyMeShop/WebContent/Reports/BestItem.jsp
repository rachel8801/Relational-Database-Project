<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item Sales Report</title>
</head>
<body>
<h1>Best Selling Item Report</h1>
<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stat = con.createStatement();
		ResultSet r1 = stat.executeQuery("SELECT Pname, COUNT(Pname) FROM SALES REPORT GROUP BY Pname HAVING COUNT(Pname) = (SELECT max(p1) FROM (SELECT COUNT(Pname) as p1 FROM SALES REPORT GROUP BY Pname)q1)");
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<td>Item</td>");
		out.println("<td>Total Sold</td>");
		out.println("</tr>");
		
		while(r1.next()){
			out.println("<tr>");
			out.println("<td>");
			out.println(r1.getString(1));
			out.println("</td>");
			out.println("<td>");
			out.println(r1.getString(2));
			out.println("</td>");
			out.println("</tr>");
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	} 
%>
<br><br>
<input type="button" value="Return to Admin Home" onClick="window.location='../AdminHomePage.jsp';">

</body>
</html>