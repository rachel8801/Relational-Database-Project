<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    

<%
	try{
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		//Get the user id from the reg.jsp
	   	String username = request.getParameter("username");
		String password = request.getParameter("password");
	   	String fname = request.getParameter("fname");
	   	String lname = request.getParameter("lname");
	  	String email = request.getParameter("email");
				
		//Create a SQL statement
		Statement stmt = con.createStatement();
		ResultSet rs;
		
		//Make a SELECT query from user table where username and password matche from the login parameter.
		String getUser = "SELECT * FROM user WHERE username = '"+username+"'";
		rs = stmt.executeQuery(getUser);
		if (rs.next()){
			session.setAttribute("userExist", "true");
			response.sendRedirect("../pages/register.jsp");
		}else{
			int k = stmt.executeUpdate("INSERT INTO user (fname, lname, username, pwd, email)VALUES( '"+fname+"','"+lname+"','"+username +"','" +password+ "','"+email +"');");
			if(k>0){
				rs = stmt.executeQuery(getUser);
				if(rs.next()){
		   			session.setAttribute("userId", rs.getString("userID"));
			   		session.setAttribute("firstName", rs.getString("fname"));
			       	response.sendRedirect("../pages/homepage.jsp");					
				}
			 } else {
				session.setAttribute("registerfail", "true");
				response.sendRedirect("../pages/register.jsp");
			}
		}
	}catch (Exception e) {
        out.print(e);
    	}
%>