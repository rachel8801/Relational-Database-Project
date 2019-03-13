<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    

<% 
	try {
	    //Get the database connection
	    ApplicationDB db = new ApplicationDB();
	    Connection con = db.getConnection();       
	
	    //Create a SQL statement
	    Statement stmt = con.createStatement();
	    //Get the user id from the login.jsp
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    //Make a SELECT query from user table where username and password matche from the login parameter.
	    String str = "SELECT * FROM user WHERE username ='"+ username +"'  and pwd ='"+password+"'";
	   
	    //Run the query against the database.
	    ResultSet result = stmt.executeQuery(str);
	 	 //parse out the results
	    if(result.next()){
	    		session.setAttribute("userId", result.getString("userID")); // the username will be stored in the session  
	    		session.setAttribute("firstName", result.getString("fname"));
	    		response.sendRedirect("../pages/homepage.jsp");
	    }else{
	    		session.setAttribute("failAuth", "false");
	    		response.sendRedirect("../");
	    }
	 	 
        //close the connection.
        db.closeConnection(con);
	}catch (Exception e) {
        out.print(e);
    	}
%>