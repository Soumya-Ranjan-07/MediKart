<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Customer Account - Medi Kart | An E-Pharmacy Management</title>
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
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html" class="text-warning">Home</a> <span
							class="mx-2 mb-0">/</span> <strong class="text-black">Create
							Customer Account</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section py-5">
			<div class="container">
				<%
				String customerAccount = (String) session.getAttribute("customer-account");
				if (customerAccount != null) {
					String message = (String)session.getAttribute("customer-account");
					session.removeAttribute("customer-account");
				%>
				<div class="alert alert-info" id="info"><%=message %></div>
				<%
				}
				%>

				<div class="row py-3 bg-warning">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-warning shadow p-3 mb-5">
							<div class="panel-heading"
								style="text-align: center; font-size: 18px">Customer
								Account</div>
							<div class="panel-body">
								<form action="CustomerAccount" method="post" name="customerForm">
									<div class="form-row">
										<%
										int customerId = DatabaseConnection.generateCustomerId();
										%>
										<div class="form-group col-md-6">
											<label for="customerId">Customer Id:</label> <input
												type="text" class="form-control" id="customerId"
												placeholder="Customer Id" name="customerId"
												value="<%=customerId%>" readonly>
										</div>
										<div class="form-group col-md-6"">
											<label for="cname">Full Name:</label> <input type="text"
												class="form-control" id="cname" placeholder="Full Name"
												name="cname" pattern="^[a-zA-Z ]*$" required="required"
												required title="Only letters and spaces allowed">
										</div>
									</div>
									<div class="form-row bg-light">
										<div class="form-group col-md-6">
											<label for="email">Email Id:</label> <input type="text"
												class="form-control" id="email" placeholder="Email Id"
												name="email" required="required"
												pattern="^.+@[^\.].*\.[a-z]{2,}$" required
												title="Type validated e-mail">
										</div>
										<div class="form-group col-md-6">
											<label for="mobile">Mobile No:</label> <input type="text"
												class="form-control" id="mobile" placeholder="Mobile No"
												name="mobile" required minlength="10" maxlength="10"
												pattern="[6-9][0-9]{9}" required title="Type validated indian mobile no. having 10 digits">
										</div>
									</div>
									<div class="form-group">
										<label for="gender">Select Gender:</label> <select
											class="form-control" id="gender" name="gender">
											<option>Male</option>
											<option>Female</option>
										</select>
									</div>

									<div class="form-row bg-light">
										<div class="form-group col-md-6">
											<label for="address">Address:</label>
											<textarea class="form-control" id="address"
												placeholder="Address" name="address" required maxlength="60"
												pattern="^(?=\S*\s)(?=[^a-zA-Z]*[a-zA-Z])(?=\D*\d)[a-zA-Z\d\s',.#/-]*$"
												required title="type proper address"></textarea>
										</div>
										<div class="form-group col-md-6">
											<label for="pincode">Pincode:</label> <input type="text"
												class="form-control" id="pincode"
												placeholder="Enter Pincode" name="pincode" required
												pattern="^[1-9][0-9]{5}$" minlength="6" maxlength="6"
												required title="Give proper pincode having 6digits and doesn't starts with 0">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="uname">User Name:</label> <input type="text"
												class="form-control" id="uname" placeholder="Enter username"
												name="uname" required
												pattern="^(?=.{6,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"
												required
												title="Username is 6-20 characters long, no _ or . at the
													   beginning, no __ or _. or ._ or .. inside, and no _ or . at the end">
										</div>
										<div class="form-group col-md-6">
											<label for="upass">Password:</label> <input type="password"
												class="form-control" id="upass" placeholder="Enter password"
												name="upass"
												pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
												required
												title="Minimum eight characters, at least one uppercase letter,
								 								one lowercase letter, one number and one special character"
												required="required">
										</div>
									</div>
									<div width="100%"
										; style="display: flex; justify-content: space-around">
										<input style="padding: 10px 100px 10px 100px" type="submit"
											value="Create Account" class="btn btn-primary btn-lg">
										<input style="padding: 10px 147px 10px 147px" type="reset"
											class="btn btn-danger btn-lg" value="Cancel">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<p>
					<strong>Important Note -</strong>
				</p>
				<p>1) Name,User Name only allowed in character format.</p>
				<p>2) Password length is minimum 8 characters, at least one
					uppercase letter, one lowercase letter, one number and one special
					character.</p>
				<p>3) 10 digit mobile number allowed only.</p>
				<p>4) Username is 6-20 characters long, no _ or . at the
					beginning, no __ or _. or ._ or .. inside, and no _ or . at the end</p>
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
</body>
</html>