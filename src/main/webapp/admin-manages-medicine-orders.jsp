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
						<i class="fa fa-truck"></i> All Orders
					</h3>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12  ">
					<div class="x_panel">
						<div class="x_title">
							<h2>List of Orders</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<table id="datatable" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>Order No</th>
										<th>Customer Details</th>
										<th>Medicine</th>
										<th>Qty</th>
										<th>Total Amount</th>
										<th>Status</th>
										<th>View Details</th>
									</tr>
								</thead>
								<%
									ResultSet resultOrders = DatabaseConnection.getResultFromSqlQuery("select * from tblorder");
									while (resultOrders.next()) {
								%>
								<tbody>
									<tr>
										<td><%=resultOrders.getInt("id")%></td>
										<td><%=resultOrders.getInt("order_no")%></td>
										<td><%=resultOrders.getString(3)%>|<%=resultOrders.getString(4)%>|<%=resultOrders.getString(5)%>|<%=resultOrders.getString(6)%>|<%=resultOrders.getString(7)%></td>
										<td><img src="uploads/<%=resultOrders.getString("medicine_image_name")%>"
											alt="" class="pro-image-front"
											style="width: 120px; height: 80px;"><br><%=resultOrders.getString("medicine_name")%></td>
										<td><%=resultOrders.getString("quantity")%></td>
										<td><%=resultOrders.getString("medicine_total_price")%></td>
										<%
											if (resultOrders.getString("medicine_order_status").equals("Delivered")) {
										%>
											<td><font color="green"><strong>Delivered</strong></font></td>
										<%
											} else if(resultOrders.getString("medicine_order_status").equals("Pending")) {
										%>
											<td><font color="red"><strong>Pending</strong></font></td>
										<%
											}else  {
										%>
											<td><font color="blue"><strong>In Process</strong></font></td>
										<%
											}
										%>
										<td><a href="admin-manages-medicine-orders-details.jsp?orderNo=<%=resultOrders.getInt("order_no")%>" class="btn btn-info">View Details</a></td>
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
