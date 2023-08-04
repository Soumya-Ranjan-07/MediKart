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
					<h4>
						<i class="fa fa-eye"></i> Medicine Wise Sale Report
						</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="x_panel">
				<div class="x_title">
					<h2>Medicine Sales Report</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content shadow p-3 mb-5">
					<form role="form" action="total-sale.jsp" method="post">
						<div class="form-row">
							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<input class="form-control" type="date" name="sDate">
								</div>
							</div>
							<div class="col-md-1 col-sm-1">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>To</strong>
							</div>
							<div class="col-md-3 col-sm-3">
								<div class="form-group">
									<input class="form-control" type="date" name="eDate">
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn btn-info" value="">Display
									Sales</button>
							</div>
						</div>
						<div class="form-row">
							<table id="table" class="table table-bordered">
								<thead>
									<tr>
										<th>Medicine Name</th>
										<th>Medicine Quantity</th>
										<th>Medicine Price</th>
										<th>Total Sale</th>
									</tr>
								</thead>
								<tbody>
									<%
										boolean found = false;
										String sDate = request.getParameter("sDate");
										String eDate = request.getParameter("eDate");
										ResultSet rs = DatabaseConnection.getResultFromSqlQuery("SELECT medicine_name,sum(quantity),medicine_discount_price,sum(medicine_total_price)  FROM tblorder WHERE date(created_at) between  date('"+sDate+"') and date('"+eDate+"') group by medicine_name");
										while (rs.next()) {
											found = true;
									%>
									<tr>
										<td><%=rs.getString("medicine_name")%></td>
										<td><%=rs.getInt(2)%>
										<td><%=rs.getDouble(3) %></td>
										<td><%=rs.getDouble(4) %></td>
									</tr>
									<%
										}
										
									%>
									<%
										double totalSale = 0.0;
										ResultSet totolAmount = DatabaseConnection.getResultFromSqlQuery("select sum(medicine_total_price) from tblorder where date(created_at) between  date('"+sDate+"') and date('"+eDate+"')");
										if (totolAmount.next()) {
											totalSale = totolAmount.getInt(1);
										}
									%>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td><strong>
													Total Sale.:&nbsp;<%=totalSale%>
													Rs/-
												</strong></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<jsp:include page="admin-side-footer.jsp"></jsp:include>
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
		response.sendRedirect("admin-login.jsp");
	  }
	%>
</body>
</html>
