<%-- <!DOCTYPE html>
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

			<form action=" adminLoginAction.jsp" method="post">
			
				
			
			
				<div class="inputs">
					<input type="email" name="email" placeholder="Enter Email" required> <br> 
					<input type="password" name="password" placeholder="Enter Password" required>
				</div>
				
				<br><br> 
				
				<div class="remember-me--forget-password">
					<label> <input type="checkbox" name="item" checked /> <span class="text-checkbox">Remember me</span> </label>
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
</html> --%>

<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/c/CodingLabYT-->
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <!--<title> Login and Registration Form in HTML & CSS | CodingLab </title>-->
    <link rel="stylesheet" href="css/Login_Signup.css">
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
</head>
<body>
<div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
        <div class="front">
            <img src="Images/frontImg.jpg" alt="">
            <div class="text">
                <span class="text-1">PlaCementPro<br>Streamlining Success</span>
                <span class="text-2">Let's get connected</span>
            </div>
        </div>
        <div class="back">
            <img class="backImg" src="images/backImg.jpg" alt="">
            <div class="text">
                <span class="text-1">PlaCementPro<br>Streamlining Success</span>
                <span class="text-2">Let's get started</span>
            </div>
        </div>
    </div>
    <div class="forms">
        <div class="form-content">
            <div class="login-form">
                <div class="title">Admin Login</div>

                <form action="adminLoginAction.jsp" method="post">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="email" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password" placeholder="Enter your password" required>
                        </div>
                        <!-- <div class="text"><a href="forgotPassword.jsp">Forgot password?</a></div> -->
                        <div class="button input-box">
                            <input type="submit" value="Login">
                        </div>
                        <!-- <div class="text sign-up-text">Don't have an account? <label for="flip">Signup now</label></div> -->
                    </div>
                    <br><br><br>
                    <%-- Display error message for incorrect username or password --%>
                    <%
                        String msg = request.getParameter("msg");
                        if ("notexist".equals(msg)) {
                    %>
                    <script>alert("Incorrect Username or Password");</script>
                    <%
                        request.setAttribute("msg", null);
                        }
                    %>
                    <%-- Display error message for other errors --%>
                    <%
                        if ("invalid".equals(msg)) {
                    %>
                    <script>alert("Some thing Went Wrong! Try Again !");</script>
                    <%
                        request.setAttribute("msg", null);
                        }
                    %>
                    <%-- Display error message for inactive account --%>
                    <%
                        if ("inactive".equals(msg)) {
                    %>
                    <script>alert("Your account is inactive. Please contact the administrator.");</script>
                    <%
                        request.setAttribute("msg", null);
                        }
                    %>
                </form>
            </div>
            <%-- <div class="signup-form">
                <div class="title">Signup</div>
                <form action="signupAction.jsp" method="post">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-user"></i>
                            <input type="text" name="username" placeholder="Enter your Username" required>
                        </div>
                        <% String error = request.getParameter("error");
                            if (error != null && error.equals("username_exists")) { %>
                        <p style="color: red;">Username already exists. Please enter another username.</p>
                        <% } %>

                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="email" name="email" placeholder="Enter your email" required>
                        </div>
                        <% String emailError = request.getParameter("email_error");
                            if (emailError != null && emailError.equals("email_exists")) { %>
                        <p style="color: red;">Email already registered. Please use a different email.</p>
                        <% } %>

                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password" placeholder="Enter your password" required>
                        </div>

                        <div class="input-box">
                            <select name="securityQuestions" required>
                                <option value="" disabled selected>Select a security question</option>
                                <option value="What was your first car">What was your first car</option>
                                <option value="What is the name of your first pet">What is the name of your first pet</option>
                                <option value="Which school did you attend?">Which school did you attend?</option>
                                <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
                            </select>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-pencil-alt"></i>
                            <input type="text" name="answer" placeholder="Enter Answer" required>
                        </div>
                        <div class="button input-box">
                            <input type="submit" value="signup">
                        </div>
                        <div class="text sign-up-text">Already have an account? <label for="flip">Login now</label></div>
                        <% String msgValue =request.getParameter("msg");
                            if("correct".equals(msgValue )) { %>
                        <script>alert("Successfully Registered !");</script>
                        <% request.setAttribute("msg", null);
                            } %>

                        <% if("wrong".equals(msgValue )) { %>
                        <script>alert("Some thing Went Wrong! Try Again !");</script>
                        <% request.setAttribute("msg", null);
                            } %>
                    </div>
                </form>
            </div> --%>
        </div>
    </div>
</div>
<script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }
</script>
</body>
</html>
  