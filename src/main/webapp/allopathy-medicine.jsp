<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Allopathy Medicine - Medi Kart | An E-Pharmacy Management</title>
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
						<a href="index.jsp" class="text-warning">Home</a> <span class="mx-2 mb-0">/</span>
						<strong class="text-black">Allopathy Medicines</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section bg-warning">
			<div class="container">
				<div class="row shadow p-3 mb-5 bg-light">
					<%
						ResultSet resultMedicine = DatabaseConnection.getResultFromSqlQuery("select * from tblmedicine where medicine_type='Allopathy Medicines'");
						while (resultMedicine.next()) {
					%>
					<div class="col-sm-6 col-lg-4 text-center item mb-4 item-v2">
						<a href="medicine-single-add-cart.jsp?id=<%=resultMedicine.getInt("id")%>"> <img src="uploads/<%=resultMedicine.getString("medicine_image_name")%>"
							alt="Image" style="width:180px;height:200px;"></a>
						<h3 class="text-dark">
							<a href="medicine-single-add-cart.jsp?id=<%=resultMedicine.getInt("id")%>"><%=resultMedicine.getString("medicine_name") %></a>
						</h3>
						<p class="price">
							<del class="bg-light text-danger">Rs&nbsp;<%=resultMedicine.getDouble("medicine_mrp_price") %>/-</del>
							Rs&nbsp; <%=resultMedicine.getDouble("medicine_discount_price") %>/-
						</p>
					</div>
					<%
						}
					%>
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