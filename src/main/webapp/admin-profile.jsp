<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
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
						<i class="fa fa-user"></i> Profile
					</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12  ">
					<div class="x_panel">
						<div class="x_title">
							<h2>Profile Information</h2>
							<div class="clearfix"></div>
						</div>
						<%
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where uname='"
								+ session.getAttribute("uname") + "' and email_id='" + session.getAttribute("email") + "'");
							if (resultset.next()) {
						%>
						<div class="x_content">
							<div class="col-md-12 col-sm-12  profile_left shadow p-3 mb-5">
								<form id="demo-form2" data-parsley-validate
									class="form-horizontal form-label-left">

									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"><strong><i
												class="fa fa-user"></i> Account Information</strong></label>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">Email</label>
										<div class="col-md-8 col-sm-8 ">
											<input class="form-control" type="text"
												value="<%=resultset.getString("email_id")%>" readonly>
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">User Name</label>
										<div class="col-md-8 col-sm-8 ">
											<input class="form-control" type="text"
												value="<%=resultset.getString("uname")%>" readonly>
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">Password</label>
										<div class="col-md-8 col-sm-8 ">
											<input class="form-control" type="password"
												value="<%=resultset.getString("upass")%>">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">Created At</label>
										<div class="col-md-8 col-sm-8 ">
											<input class="form-control" type="text"
												value="<%=resultset.getString("created_at")%>" readonly>
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">Updated At</label>
										<div class="col-md-8 col-sm-8 ">
											<input class="form-control" type="text"
												value="<%=resultset.getString("updated_at")%>" readonly>
										</div>
									</div>
									<div class="ln_solid"></div>
								</form>
							</div>
						</div>
					</div>
					<%
						}
					%>
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
