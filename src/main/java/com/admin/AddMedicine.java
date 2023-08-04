package com.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddMedicine
 */
@WebServlet("/AddMedicine")
public class AddMedicine extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "C:/Users/dell/Desktop/Adv java-Nagoor Babu/JDBC/ECLIPSE/MediKart/src/main/webapp/uploads/";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName = null;
				String medicineId = null;
				String medicineName = null;
				String medicineType = null;
				String medicineDescription = null;
				String medicineMrpPrice = null;
				String medicineDiscountPrice = null;
				String medicineQuantity = null;
				String medicineManufacturingDate = null;
				String medicineExpiryDate = null;
				String medicineStatus = null;

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						imageName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));

						FileItem mId = (FileItem) multiparts.get(0);
						medicineId = mId.getString();

						FileItem mType = (FileItem) multiparts.get(1);
						medicineType = mType.getString();

						FileItem mName = (FileItem) multiparts.get(2);
						medicineName = mName.getString();

						FileItem mDescription = (FileItem) multiparts.get(3);
						medicineDescription = mDescription.getString();

						FileItem mPrice = (FileItem) multiparts.get(4);
						medicineMrpPrice = mPrice.getString();

						FileItem mDiscPrice = (FileItem) multiparts.get(5);
						medicineDiscountPrice = mDiscPrice.getString();

						FileItem mQuantity = (FileItem) multiparts.get(6);
						medicineQuantity = mQuantity.getString();

						FileItem mDate = (FileItem) multiparts.get(7);
						medicineManufacturingDate = mDate.getString();

						FileItem eDate = (FileItem) multiparts.get(8);
						medicineExpiryDate = eDate.getString();

						FileItem mStatus = (FileItem) multiparts.get(9);
						medicineStatus = mStatus.getString();
					}
				}
				try {
					int id = 0;
					String imagePath = UPLOAD_DIRECTORY + imageName;
					int i = DatabaseConnection.insertUpdateFromSqlQuery(
							"insert into tblmedicine(id,medicine_name,medicine_type,medicine_description,medicine_image_name,medicine_image,medicine_mrp_price,medicine_discount_price,medicine_quantity,medicine_manufacturing_date,medicine_expiry_date,medicine_status) values('"
									+ medicineId + "','" + medicineName + "','" + medicineType + "','" + medicineDescription
									+ "','" + imageName + "','" + imagePath + "','"
									+ medicineMrpPrice + "','" + medicineDiscountPrice + "','" + medicineQuantity
									+ "','" + medicineManufacturingDate + "','" + medicineExpiryDate + "','"
									+ medicineStatus + "')");
					if (i > 0) {
						String success = "Medicine added successfully.";
						session.setAttribute("message", success);
						response.sendRedirect("admin-add-medicine.jsp");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}
}