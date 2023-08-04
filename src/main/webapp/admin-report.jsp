<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="admin-side-header.jsp"></jsp:include>
<body class="nav-md">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="admin-menu-sidebar.jsp"></jsp:include>
	<jsp:include page="admin-menu-footer.jsp"></jsp:include>
	</div>
	</div>
	<jsp:include page="admin-topnav.jsp"></jsp:include>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>
						<i class="fa fa-bar-chart"></i> All Reports
					</h3>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12  ">
					<div class="x_panel">
						<div class="x_title">
							<h2>All Reports</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<!-- graph area -->
							<div class="col-md-12 col-sm-12">
								<table id="table" class="table table-bordered">
									<tbody>
										<form action="AllCustomersReport">
											<tr>
												<th>All Customers Report</th>
												<td><input type="submit" value="Generate Reports"
													class="btn btn-primary"></td>
											</tr>
										</form>
										<form action="AllMedicineOrdersReport">
											<tr>
												<th>Total Orders Report</th>
												<td><input type="submit" value="Generate Reports"
													class="btn btn-info"></td>
											</tr>
										</form>
										<form action="AllMedicinesReport">
											<tr>
												<th>All Medicines Report</th>
												<td><input type="submit" value="Generate Reports"
													class="btn btn-secondary"></td>
											</tr>
										</form>
										<form action="AllMedicinesSalesReport">
											<tr>
												<th>Sales Report</th>
												<td><input type="submit" value="Generate Reports"
													class="btn btn-warning"></td>
											</tr>
										</form>
										<form action="AllContactsReport">
											<tr>
												<th>Contacts Report</th>
												<td><input type="submit" value="Generate Reports"
													class="btn btn-danger"></td>
											</tr>
										</form>
									</tbody>
								</table>
							</div>
							<!-- /graph area -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<jsp:include page="admin-side-footer.jsp"></jsp:include>
	<%
		} else {
		response.sendRedirect("admin-login.jsp");
	  }
	%>
</body>
</html>
