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
						<i class="fa fa-user"></i>&nbsp;View Customers
					</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<%
				String deleteCustomer = (String) session.getAttribute("customer");
				if (deleteCustomer != null) {
				session.removeAttribute("customer");
			%>
			<div class="alert alert-danger" id="danger">Customer deleted.</div>
			<%
				}
			%>
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>List of Customers</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content shadow p-3 mb-5">
							<table id="datatable" class="table table-striped table-bordered"
								style="width: 100%">
								<thead>
									<tr>
										<th>#</th>
										<th>Full Name</th>
										<th>Email Id</th>
										<th>Mobile No</th>
										<th>Gender</th>
										<th>Address</th>
										<th>Pincode</th>
										<th>Action</th>
									</tr>
								</thead>
								<%
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer");
									while (resultset.next()) {
								%>
								<tbody>
									<tr>
										<td><%=resultset.getInt("id") %></td>
										<td><%=resultset.getString("full_name") %></td>
										<td><%=resultset.getString("email_id") %></td>
										<td><%=resultset.getString("mobile_no") %></td>
										<td><%=resultset.getString("gender") %></td>
										<td><%=resultset.getString("address") %></td>
										<td><%=resultset.getString("pincode") %></td>
										<td><a href="AdminRemoveCustomers?custId=<%=resultset.getInt("id") %>" class="btn btn-sm btn-danger text-whitez" onclick="return confirm('Are you sure do you want to delete this customer?');"><i class="fa fa-trash"></i> Delete</a>
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
