<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Search Product - Medi Kart | An E-Pharmacy Management</title>
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
						<a href="index.jsp" class="text-warning">Home</a><span
							class="mx-2 mb-0">/</span> <strong class="text-black">Search
							Product</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section" style="width: 50%; margin: auto;">
			<div class="container">
				<div class="row">
					<form action="customer-search-product.jsp" method="post">
						<div class="form-group row">
							<div class="col-md-10">
								<input type="search" name="search" class="form-control"
									placeholder="Enter Product Name">
							</div>
							<div class="col-md-2">
								<input type="submit" value="Search Product"
									class="btn btn-warning">
							</div>
						</div>
					</form>
				</div>
				<br> <br>
				<%
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmedicine where medicine_name like '%" + request.getParameter("search") + "%'");
					while (resultset.next()) {
				%>
				<div class="row">
					<div class="col-md-5 mr-auto">
						<div class="border text-center">
							<img src="uploads/<%=resultset.getString("medicine_image_name")%>" alt="Image"
								class="img-fluid p-5">
						</div>
					</div>
					<div class="col-md-6">
						<h2 class="text-black"><%=resultset.getString("medicine_name") %></h2>
						<p><%=resultset.getString("medicine_description") %></p>
						<p>Manufacturing Date - <%=resultset.getString("medicine_manufacturing_date") %></p>
						<p>Expiry Date - <%=resultset.getString("medicine_expiry_date") %></p>
						<p>
							<del><%=resultset.getDouble("medicine_mrp_price")%></del>
							<strong class="text-primary h4"><%=resultset.getDouble("medicine_discount_price")%>&nbsp;Rs/-</strong>
						</p>
						<!-- <p>
							<a href="cart.html"
								class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary">Add
								To Cart</a>
						</p> -->
					</div>
				</div>
				<%
					}
				%>
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