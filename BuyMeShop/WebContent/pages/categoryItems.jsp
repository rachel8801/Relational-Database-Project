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
	<div class="app-width">
		<ul class="item-list">
			<%
				try{
					//Get the database connection
					ApplicationDB db = new ApplicationDB();	
					Connection con = db.getConnection();		
			
					//Create a SQL statement
					Statement stmt = con.createStatement();
					String entity = request.getParameter("categoryId");
					String str= "SELECT * FROM product LEFT OUTER JOIN (SELECT a.* FROM AUCTION a LEFT OUTER JOIN AUCTION b on a.PID = b.PID AND a.buyer_offer_price < b.buyer_offer_price WHERE b.PID IS NULL ) AUCTION ON product.PID = AUCTION.PID WHERE CID="+entity+";";
				
					ResultSet result = stmt.executeQuery(str);
					while(result.next()){
						out.print("<li class='menu-item'>");
						out.print("<div class='image-wrapper'><img src='../images/item.png'></div>");
						out.print("<div class='item-wrapper'>");
						out.print("<h3>"+result.getString("Pname")+"</h3>");
						out.print("<div class='item-attr'><div class='left-attr'><span class='attr-name'>Condition: </span>"+result.getString("description")+"</div>");
						java.util.Date startDate = new java.util.Date();
						java.util.Date endDate = result.getTimestamp("endTime");
						Long differenceInHours = ((endDate.getTime() - startDate.getTime())/(1000*60*60));
						out.print("<div class='right-attr'><div class='item-attr'><span class='attr-name'>Time left: </span>"+differenceInHours+" hours</div></div>");
						out.print("</div>");
						String bidPrice = result.getString("list_price");
						if(result.getString("buyer_offer_price") != null){
							bidPrice = result.getString("buyer_offer_price");
						}
						out.print("<div class='item-attr'><div class='left-attr'><span class='attr-name'>Current Bid: </span><h4>$"+bidPrice+"</h4></div>");
						if(Objects.equals(result.getString("buyer_ID"), session.getAttribute("userId"))){
							out.print("<div class='right-attr'><div class='item-attr'><span class='attr-name'>You are on the highest bid now.</span></div></div>");
						}else{
							out.print("<form method='post' action='../server/bid.jsp?PID="+result.getString("PID")+"&sellerID="+result.getString("seller_ID")+"' class='form-control'>");
							out.print("<input type='text' class='input-field' name='placeBid' style='border-radius:.25rem'>");
							out.print("<input type='submit' value='Place Bid' class='submit-btn'>");
							out.print("</form></div>");							
						}
						if(result.getString("seller_reservedPrice") != null){
							out.print("<div class='item-attr'><div class='left-attr'><span class='attr-name'>Buy Price: </span><h4>$"+result.getString("seller_reservedPrice")+"</h4></div>");
							out.print("<form method='post' action='../server/addToCart.jsp?PID="+result.getString("PID")+"&sellerID="+result.getString("seller_ID")+"&Pname="+result.getString("Pname")+"' class='form-control'>");
							out.print("<input type='submit' value='Buy It Now' class='submit-btn' style='margin-left:90px'>");							
							out.print("</form></div>");
						}
						out.print("<div class='item-attr'><div class='left-attr'><span class='attr-name'>Shipping Fee: </span> $"+result.getString("shipping_cost")+"</div>");
						out.print("</div></li>");
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