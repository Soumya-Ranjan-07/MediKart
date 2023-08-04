<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	int medicineId = Integer.parseInt(request.getParameter("medicineId"));
	int quantity=Integer.parseInt(request.getParameter("quantity"));
	int removeCartMedicine = DatabaseConnection.insertUpdateFromSqlQuery("delete from tblcart where medicine_id='"+ medicineId + "' and customer_id='" + session.getAttribute("customerId") + "'");
	if (removeCartMedicine > 0) {
		response.sendRedirect("customer-cart.jsp");
	} else {
		response.sendRedirect("customer-cart.jsp");
	}
%>