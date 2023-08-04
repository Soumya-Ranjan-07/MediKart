<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Change Password - Medi Kart | An E-Pharmacy Management</title>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Change Password</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<img src="images/change_password.jpg"
							style="width: 550px; height: 300px;"></img>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 bg-warning">
						<div class="panel panel-warning shadow p-3 mb-5">
							<div class="panel-heading">Customer Change Password</div>
							<div class="panel-body">
								<%
									String message = (String) session.getAttribute("password-change-success");
									if (message != null) {
										session.removeAttribute("password-change-success");
								%>
								<div class='alert alert-success' id='success'>Password
									change successfully.</div>
								<%
									}
								%>
								<%
									String fail = (String) session.getAttribute("password-change-fail");
									if (fail != null) {
										session.removeAttribute("password-change-fail");
								%>
								<div class="alert alert-danger" id='danger'>Old password
									does not match..</div>
								<%
									}
								%>
								<%
									String passwordConfirm = (String) session.getAttribute("password-not-match");
									if (passwordConfirm != null) {
										session.removeAttribute("password-not-match");
								%>
								<div class="alert alert-warning" id='danger'>New password
									and confirm password does not match.</div>
								<%
									}
								%>
								<form action="CustomerChangePassword" method="post">
									<%
										ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where uname='"+ session.getAttribute("uname") + "' and email_id='" + session.getAttribute("email") + "'");
										if (resultset.next()) {
									%>
									<div class="form-group">
										<label for="cpassword">Current Password:</label> <input
											type="password" class="form-control" id="cpassword"
											placeholder="Current Password" name="cpassword"
											value="<%=resultset.getString("upass")%>">
									</div>
									<div class="form-group">
										<label for="password">New Password:</label> <input
											type="password" class="form-control" id="password"
											placeholder="New Password" name="password" required>
									</div>

									<div class="form-group">
										<label for="confpass">Confirm Password</label> <input
											type="password" class="form-control" id="confpass"
											placeholder="Confirm Password" name="confpass" required>
									</div>

									<input type="submit" value="Change Password"
										class="btn btn-primary"> <input type="reset"
										class="btn btn-danger" value="Cancel">
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