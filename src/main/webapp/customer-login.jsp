<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Customer Login - Medi Kart | An E-Pharmacy Management</title>
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html" class="text-warning">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Customer Login</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<img src="images/customer-login.jpg"
							style="width: 550px; height: 300px;"></img>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 bg-warning">
						<div class="panel panel-warning shadow p-3 mb-5">
							<div class="panel-heading">Customer Login</div>
							<div class="panel-body">
								<%
									String credential = (String) session.getAttribute("credential");
									if (credential != null) {
										session.removeAttribute("credential");
								%>
								<div class="alert alert-danger" id="danger">You have enter
									wrong credentials.</div>
								<%
									}
								%>
								<%
									String captchaCode = (String) session.getAttribute("verificationCode");
									if (captchaCode != null) {
										session.removeAttribute("verificationCode");
								%>
								<div class="alert alert-info" id="info">You have enter
									wrong verification code.</div>
								<%
									}
								%>
								<form action="CustomerLogin" method="post">
									<div class="form-group">
										<label for="uname">User Name:</label> <input type="text"
											class="form-control" id="uname" placeholder="Enter username"
											name="uname" required onkeypress="return lettersValidate(event)">
									</div>
									<div class="form-group bg-light">
										<label for="upass">Password:</label> <input type="password"
											class="form-control" id="upass" placeholder="Enter password"
											name="upass" required oninput="limitChar(this)" maxlength="12">
									</div>
									<%
										String captcha = null;
										Connection connection = DatabaseConnection.getConnection();
										Statement statement = connection.createStatement();
										ResultSet resultset = statement.executeQuery("select captcha from tblcaptcha");
										if (resultset.next()) {
											captcha = resultset.getString(1);
										}
									%>
									<div class="form-group">
										<label for="vercode">Verification Code:</label> <input
											type="password" class="form-control" id="vercode"
											placeholder="Enter captcha code here" name="vercode">
									</div>
									<div class="form-group bg-light">
										<input type="text" class="form-control" id="" name="pswd"
											value="<%=captcha%>" readonly>
									</div>
									<div width="100%"; style="display:flex; justify-content: space-around"><button type="submit" value="Login" class="btn btn-primary"><span class="glyphicon glyphicon-log-in"></span> Login</button>
									<input type="reset" class="btn btn-danger" value="Cancel"></div>
								</form>
							</div>
						</div>
					</div>
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
	<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123))  
	    	{     
	           return true;    
	    	}else{
	          return false;
	    	}
	         
	 }
	</script>
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
</body>
</html>