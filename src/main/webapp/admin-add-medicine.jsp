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
						<i class="fa fa-medkit"></i> Add Medicine
					</h3>
				</div>
			</div>

			<div class="clearfix"></div>
			<%
				String message = (String) session.getAttribute("message");
			if (message != null) {
				session.removeAttribute("message");
			%>
			<div class="alert alert-success" id="success">Medicine added
				successfully.</div>
			<%
				}
			%>
			<div class="x_panel">
				<div class="x_title">
					<h2>Medicine Information</h2>
					<div class="clearfix"></div>
				</div>
				<%
					String medicine = (String) session.getAttribute("message");
					if (medicine != null) {
						session.removeAttribute("message");
				%>
				<div class="alert alert-info" id="info">New medicine added successfully.</div>
				<%
					}
				%>
				<div class="x_content shadow p-3 mb-5">
					<form role="form" action="AddMedicine" method="post"
						enctype="multipart/form-data">
						<div class="form-row">
							<%
								int medicineId = DatabaseConnection.generateMedicineId();
							%>
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Medicine Id</label> <input class="form-control"
										type="text" name="medicineId" value="<%=medicineId%>" readonly>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label>Select Medicine Type</label> <select
										class="form-control" name="mType">
										<option>Allopathy Medicines</option>
										<option>Ayurveda Products</option>
										<option>Generic Medicines</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 col-sm-12">
								<div class="form-group">
									<label>Medicine Name</label> <input class="form-control"
										type="text" name="mName" placeholder="Medicine Name">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 col-sm-12">
								<div class="form-group">
									<label>Medicine Description</label>
									<textarea class="form-control" name="mDescription"
										placeholder="Medicine Description"></textarea>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Purchase Price</label> <input class="form-control"
										type="text" name="mPrice"
										placeholder="Medicine Purchase Price">
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Discount Price</label> <input class="form-control"
										type="text" name="mDiscPrice"
										placeholder="Medicine Discount Price">
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Quantity</label> <input class="form-control" type="text"
										name="mQuantity" placeholder="Medicine Quantity">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Manufacturing Date</label> <input class="form-control"
										type="date" name="mDate" placeholder="Manufacturing Date">
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Expiry Date</label> <input class="form-control"
										type="date" name="eDate" placeholder="Expiry Date">
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Status</label> <select class="form-control"
										name="mStatus">
										<option>Active</option>
										<option>Pending</option>

									</select>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 col-sm-12">
								<div class="form-group">
									<label>Medicine Image</label> <input type="file"
										name="uploadLogo" class="form-control">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 col-sm-12 ">
								<button type="submit" class="btn btn-info" value="">Add
									Medicine</button>
								<input type="reset" class="btn btn-danger" name="Clear">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<jsp:include page="admin-side-footer.jsp"></jsp:include>
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#warning').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
	<%
		} else {
		response.sendRedirect("admin-login.jsp");
	  }
	%>
</body>
</html>
