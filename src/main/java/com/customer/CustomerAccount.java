package com.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CustomerAccount
 */
@WebServlet("/CustomerAccount")
public class CustomerAccount extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerId=Integer.parseInt(request.getParameter("customerId"));
		String cname=request.getParameter("cname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String pincode=request.getParameter("pincode");
		String uname=request.getParameter("uname");
		String upass=request.getParameter("upass");
		HttpSession hs=request.getSession();
						
		try {
			
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet userCheck = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where uname='" + uname + "' OR email_id = '"+ email +"'");
			
			if (userCheck.next())
			{
				String message="User Name or E-mail already existed";
				hs.setAttribute("customer-account", message);
				response.sendRedirect("customer-account.jsp");
			}
			else {
				int addCustomer=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcustomer(id,full_name,email_id,mobile_no,gender,address,pincode,uname,upass) values('"+customerId+"','"+cname+"','"+email+"','"+mobile+"','"+gender+"','"+address+"','"+pincode+"','"+uname+"','"+upass+"')");
				if(addCustomer>0) {
					String message="Customer account created successfully.";
					hs.setAttribute("customer-account", message);
					response.sendRedirect("customer-account.jsp");
				}
				else {
					String message="Customer account creation failed";
					hs.setAttribute("customer-account", message);
					response.sendRedirect("customer-account.jsp");
				}
			}
		}
		catch(Exception e) {
			String message="Customer account creation failed";
			hs.setAttribute("customer-account", message);
			response.sendRedirect("customer-account.jsp");
		}
	}

}
