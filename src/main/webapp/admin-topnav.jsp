<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- top navigation -->
<div class="top_nav">
	<div class="nav_menu">
		<div class="nav toggle">
			<a id="menu_toggle"><i class="fa fa-bars"></i></a>
		</div>
		<nav class="nav navbar-nav">
			<ul class=" navbar-right">
				<li class="nav-item dropdown open" style="padding-left: 15px;">
					<a href="javascript:;" class="user-profile dropdown-toggle"
					aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
					aria-expanded="false"><%=session.getAttribute("uname") %>
				</a>
					<div class="dropdown-menu dropdown-usermenu pull-right"
						aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="admin-profile.jsp"><i
							class="fa fa-user pull-right"></i> Profile</a> <a
							class="dropdown-item" href="admin-change-password.jsp"><i
							class="fa fa-cog pull-right"></i> Settings</a> <a
							class="dropdown-item" href="logout.jsp"><i
							class="fa fa-sign-out pull-right"></i> Log Out</a>
					</div>
				</li>
			</ul>
		</nav>
	</div>
</div>