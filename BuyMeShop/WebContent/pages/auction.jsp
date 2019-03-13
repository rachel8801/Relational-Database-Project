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
		<form method="post" action="../server/createAuction.jsp" class="form-control">
			<h3>Please Enter Your Item Info</h3>
			<div class="row">
				<label>Category</label>
				<select name="category" class="input-field" style="height: 34px;">
					<option value="1">Sports Gear</option>
					<option value="2">Sports Apparel</option>
					<option value="3">Sports Drink</option>
					<option value="4">Footwear</option>
				</select>
			</div>			
			<div class="row">
				<label>Title</label>
				<input type="text" class="input-field" name="itemName" style="border-radius:.25rem">
			</div>
			<div class="row">
				<label>Condition</label>
				<select name="condition" class="input-field" style="height: 34px;">
					<option value="new">New</option>
					<option value="used">Used</option>
				</select>
			</div>
			<div class="row">
				<label>Quantity</label>
				<input type="number" min="0" class="input-field" name="quantity" style="border-radius:.25rem">
			</div>						
			<div class="row">
				<label>Auction starting bid</label>
				<input type="number" min="0" class="input-field" name="bidPrice" style="border-radius:.25rem">
			</div>
			<div class="row">
				<label>Buy It Now price</label>
				<input type="number" min="0" class="input-field" name="sellPrice" style="border-radius:.25rem">
			</div>
			<div class="row">
				<label>Shipping fee (Optional)</label>
				<input type="number" class="input-field" name="shipping" style="border-radius:.25rem">
			</div>
			<div class="row">
				<label>Expire in dates </label>
				<input type="number" min="1" max="7" class="input-field" name="endTimeDates" style="border-radius:.25rem">
			</div>							
			<div class="row">
				<input type="submit" value="List now" class="submit-btn">
			</div>	
		</form>	
	</div>
</body>
</html>