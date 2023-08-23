<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Contact - Medi Kart | An E-Pharmacy Management</title>
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
		<div class="bg-light py-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.jsp" class="text-warning">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Contact</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="h3 mb-5 text-black">Get In <span class="text-warning">Touch</span></h2>
					</div>
					<div class="col-md-12 shadow p-3 mb-5 bg-warning">
						<form action="Contact" method="post">
							<div class="p-3 p-lg-5 border bg-light">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="fullname" class="text-black">Name <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="fullname" name="fullname">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-6">
										<label for="email" class="text-black">Email <span
											class="text-danger">*</span></label> <input type="email"
											class="form-control" id="email" name="email"
											placeholder="">
									</div>
									<div class="col-md-6">
										<label for="phone" class="text-black">Mobile No <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="phone" name="phone"
											placeholder="">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-12">
										<label for="subject" class="text-black">Subject </label> <input
											type="text" class="form-control" id="subject"
											name="subject">
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="message" class="text-black">Message </label>
										<textarea name="message" id="message" cols="30" rows="7"
											class="form-control"></textarea>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-12">
										<input type="submit" class="btn btn-warning btn-lg btn-block"
											value="Send Message">
									</div>
								</div>
							</div>
						</form>
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
</body>
</html>
