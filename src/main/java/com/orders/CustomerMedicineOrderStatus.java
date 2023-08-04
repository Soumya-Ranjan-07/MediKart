package com.orders;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.*;
import com.email.EmailUtility;

/**
 * Servlet implementation class CustomerProductsOrderStatus
 */
@WebServlet("/CustomerMedicineOrderStatus")
public class CustomerMedicineOrderStatus extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int statusMode = 0;
		String emailBodyMessage = null;
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		String cname = request.getParameter("cname");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		int pincode = Integer.parseInt(request.getParameter("pincode"));
		String medcineName = request.getParameter("medcineName");
		int medicineQuantity = Integer.parseInt(request.getParameter("medicineQuantity"));
		double medicineMrp = Double.parseDouble(request.getParameter("medicineMrp"));
		double medicineDiscountPrice = Double.parseDouble(request.getParameter("medicineDiscountPrice"));
		double medicineTotalPrice = Double.parseDouble(request.getParameter("medicineTotalPrice"));
		String mStatus = request.getParameter("mStatus");
		try {
			statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblorder set medicine_order_status='"
					+ mStatus + "' where order_no='" + request.getParameter("orderNo") + "'");
			emailBodyMessage = "Hi " + cname + "," + System.lineSeparator() + System.lineSeparator()
					+ "Your Medicine order is '" + mStatus + "' now." + System.lineSeparator() + System.lineSeparator()
					+ "Your Medicine Order Details Is - " + System.lineSeparator() + "Medicine Order No: " + orderNo
					+ System.lineSeparator() + "Medicine Name: " + medcineName + System.lineSeparator()
					+ "Medicine Quantity: " + medicineQuantity + System.lineSeparator()
					+ "Single Medicine Quantity Price: " + medicineMrp + System.lineSeparator()
					+ "Medicine Total Price. " + medicineTotalPrice + System.lineSeparator() + System.lineSeparator()
					+ "E-Pharmacy System.";
		} catch (Exception e) {
			e.printStackTrace();
		}

		String message = "E-Pharmacy System";
		// String content = request.getParameter("content");
		String resultMessage = "";

		PrintWriter out = response.getWriter();
		try {
			EmailUtility.sendEmail(host, port, "your mail id", "password generated from gmail", email, message,
					emailBodyMessage);
			HttpSession session = request.getSession();
			resultMessage = "Your medicine order status send successfully in your email.";
			session.setAttribute("mail-success", resultMessage);
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} finally {
			// request.setAttribute("Message", resultMessage);
			response.sendRedirect("admin-manages-medicine-orders.jsp");
		}
	}
}