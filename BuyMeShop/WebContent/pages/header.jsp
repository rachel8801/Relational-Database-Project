<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if (session.getAttribute("userId") == null) {
		response.sendRedirect("../");
	}
%>
<div class="top-nav">
	<div class="app-width">
		<div class="app-log-thumb"></div>
		<div class="notification-bar">
			<%
				String notify = (String) session.getAttribute("notifyOnPage");
				if ( notify != null) {
					out.print("<label>"+notify+"</label>");
					session.removeAttribute("notifyOnPage");
				}
			%>		
		</div>
		<div class="user-bar">
			<span class="nav-message"><a href='../pages/messages.jsp'>Messages</a></span>
			<label class="nav-user">Hi <%= session.getAttribute("firstName") %></label>
			<span class="logout"><a href='../server/logout.jsp'>Logout</a></span>
		</div>	
	</div>
</div>
<div class="mid-nav">
	<div class="app-width">
		<div class="logo">
			<h2>Buy Me Shop</h2>
		</div>
		<div class="post-auction-btn"><a href='../pages/auction.jsp'>Sell Now</a></div>
		<ul class="main-menu">
			<li class="menu-item"><a href='../pages/homepage.jsp'>Home</a></li>
			<%@ include file="../server/categoryList.jsp" %>
		</ul>	
	</div>
</div>