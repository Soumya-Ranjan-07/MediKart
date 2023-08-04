<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>My Profile - Medi Kart | An E-Pharmacy Management</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">


<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<div class="site-wrap">
		<div class="site-navbar py-2">

			<div class="search-wrap">
				<div class="container-fluid">
					<a href="#" class="search-close js-search-close"><span
						class="icon-close2"></span></a>
					<form action="#" method="post">
						<input type="text" class="form-control"
							placeholder="Search keyword and hit enter...">
					</form>
				</div>
			</div>

			<div class="container-lg">
				<jsp:include page="front-side-header.jsp"></jsp:include>
			</div>
		</div>

		<div class="bg-light py-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html" class="text-warning">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Customer Profile</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12 bg-warning">
						<div class="panel panel-warning shadow p-3 mb-5">
							<div class="panel-heading">My Profile</div>
							<div class="panel-body">
								<%
									String message = (String) session.getAttribute("success");
									if (message != null) {
										session.removeAttribute("success");
								%>
								<div class='alert alert-success' id='success'>Profile
									updated successfully.</div>
								<%
									}
								%>
								<form action="CustomerEditProfile" method="post">
									<div class="form-row">
										<%
											ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where uname='" + session.getAttribute("uname") + "' OR email_id='"+session.getAttribute("email")+"'");
											if (resultset.next()) {
										%>
										<div class="form-group col-md-6">
											<label for="customerId">Customer Id:</label> <input
												type="text" class="form-control" id="customerId"
												placeholder="Customer Id" name="customerId"
												value="<%=resultset.getInt("id")%>" readonly>
										</div>
										<div class="form-group col-md-6"">
											<label for="cname">Full Name:</label> <input type="text"
												class="form-control" id="cname" placeholder="Full Name"
												name="cname" value="<%=resultset.getString("full_name")%>">
										</div>
									</div>
									<div class="form-row bg-light">
										<div class="form-group col-md-6">
											<label for="email">Email Id:</label> <input type="text"
												class="form-control" id="email" placeholder="Email Id"
												name="email" value="<%=resultset.getString("email_id")%>" readonly>
										</div>
										<div class="form-group col-md-6">
											<label for="mobile">Mobile No:</label> <input type="text"
												class="form-control" id="mobile" placeholder="Mobile No"
												name="mobile" value="<%=resultset.getString("mobile_no")%>">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-12">
											<label for="address">Address:</label>
											<textarea class="form-control" id="address"
												placeholder="Address" name="address"><%=resultset.getString("address")%></textarea>
										</div>
									</div>
									<div class="form-row bg-light">
										<div class="form-group col-md-6">
											<label for="pincode">Pincode:</label> <input type="text"
												class="form-control" id="pincode"
												placeholder="Enter Pincode" name="pincode" value="<%=resultset.getString("pincode")%>">
										</div>
										<div class="form-group col-md-6">
											<label for="uname">User Name:</label> <input type="text"
												class="form-control" id="uname" placeholder="Enter username"
												name="uname" value="<%=resultset.getString("uname")%>" readonly>
										</div>
									</div>
									<input type="submit" value="Update Profile"
										class="btn btn-primary btn-lg btn-block">
									<%
										}
									%>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="site-footer bg-light">
			<jsp:include page="front-side-footer.jsp"></jsp:include>
		</footer>
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
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
		response.sendRedirect("customer-login.jsp");
	 }
	%>
</body>
</html>