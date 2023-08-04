<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
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
						<i class="fa fa-medkit"></i> Medicine
					</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<%
				String editmessage = (String) session.getAttribute("success");
				if (editmessage != null) {
				session.removeAttribute("success");
			%>
			<div class="alert alert-info" id="info">Medicine information updated.</div>
			<%
				}
			%>
			<%
				String deleteMedicine = (String) session.getAttribute("medicine");
				if (deleteMedicine != null) {
				session.removeAttribute("medicine");
			%>
			<div class="alert alert-danger" id="danger">Medicine deleted.</div>
			<%
				}
			%>
			<div class="row">
				<div class="col-md-12 col-sm-12  ">
					<div class="x_panel">
						<div class="x_title">
							<h2>List of Medicines</h2>
							<ul class="nav navbar-right panel_toolbox">
								<a href="admin-add-medicine.jsp"
									class="btn btn-sm btn-info text-white"><i
									class="fa fa-plus"></i> Add Medicine</a>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<table id="datatable" class="table table-striped table-bordered"
								style="width: 100%">
								<thead>
									<tr>
										<th>Id</th>
										<th>Image</th>
										<th>Name</th>
										<th>Medicine Type</th>
										<th>Purchase Price</th>
										<th>Discount Price</th>
										<th>Quantity</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>

								<%
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmedicine");
									while (resultset.next()) {
								%>
								<tbody>
									<tr>
										<td><%=resultset.getInt("id")%></td>
										<td><image src="uploads/<%=resultset.getString("medicine_image_name")%>"
												width="100" height="70"></image></td>
										<td><%=resultset.getString("medicine_name")%></td>
										<td><%=resultset.getString("medicine_type")%></td>
										<td><%=resultset.getDouble("medicine_mrp_price")%></td>
										<td><%=resultset.getDouble("medicine_discount_price")%></td>
										<td><%=resultset.getInt("medicine_quantity")%></td>
										<%
											if (resultset.getString("medicine_status").equals("Pending")) {
										%>
										<td><font color="red"><strong>Pending</strong></font></td>
										<%
											} else {
										%>
										<td><font color="green"><strong>Active</strong></font></td>
										<%
											}
										%>
										<td><a
											href="admin-view-medicines-details.jsp?medicineId=<%=resultset.getInt("id")%>"
											class="btn btn-sm btn-info text-white"><i
												class="fa fa-eye"></i> details</a> <a
											href="admin-edit-medicine-details.jsp?medicineId=<%=resultset.getInt("id")%>"
											class="btn btn-sm btn-success text-white"><i
												class="fa fa-edit"></i> edit</a> <a
											href="AdminRemoveMedicine?medicineId=<%=resultset.getInt("id")%>"
											class="btn btn-sm btn-danger text-white" onclick="return confirm('Are you sure do you want to delete this medicine?');"><i
												class="fa fa-trash"></i> delete</a></td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
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