<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		

		//Create a SQL statement
		Statement stmt = con.createStatement();
		String productId = request.getParameter("PID");
		String sellerId = request.getParameter("sellerID");
		String Pname = request.getParameter("Pname");
		String buyerId = (String) session.getAttribute("userId");
		
		String rs = "INSERT INTO`order`(buyer_ID, seller_ID, PID, Pname)VALUES('"+buyerId+"','"+sellerId+"','"+productId +"','" +Pname+ "');";
		System.out.println(rs);
		int i = stmt.executeUpdate(rs);
		String referer = request.getHeader("Referer");
		if(i > 0){
			session.setAttribute("notifyOnPage", "Your have placed order on item #"+productId);
			response.sendRedirect(referer);
		}else {
			session.setAttribute("notifyOnPage", "Error: Your order is not placed. Please try again.");
			response.sendRedirect(referer);			
		}
		
		db.closeConnection(con);
	}catch (Exception e) {
		out.print(e);
	}
%>