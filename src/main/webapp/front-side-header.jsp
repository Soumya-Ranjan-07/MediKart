<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<div class="d-flex align-items-center justify-content-between bg-secondary">
	<div class="logo">
		<div class="site-logo bg-light">
			<a href="index.jsp" class="js-logo-clone"><strong
				class="text-secondary">Medi</strong>&nbsp;Kart</a>
		</div>
	</div>
	<%
		if ((String) session.getAttribute("uname") != null) {
	%>
	
	<div class="main-nav d-none d-lg-block">
		<nav class="site-navigation text-right text-md-center"
			role="navigation">
			<ul class="site-menu js-clone-nav d-none d-lg-block">
				<li class="active"><a href="index.jsp">Home</a></li>
				<li><a href="customer-search-product.jsp">Search Product</a></li>
				<li class="has-children"><a href="#">View Products</a>
					<ul class="dropdown">
						<li><a href="allopathy-medicine.jsp">Allopathy Medicines</a></li>
						<li><a href="ayurveda-medicine.jsp">Ayurveda Products</a></li>
						<li><a href="generic-medicines.jsp">Generic Medicines</a></li>
					</ul></li>
				<li class="has-children"><a href="#"><%=session.getAttribute("uname")%></a>
					<ul class="dropdown">
						<li><a href="every-customer-all-orders.jsp">My Medicine Orders</a></li>
						<li><a href="customer-profile.jsp">My Profile</a></li>
						<li><a href="customer-change-password.jsp">Change
								Password</a></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
			</ul>
		</nav>
	</div>
	<div class="icons">
		<%
			ResultSet resultCount = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("customerId") + "'");
			resultCount.next();
			int count = resultCount.getInt(1);
		%>
		<a href="customer-cart.jsp" class="icons-btn d-inline-block bag">
			<span class="icon-shopping-bag"></span> <span class="number"><%=count%></span>
		</a>
	</div>
	<%
		} else {
	%>
	<div class="main-nav d-none d-lg-block">
		<nav class="site-navigation text-right text-md-center"
			role="navigation">
			<ul class="site-menu js-clone-nav d-none d-lg-block">
				<li class="active"><a href="index.jsp">Home</a></li>
				<li><a href="customer-search-product.jsp">Search Product</a></li>
				<li class="has-children"><a href="#">View Products</a>
					<ul class="dropdown">
						<li><a href="allopathy-medicine.jsp">Allopathy Medicines</a></li>
						<li><a href="ayurveda-medicine.jsp">Ayurveda Products</a></li>
						<li><a href="generic-medicines.jsp">Generic Medicines</a></li>
					</ul></li>
				<li class="has-children"><a href="#">Customer</a>
					<ul class="dropdown">
						<li><a href="customer-login.jsp">Customer Login</a></li>
						<li><a href="customer-account.jsp">Customer Account</a></li>
					</ul></li>
				<li><a href="admin-login.jsp">Admin Login</a></li>
				<li><a href="contact.jsp">Contact Us</a></li>
			</ul>
		</nav>
	</div>
	<%
		}
	%>
</div>