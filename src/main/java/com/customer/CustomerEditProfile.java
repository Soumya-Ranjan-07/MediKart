package com.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CustomerEditProfile
 */
@WebServlet("/CustomerEditProfile")
public class CustomerEditProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cname=request.getParameter("cname");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String pincode=request.getParameter("pincode");
		HttpSession session=request.getSession();
		
		try {
			int editCustomer=DatabaseConnection.insertUpdateFromSqlQuery("update tblcustomer set full_name='"+cname+"',mobile_no='"+mobile+"',address='"+address+"',pincode='"+pincode+"' where uname='"+session.getAttribute("uname")+"' or email_id='"+session.getAttribute("email")+"'");
			if(editCustomer>0) {
				String message="Customer profile updated successfully.";
				session.setAttribute("success", message);
				response.sendRedirect("customer-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
