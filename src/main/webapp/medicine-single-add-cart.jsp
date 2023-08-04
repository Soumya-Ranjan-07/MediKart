<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>View Medicine - Medi Kart | An E-Pharmacy Management</title>
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
						<a href="index.jsp" class="text-warning">Home</a> <span class="mx-2 mb-0">/</span><strong class="text-black">View Medicine</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">
				<%
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmedicine where id='" + request.getParameter("id") + "'");
					if (resultset.next()) {
				%>
				<form action="AddProductsToCart" method="post">
					<div class="row">
						<div class="col-md-5 mr-auto">
							<div class="border text-center">
								<input type="hidden" name="medicineId"
									value="<%=resultset.getInt("id")%>"> <img
									src="uploads/<%=resultset.getString("medicine_image_name")%>"
									alt="Image" class="img-fluid p-5">
							</div>
						</div>
						<div class="col-md-6">
							<h4 class="text-black"><%=resultset.getString("medicine_name")%></h4>
							<p><%=resultset.getString("medicine_description")%></p>
							<input type="hidden" name="mrp_price"
								value="<%=resultset.getDouble("medicine_mrp_price")%>">
							<input type="hidden" name="discount_price"
								value="<%=resultset.getDouble("medicine_discount_price")%>">
							<p>
								<del class="bg-light text-danger"><%=resultset.getDouble("medicine_mrp_price")%>
									Rs/-
								</del>
								&nbsp; <strong class="text-primary h4">Rs.&nbsp;<%=resultset.getDouble("medicine_discount_price")%>
									/-</strong>
							</p>
							<p>
								Manufacturing Date -
								<%=resultset.getString("medicine_manufacturing_date")%></p>
							<p>
								Expiry Date -
								<%=resultset.getString("medicine_expiry_date")%></p>
							<p>
								<input type="submit" value="Add to cart"
									class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary"
									onclick="return confirm('Are you sure Do you want to add this item in cart?');">
							</p>
						</div>
					</div>
				</form>
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