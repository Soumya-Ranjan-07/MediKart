package com.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddProductsToCart
 */
@WebServlet("/AddProductsToCart")
public class AddProductsToCart extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		HttpSession hs = request.getSession();
		int medicineId = Integer.parseInt(request.getParameter("medicineId"));
		double mrp_price = Double.parseDouble(request.getParameter("mrp_price"));
		double discount_price = Double.parseDouble(request.getParameter("discount_price"));
		
		try {	
			if ((String) hs.getAttribute("uname") == null) {
				response.sendRedirect("mandatory-customer-login.jsp");
			} else {
				ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcart where medicine_id='" + medicineId + "' and customer_id='"+ hs.getAttribute("customerId")+"'");
				if (resultset.next()) {
					response.sendRedirect("already-medicine-added-in-cart.jsp");
				}else{
					int addToCart = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcart(id,customer_id,medicine_id,medicine_mrp_price,medicine_discount_price,total_medicines_price,quantity) values('"
							+ id + "','" + hs.getAttribute("customerId") + "','" + medicineId + "','" + mrp_price + "','"
							+ discount_price + "','" + discount_price + "',1)");
					if (addToCart > 0) {
						response.sendRedirect("continue-medicine-shopping.jsp");
					}
				}	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
