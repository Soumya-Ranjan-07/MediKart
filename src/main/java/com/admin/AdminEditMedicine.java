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
 * Servlet implementation class AdminEditMedicine
 */
@WebServlet("/AdminEditMedicine")
public class AdminEditMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int medicineId = Integer.parseInt(request.getParameter("medicineId"));
		String mType = request.getParameter("mType");
		String mName = request.getParameter("mName");
		String mDescription = request.getParameter("mDescription");
		Double mPrice = Double.parseDouble(request.getParameter("mPrice"));
		Double mDiscPrice = Double.parseDouble(request.getParameter("mDiscPrice"));
		int mQuantity = Integer.parseInt(request.getParameter("mQuantity"));
		String mDate = request.getParameter("mDate");
		String eDate = request.getParameter("eDate");
		String mStatus = request.getParameter("mStatus");
		HttpSession hs=request.getSession();

		if (medicineId != 0) {
			int updateMedicine = DatabaseConnection.insertUpdateFromSqlQuery("update tblmedicine set medicine_name='" + mName + "',medicine_type='"
							+ mType + "',medicine_description='" + mDescription + "',medicine_mrp_price='" + mPrice
							+ "',medicine_discount_price='" + mDiscPrice + "',medicine_quantity='" + mQuantity
							+ "',medicine_manufacturing_date='" + mDate + "',medicine_expiry_date='" + eDate
							+ "',medicine_status='" + mStatus + "' where id='" + medicineId + "'");
			if (updateMedicine > 0) {
				String editmessage="Medicine data updated";
				hs.setAttribute("success", editmessage);
				response.sendRedirect("admin-view-medicines.jsp");
			}

		} else {
			String editmessage="There is a problem in updating medicine data.";
			hs.setAttribute("success", editmessage);
			response.sendRedirect("admin-view-medicines.jsp");
		}
	}

}
