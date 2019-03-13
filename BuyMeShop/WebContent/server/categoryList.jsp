<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	try{
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		

		//Create a SQL statement
		Statement stmt = con.createStatement();
		String str= "SELECT * FROM category order by categoryID;";
	
		ResultSet result = stmt.executeQuery(str);
		while(result.next()){
			out.print("<li class='menu-item'><a href='../pages/categoryItems.jsp?categoryId="+result.getString("categoryID")+"'>"+result.getString("categoryname")+"</a></li>");
		}
		db.closeConnection(con);
	}catch (Exception e) {
		out.print(e);
	}
%>