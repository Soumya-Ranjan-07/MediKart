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
					<h4>
						<i class="fa fa-medkit"></i> View Medicine Order Details
						</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="x_panel">
				<div class="x_title">
					<h2>Order Details</h2>
					<div class="clearfix"></div>
				</div>
				<%
					int orderNo=Integer.parseInt(request.getParameter("orderNo"));
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblorder where order_no='"+orderNo+"'");
					while (resultset.next()) {
				%>
				<div class="x_content shadow p-3 mb-5">
					<form role="form" action="CustomerMedicineOrderStatus" method="post">
						<div class="form-row">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Order No</label> <input class="form-control"
										type="text" name="orderNo" value="<%=resultset.getInt("order_no")%>" readonly>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Customer Name</label> <input class="form-control"
										type="text" name="cname" value="<%=resultset.getString("customer_name")%>" readonly>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Email Id</label>
									<input type="text" class="form-control" name="email" value="<%=resultset.getString("email_id")%>" readonly>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Mobile No</label> <input class="form-control"
										type="text" name="mobile" value="<%=resultset.getString("mobile_no")%>" readonly>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Address</label> <textarea class="form-control"
										 name="address" value="" readonly><%=resultset.getString("address")%></textarea>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Pincode</label> <input class="form-control" type="text"
										name="pincode" value="<%=resultset.getInt("pincode")%>" readonly>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Medicine Name</label> <input class="form-control"
										type="text" name="medcineName" value="<%=resultset.getString("medicine_name")%>" readonly>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Medicine MRP</label> <input class="form-control"
										type="text" name="medicineMrp" value="<%=resultset.getString("medicine_mrp_price")%>" readonly>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Medicine Discount Price</label> <input class="form-control"
										type="text" name="medicineDiscountPrice" value="<%=resultset.getString("medicine_discount_price")%>" readonly>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Medicine Quantity</label> <input class="form-control"
										type="text" name="medicineQuantity" value="<%=resultset.getString("quantity")%>" readonly>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Medicine Total Price</label> <input class="form-control"
										type="text" name="medicineTotalPrice" value="<%=resultset.getString("medicine_total_price")%>" readonly>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Status</label> <select class="form-control" name="mStatus" value="">
										<option>In Process</option>
										<option>Delivered</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-8 col-sm-8">
								<div class="form-group">
									<label>Medicine Image</label> <image src="uploads/<%=resultset.getString("medicine_image_name")%>"
													width="100" height="70"></image>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 col-sm-12 ">
								<button type="submit" class="btn btn-info">Change Status</button>
							</div>
						</div>
					</form>
				</div>
				<%
					}
				%>
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
