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
					<h3>
						<i class="fa fa-dashboard"></i> Dashboard
					</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12  ">
					<div class="x_panel">
						<div class="x_content">
							<div class="row">
								<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
									<div class="alert alert-default back-widget-set text-center">
										<%
											int countMedicines = 0;
											ResultSet rsMedicines = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblmedicine");
											rsMedicines.next();
											countMedicines = rsMedicines.getInt(1);
										%>
										<i class="fa fa-medkit fa-5x"></i>
										<h3>
											<font color="#FF9933"><span class="counter"><%=countMedicines %></span></font>
										</h3>
										<strong style="text-transform: uppercase; font-size: 15px;"><a
											href="admin-view-medicines.jsp" class="text-dark">Total Medicines</a></strong>
									</div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
									<div class="alert alert-default back-widget-set text-center">
										<%
											int countOrders = 0;
											ResultSet rsOrders = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblorder");
											rsOrders.next();
											countOrders = rsOrders.getInt(1);
										%>
										<i class="fa fa-shopping-cart fa-5x"></i>
										<h3>
											<font color="#FF9933"><span class="counter"><%=countOrders%></span></font>
										</h3>
										<strong style="text-transform: uppercase; font-size: 15px;"><a
											href="admin-manages-medicine-orders.jsp" class="text-dark">Total Orders</a></strong>
									</div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
									<div class="alert alert-default back-widget-set text-center">
										<%
											int countCustomers = 0;
											ResultSet rsCustomers = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcustomer");
											rsCustomers.next();
											countCustomers = rsCustomers.getInt(1);
										%>
										<i class="fa fa-users fa-5x"></i>
										<h3>
											<font color="#FF9933"><span class="counter"><%=countCustomers %></span></font>
										</h3>
										<strong style="text-transform: uppercase; font-size: 15px;"><a
											href="admin-view-customers.jsp" class="text-dark">Total Customers</a></strong>
									</div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
									<div class="alert alert-default back-widget-set text-center">
										<%
											double totalSale = 0.0;
											ResultSet totolAmount = DatabaseConnection.getResultFromSqlQuery("select sum(medicine_total_price) from tblorder");
											if (totolAmount.next()) {
												totalSale = totolAmount.getInt(1);
											}
										%>
										<i class="fa fa-desktop fa-5x"></i>
										<h3>
											<font color="#FF9933"><span class="counter"><%=totalSale%>&nbsp;Rs/-</span></font>
										</h3>
										<strong style="text-transform: uppercase; font-size: 15px;"><a
											href="admin-dashboard.jsp" class="text-dark">Total Sales</a></strong>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
									<div class="alert alert-default back-widget-set text-center">
										<%
											double todaySale = 0.0;
											ResultSet todayTotalAmount = DatabaseConnection.getResultFromSqlQuery("select sum(medicine_total_price) from tblorder where date(created_at)= CURDATE()");
											if (todayTotalAmount.next()) {
												todaySale = todayTotalAmount.getInt(1);
											}
										%>
										<i class="fa fa-desktop fa-5x"></i>
										<h3>
											<font color="#FF9933"><span class="counter"><%=todaySale%>&nbsp;Rs/-</span></font>
										</h3>
										<strong style="text-transform: uppercase; font-size: 15px;"><a
											href="admin-dashboard.jsp" class="text-dark">Today's Sale</a></strong>
									</div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
									<div class="alert alert-default back-widget-set text-center">
										<%
											int countPending = 0;
											ResultSet rsPendingOrders = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblorder where medicine_order_status='Pending'");
											rsPendingOrders.next();
											countPending = rsPendingOrders.getInt(1);
										%>
										<i class="fa fa-clock-o fa-5x" aria-hidden="true"></i>
										<h3>
											<font color="#FF9933"><span class="counter"><%= countPending%></span></font>
										</h3>
										<strong style="text-transform: uppercase; font-size: 15px;"><a
											href="admin-manages-medicine-orders.jsp" class="text-dark">Pending Orders</a></strong>
									</div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
									<div class="alert alert-default back-widget-set text-center">
										<%
											int countInProcess = 0;
											ResultSet rsInProcessOrders = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblorder where medicine_order_status='In Process'");
											rsInProcessOrders.next();
											countInProcess = rsInProcessOrders.getInt(1);
										%>
										<i class="fa fa-tasks fa-5x" aria-hidden="true"></i>
										<h3>
											<font color="#FF9933"><span class="counter"><%=countInProcess%></span></font>
										</h3>
										<strong style="text-transform: uppercase; font-size: 15px;"><a
											href="admin-manages-medicine-orders.jsp" class="text-dark">In process Orders</a></strong>
									</div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
									<div class="alert alert-default back-widget-set text-center">
										<%
											int countDelivered = 0;
											ResultSet rsDeliveredOrders = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblorder where medicine_order_status='Delivered'");
											rsDeliveredOrders.next();
											countDelivered = rsDeliveredOrders.getInt(1);
										%>
										<i class="fa fa-truck fa-5x" aria-hidden="true"></i>
										<h3>
											<font color="#FF9933"><span class="counter"><%=countDelivered%></span></font>
										</h3>
										<strong style="text-transform: uppercase; font-size: 15px;"><a
											href="admin-manages-medicine-orders.jsp" class="text-dark">Delivered Orders</a></strong>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="admin-side-footer.jsp"></jsp:include>
	<%
		} else {
		response.sendRedirect("admin-login.jsp");
	  }
	%>
</body>
</html>
