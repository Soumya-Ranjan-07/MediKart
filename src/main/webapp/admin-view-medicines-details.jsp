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
						<i class="fa fa-medkit"></i> View Medicine Details
						</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="x_panel">
				<div class="x_title">
					<h2>Medicine Information</h2>
					<div class="clearfix"></div>
				</div>
				<%
					int id=Integer.parseInt(request.getParameter("medicineId"));
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmedicine where id='"+id+"'");
					while (resultset.next()) {
				%>
				<div class="x_content shadow p-3 mb-5">
					<form role="form" action="">
						<div class="form-row">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Medicine Id</label> <input class="form-control"
										type="text" name="medicineId" value="<%=resultset.getInt("id")%>" readonly>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Select Medicine Type</label> <input type="text"
										class="form-control" name="mType" value="<%=resultset.getString("medicine_type")%>" readonly>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 col-sm-12">
								<div class="form-group">
									<label>Medicine Name</label> <input class="form-control"
										type="text" name="mName" value="<%=resultset.getString("medicine_name")%>" readonly>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 col-sm-12">
								<div class="form-group">
									<label>Medicine Description</label>
									<textarea class="form-control" name="mDescription" value="" readonly><%=resultset.getString("medicine_description")%></textarea>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Purchase Price</label> <input class="form-control"
										type="text" name="mPrice" value="<%=resultset.getDouble("medicine_mrp_price")%>" readonly>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Discount Price</label> <input class="form-control"
										type="text" name="mDiscPrice" value="<%=resultset.getDouble("medicine_discount_price")%>" readonly>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Quantity</label> <input class="form-control" type="text"
										name="mQuantity" value="<%=resultset.getInt("medicine_quantity")%>" readonly>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Manufacturing Date</label> <input class="form-control"
										type="text" name="mDate" value="<%=resultset.getString("medicine_manufacturing_date")%>" readonly>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Expiry Date</label> <input class="form-control"
										type="text" name="eDate" value="<%=resultset.getString("medicine_expiry_date")%>" readonly>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Status</label> <input type="text" class="form-control"
										name="mStatus" value="<%=resultset.getString("medicine_status") %>" readonly>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 col-sm-12">
								<div class="form-group">
									<label>Medicine Image</label> <image src="uploads/<%=resultset.getString("medicine_image_name")%>"
													width="100" height="70"></image>
								</div>
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
