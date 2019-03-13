<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try {
		session.invalidate();
		response.sendRedirect("../");
	}
catch(Exception e){
	out.print("OOSPIE WOOPSIE!!");
}
%>