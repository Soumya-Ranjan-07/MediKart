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
						<i class="fa fa-user"></i> Change Password
					</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12  ">
					<div class="x_panel">
						<div class="x_title">
							<h2>Change Password</h2>
							<div class="clearfix"></div>
						</div>
						<%
							String message = (String) session.getAttribute("password-change-success");
							if (message != null) {
								session.removeAttribute("password-change-success");
						%>
						<div class='alert alert-success' id='success'>Password
							change successfully.</div>
						<%
							}
						%>
						<%
							String fail = (String) session.getAttribute("password-change-fail");
							if (fail != null) {
								session.removeAttribute("password-change-fail");
						%>
						<div class="alert alert-danger" id='danger'>Old password
							does not match..</div>
						<%
							}
						%>
						<%
							String passwordConfirm = (String) session.getAttribute("password-not-match");
						if (passwordConfirm != null) {
							session.removeAttribute("password-not-match");
						%>
						<div class="alert alert-warning" id='danger'>New password
							and confirm password does not match.</div>
						<%
							}
						%>
						<div class="x_content">
							<div class="col-md-9 col-sm-9  profile_left shadow p-3 mb-5">
								<%
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where uname='"+ session.getAttribute("uname") + "' and email_id='" + session.getAttribute("email") + "'");
									if (resultset.next()) {
								%>
								<form action="AdminChangePassword" method="post" id="demo-form2"
									data-parsley-validate class="form-horizontal form-label-left">
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align"><strong><i
												class="fa fa-key"></i> Settings</strong></label>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">Current
											Password</label>
										<div class="col-md-8 col-sm-8 ">
											<input class="form-control" type="password" name="cpassword"
												placeholder="Current Password"
												value="<%=resultset.getString("upass")%>" readonly>
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">New
											Password</label>
										<div class="col-md-8 col-sm-8 ">
											<input class="form-control" type="password" name="password"
												placeholder="New Password">
										</div>
									</div>
									<div class="item form-group">
										<label class="col-form-label col-md-3 col-sm-3 label-align">Confirm
											Password</label>
										<div class="col-md-8 col-sm-8 ">
											<input class="form-control" type="password" name="confpass"
												placeholder="Confirm Password">
										</div>
									</div>
									<div class="ln_solid"></div>
									<div class="item form-group">
										<div class="col-md-6 col-sm-6 offset-md-3">
											<input type="submit" class="btn btn-success"
												value="Change Password"> <input type="reset"
												class="btn btn-danger" value="Cancel">

										</div>
									</div>

								</form>
								<%
									}
								%>
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
