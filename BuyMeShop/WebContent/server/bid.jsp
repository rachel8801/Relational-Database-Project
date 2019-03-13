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
		String bidPrice = request.getParameter("placeBid");
		String buyerId = (String) session.getAttribute("userId");
		
		String rs = "SELECT * FROM AUCTION WHERE PID = "+productId+" and buyer_offer_price >"+bidPrice;
		ResultSet result = stmt.executeQuery(rs);
		String referer = request.getHeader("Referer");
		if(result.next()){
			session.setAttribute("notifyOnPage", "Your bid price is lower than the current bid price.");
			response.sendRedirect(referer);
		}else{
			rs = "INSERT INTO`AUCTION`(buyer_ID, seller_ID, buyer_offer_price, PID)VALUES('"+buyerId+"','"+sellerId+"','"+bidPrice +"','" +productId+ "');";
			int i = stmt.executeUpdate(rs);
			if(i > 0){
				session.setAttribute("notifyOnPage", "Your have placed bid on item #"+productId+" for $"+bidPrice+"");
				response.sendRedirect(referer);
			}
		}
		
		db.closeConnection(con);
	}catch (Exception e) {
		out.print(e);
	}
%>