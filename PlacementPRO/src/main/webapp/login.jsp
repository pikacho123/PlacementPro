<!DOCTYPE html>c
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link rel="stylesheet" href="css/signup-style.css">
</head>
<body>
	<div class="box-form">
		<div class="left">
			<div class="overlay">
				<h1>Online Shopping <i class="fa fa-shopping-cart" aria-hidden="true"></i></h1>
				
				<br><br><br>
			</div>
		</div>
		<div class="right">
			<h5>LOGIN</h5>
					<%
					String msg = request.getParameter("msg");
					if ("notexist".equals(msg)) {
					%>
					<h3><center>Incorrect Username or Password</center></h3>
					<%
					}
					%>
					<%
					if ("invalid".equals(msg)) {
					%>
					<h3>Some thing Went Wrong! Try Again !</h3>
					<%
					}
					%>
			<form action=" loginAction.jsp" method="post">
				<div class="inputs">
					<input type="email" name="email" placeholder="Enter Email" required> <br> 
					<input type="password" name="password" placeholder="Enter Password" required>
				</div>
				
				<br><br> 
				
				<div class="remember-me--forget-password">
					<%-- <label> <input type="checkbox" name="item" checked /> <span class="text-checkbox">Remember me</span> </label> --%>
					<a href="forgotPassword.jsp" style="color: #000000;">Forgot Password?</a>
				</div>	
				<p style="color:black;">
					<b>Don't have an account? <a href="signup.jsp" style="color: red;">SignUp</a>
					it takes less than a minute
				</p>		
				 <input type="submit" value="Login">				
			</form>			
		</div>
	</div>	
</body>
</html>