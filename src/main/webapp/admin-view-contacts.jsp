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
						<i class="fa fa-user"></i>&nbsp;View Contacts
					</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12  ">
					<div class="x_panel">
						<div class="x_title">
							<h2>List of Contacts</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content shadow p-3 mb-5">
							<table id="datatable" class="table table-striped table-bordered"
								style="width: 100%">
								<thead>
									<tr>
										<th>#</th>
										<th>Full Name</th>
										<th>Email Id</th>
										<th>Mobile No</th>
										<th>Subject</th>
										<th>Message</th>
										<th>Date</th>
									</tr>
								</thead>
								<%
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcontact");
									while (resultset.next()) {
								%>
								<tbody>
									<tr>
										<td><%=resultset.getInt("contact_id") %></td>
										<td><%=resultset.getString("name") %></td>
										<td><%=resultset.getString("email") %></td>
										<td><%=resultset.getString("mobile") %></td>
										<td><%=resultset.getString("subject") %></td>
										<td><%=resultset.getString("message") %></td>
										<td><%=resultset.getString("created_at") %></td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
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
