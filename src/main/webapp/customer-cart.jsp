<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>My Cart - Medi Kart | An E-Pharmacy Management</title>
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

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
						<a href="index.html" class="text-warning">Home</a> <span class="mx-2 mb-0">/</span> 
						<strong class="text-black">Cart</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<%
					int index = 0;
					int paymentId = 1001;
					ResultSet rsCountCheck = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("customerId") + "'");
					rsCountCheck.next();
					int cartItem = rsCountCheck.getInt(1);
					System.out.println("cartItem  " + cartItem);
					if (cartItem > 0) {
				%>
				<%
					String quantity = (String) session.getAttribute("quantity-short");
					if (quantity != null) {
					session.removeAttribute("quantity-short");
				%>
					<div class="alert alert-danger" id="danger">Medicine quantity is not enough to purchase.</div>
				<%
					}
				%>
				<div class="row mb-5 shadow p-3 mb-5">
					<div class="site-blocks-table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>SR.No</th>
									<th>Medicine</th>
									<th>Quantity</th>
									<th>MRP(Rs)</th>
									<th>Selling Price(Rs)</th>
									<th>Total Price(Rs)</th>
									<th>Action</th>
								</tr>
							</thead>
							<%
								ResultSet totalMedicine = DatabaseConnection.getResultFromSqlQuery("select tblmedicine.medicine_image_name,tblmedicine.medicine_name,tblcart.quantity,tblcart.medicine_mrp_price,tblcart.medicine_discount_price,tblcart.total_medicines_price,tblcart.medicine_id from tblmedicine,tblcart where tblmedicine.id=tblcart.medicine_id and customer_id='"+ session.getAttribute("customerId") + "'");
								while (totalMedicine.next()) {
									index++;
							%>
							<tbody>
								<tr>
									<td class="invert"><%=index%></td>
									<td class="product-thumbnail"><img
										src="uploads/<%=totalMedicine.getString(1)%>" alt=""
										class="pro-image-front" style="width: 150px; height: 100px;"><br><%=totalMedicine.getString(2)%></td>
									<td>
										<form action="UpdateMedicineQuantity" method="post">
											<div class="input-group mb-3" style="max-width: 80px;">
												<input type="hidden" value="<%=totalMedicine.getInt(7)%>"
													name="medicineId"> <input type="text"
													name="quantity" value="<%=totalMedicine.getInt(3)%>"
													class="form-control text-center"> <input
													type="submit" value="+" class="btn btn-outline-primary">
											</div>
										</form>
									</td>
									<td class=""><del>Rs.&nbsp;<%=totalMedicine.getDouble(4)%>&nbsp;
										</del></td>
									<td>Rs.&nbsp;<%=totalMedicine.getDouble(5)%>&nbsp;</td>
									<td>Rs.&nbsp;<%=totalMedicine.getDouble(6)%>&nbsp;</td>
									<td><a href="remove-medicine-from-cart.jsp?medicineId=<%=totalMedicine.getInt(7)%>&quantity=<%=totalMedicine.getInt(3)%>" class="btn btn-primary height-auto btn-sm" onclick="return confirm('Are you sure do you want to delete this medicine?');">X</a></td>
								</tr>
								<%
									}
								%>
								<%
									double finalBill = 0.0;
									ResultSet totolAmount = DatabaseConnection.getResultFromSqlQuery("select sum(total_medicines_price) from tblcart where customer_id='"+ session.getAttribute("customerId") + "' ");
									if (totolAmount.next()) {
										finalBill = totolAmount.getInt(1);
									}
								%>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td colspan="2"><strong>
												Total Amount&nbsp;:&nbsp;Rs.&nbsp;<%=finalBill%>
												
											</strong></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="row mb-5">
							<div class="col-md-6">
								<a href="index.jsp"
									class="btn btn-outline-primary btn-md btn-block">Continue
									Shopping</a>
							</div>
						</div>
						<form action="GetMedicineOrders" method="post">
						<div class="row">
							<div class="col-md-12">
								<label class="text-black h4" for="coupon">Billing
									Address</label>
								<p>Note: Now only cash on delivery payment mode is
									available.</p>
							</div>
						</div>
						<%
							ResultSet userInfoResult = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where id='"+ session.getAttribute("customerId") + "' and uname='" + session.getAttribute("uname") + "'");
							if (userInfoResult.next()) {
						%>
						<div class="form-group">
							<label>Your Name</label> <input type="text" name="name"
								value="<%=userInfoResult.getString("full_name")%>"
								placeholder="" required="" style="width: 1135px; height: 40px;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Mobile Number</label> <input type="text" name="phone"
								value="<%=userInfoResult.getString("mobile_no")%>"
								placeholder="" required="" style="width: 1135px; height: 40px;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Email Id</label> <input type="text" name="email"
								value="<%=userInfoResult.getString("email_id")%>" placeholder=""
								required="" style="width: 1135px; height: 40px;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Address</label> <input type="text" name="address"
								value="<%=userInfoResult.getString("address")%>" placeholder=""
								required="" style="width: 1135px; height: 100px;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Pin Code</label> <input type="text" name="pincode"
								value="<%=userInfoResult.getString("pincode")%>" placeholder=""
								required="" style="width: 1135px; height: 40px;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Select Payment Mode</label> <select name="payment"
								style="width: 1135px; height: 40px;" class="form-control">
								<option selected="selected">COD</option>
								<option disabled="disabled">Credit Card</option>
								<option disabled="disabled">Debit Card</option>
								<option disabled="disabled">Online Banking</option>
								<option disabled="disabled">UPI Id</option>
							</select>
						</div>
						<div class="row">
							<%
								ResultSet rsPaymentId = DatabaseConnection.getResultFromSqlQuery("select max(payment_id) from tblorder");
								if (rsPaymentId.next()) {
								paymentId = rsPaymentId.getInt("max(payment_id)");
								paymentId++;
							}
							%>
							<div class="col-md-12">
								<input type="hidden" name="payment_id" value="<%=paymentId%>">
								<button class="btn btn-primary btn-lg btn-block"
									onclick="return confirm('Are you sure do you want to buy this order?');">Buy Products</button>
							</div>
						</div>
						</form>
						<%
							}
						%>
					</div>
				</div>
				<%
					}else{	
				%>
					Thanks for giving order.&nbsp;<a href="customer-medicine-invoice.jsp?paymentId=<%=paymentId%>">Print Your Medicine Order
					Bill</a><br>
				<%
					if (index == 0) {
				%>
					<strong>There is no item(s) in your Cart.&nbsp;<a href="index.jsp">Shop Now</a></strong>
				<%
					}
				%>
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
	<script type="text/javascript">
			$(function() {
				$('#info').delay(1500).show().fadeOut('slow');
			});
	</script>
	<script type="text/javascript">
		$(function() {
			$('#danger').delay(1500).show().fadeOut('slow');
		});
	</script>
	<%
		} else {
	response.sendRedirect("customer-login.jsp");
	}
	%>
</body>
</html>