package com.customer;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UpdateMedicineQuantity
 */
@WebServlet("/UpdateMedicineQuantity")
public class UpdateMedicineQuantity extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int medicineQuanity = 0;
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int medicineId = Integer.parseInt(request.getParameter("medicineId"));
		HttpSession session = request.getSession();
		double medicine_discount_price = 0.0;
		double productPrice = 0.0;
		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select medicine_quantity from tblmedicine where id='" + medicineId + "'");
			if (resultset.next()) {
				medicineQuanity = resultset.getInt("medicine_quantity");
			}
			if (medicineQuanity > quantity) {
				ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select medicine_discount_price from tblcart where customer_id='"+ session.getAttribute("customerId") + "' and medicine_id='" + medicineId + "'");
				while (rs.next()) {
					medicine_discount_price = Double.parseDouble(rs.getString("medicine_discount_price"));
					productPrice = medicine_discount_price;
				}
				productPrice = productPrice * quantity;
				int updateQuantity = DatabaseConnection.insertUpdateFromSqlQuery("update tblcart set quantity='"+ quantity + "',total_medicines_price='" + productPrice + "' where customer_id='"+ session.getAttribute("customerId") + "' and medicine_id='" + medicineId + "' ");
				//int updateMedicineQuantityInMedicine = DatabaseConnection.insertUpdateFromSqlQuery("update tblmedicine set medicine_quantity= medicine_quantity-'" + quantity+ "' where id='" + medicineId + "'");
				if (updateQuantity > 0) {
					response.sendRedirect("customer-cart.jsp");
				}
			} else {
				String message = "Medicine quantity is not enough to purchase.";
				session.setAttribute("quantity-short", message);
				response.sendRedirect("customer-cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
