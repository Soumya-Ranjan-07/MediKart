package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminRemoveMedicine
 */
@WebServlet("/AdminRemoveMedicine")
public class AdminRemoveMedicine extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int medicineId = Integer.parseInt(request.getParameter("medicineId"));
		HttpSession hs=request.getSession();
		int removeCustomer = DatabaseConnection.insertUpdateFromSqlQuery("delete from tblmedicine where id='" + medicineId + "'");
		if (removeCustomer > 0) {
			String message="Medicine deleted";
			hs.setAttribute("medicine", message);
			response.sendRedirect("admin-view-medicines.jsp");
		} else {
			response.sendRedirect("admin-view-medicines.jsp");
		}
	}

}
