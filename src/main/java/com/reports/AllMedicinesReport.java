package com.reports;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class AllMedicinesReport
 */
@WebServlet("/AllMedicinesReport")
public class AllMedicinesReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Font TIME_ROMAN = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
	private static Font TIME_ROMAN_SMALL = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final ServletContext servletContext = request.getSession().getServletContext();
		final File tempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		final String temperotyFilePath = tempDirectory.getAbsolutePath();
		String fileName = "Medicine_Report_" + System.currentTimeMillis() + ".pdf";
		response.setContentType("application/pdf");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "max-age=0");
		response.setHeader("Content-disposition", "attachment; " + "filename=" + fileName);

		try {
			createPDF(temperotyFilePath + "\\" + fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			baos = convertPDFToByteArrayOutputStream(temperotyFilePath + "\\" + fileName);
			OutputStream os = response.getOutputStream();
			baos.writeTo(os);
			os.flush();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	private static ByteArrayOutputStream convertPDFToByteArrayOutputStream(String fileName) {

		InputStream inputStream = null;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {

			inputStream = new FileInputStream(fileName);

			byte[] buffer = new byte[1024];
			baos = new ByteArrayOutputStream();

			int bytesRead;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				baos.write(buffer, 0, bytesRead);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return baos;
	}

	public static Document createPDF(String file) {
		Document document = null;
		try {
			document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(file));
			document.open();
			addMetaData(document);
			addTitlePage(document);
			createTable(document);
			document.close();

		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return document;

	}

	private static void addMetaData(Document document) {
		document.addTitle("Generate PDF report");
		document.addSubject("Generate PDF report");
		document.addAuthor("Sayali Kurkute");
		document.addCreator("Rutuja Lembhe");
	}

	private static void addTitlePage(Document document) throws DocumentException {

		Paragraph preface = new Paragraph();
		creteEmptyLine(preface, 1);
		preface.add(new Paragraph("Medicines Report ", TIME_ROMAN));

		creteEmptyLine(preface, 1);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		preface.add(
				new Paragraph("Medicines Report on " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));

		document.add(preface);

	}

	private static void creteEmptyLine(Paragraph paragraph, int number) {
		for (int i = 0; i < number; i++) {
			paragraph.add(new Paragraph(" "));
		}
	}

	private static void createTable(Document document) throws DocumentException {

		Paragraph paragraph = new Paragraph();
		creteEmptyLine(paragraph, 2);
		document.add(paragraph);
		PdfPTable table = new PdfPTable(9);

		PdfPCell c1 = new PdfPCell(new Phrase("Medicine Id"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Medicine Name"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Medicine Type"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Medicine Description"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		/*
		 * c1 = new PdfPCell(new Phrase("Medicine Image"));
		 * c1.setHorizontalAlignment(Element.ALIGN_CENTER); table.addCell(c1);
		 */

		c1 = new PdfPCell(new Phrase("Medicine Price"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Discount Price"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Quantity"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Manufacturing Date"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Expiry Date"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		table.setHeaderRows(1);

		PdfPCell[] cells = table.getRow(0).getCells();
		for (int j = 0; j < cells.length; j++) {
			cells[j].setBorderColor(BaseColor.BLACK);
			cells[j].setBackgroundColor(BaseColor.GRAY);
		}

		try {
			PdfPCell TableCell = null;
			table.setWidthPercentage(100);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmedicine");
			while (resultset.next()) {
				String id = resultset.getString("id");
				String medicine_name = resultset.getString("medicine_name");
				String medicine_type = resultset.getString("medicine_type");
				String medicine_description = resultset.getString("medicine_description");
				/* String medicine_image = resultset.getString("medicine_image_name"); */
				String medicine_mrp_price = resultset.getString("medicine_mrp_price");
				String medicine_discount_price = resultset.getString("medicine_discount_price");
				String medicine_quantity = resultset.getString("medicine_quantity");
				String medicine_manufacturing_date = resultset.getString("medicine_manufacturing_date");
				String medicine_expiry_date = resultset.getString("medicine_expiry_date");
				
				TableCell = new PdfPCell(new Phrase(id));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(medicine_name));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(medicine_type));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(medicine_description));
				table.addCell(TableCell);
				/*
				 * TableCell = new PdfPCell(new Phrase(medicine_image));
				 * table.addCell(TableCell);
				 */
				TableCell = new PdfPCell(new Phrase(medicine_mrp_price));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(medicine_discount_price));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(medicine_quantity));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(medicine_manufacturing_date));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(medicine_expiry_date));
				table.addCell(TableCell);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		document.add(table);
	}

}
