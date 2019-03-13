<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.DateFormat, java.text.SimpleDateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    

<%
	try{
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		//Get the user id from the reg.jsp
	   	String category = request.getParameter("category");
		String itemName = request.getParameter("itemName");
	   	String condition = request.getParameter("condition");
	   	int quantity = Integer.parseInt(request.getParameter("quantity"));
	   	float bidPrice = Float.parseFloat(request.getParameter("bidPrice"));
	  	float sellPrice = Float.parseFloat(request.getParameter("sellPrice"));
	  	float shipping = Float.parseFloat(request.getParameter("shipping"));
	  	int endTimeDates = Integer.parseInt(request.getParameter("endTimeDates"));
	  	String sellerID = (String) session.getAttribute("userId");
		
	  	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  	java.util.Date startDate = new java.util.Date();
	  	Calendar c = Calendar.getInstance();
	  	c.add(Calendar.DATE, endTimeDates);
	  	java.util.Date endDate = c.getTime();
	  	
	  	
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String referer = request.getHeader("Referer");
		String q = "INSERT INTO `product` "+
				"(CID, seller_ID, Pname, list_price, seller_reservedPrice, quantity, description, startTime, endTime, shipping_cost)"+
				"VALUES("+category+", "+sellerID+", '"+itemName+"', "+bidPrice+", "+sellPrice+
						", "+quantity+",'"+condition+"','"+dateFormat.format(startDate)+"','"+dateFormat.format(endDate)+"',"+shipping+");";
		System.out.println(q);
		int i = stmt.executeUpdate(q);
		if(i>0){
			session.setAttribute("notifyOnPage", "Your auction is created success.");
	       	response.sendRedirect("../pages/homepage.jsp");
		 } else {
			session.setAttribute("notifyOnPage", "Your auction is Not created, Please try again.");
			response.sendRedirect(referer);
		}
		db.closeConnection(con);
	}catch (Exception e) {
        out.print(e);
    	}
%>