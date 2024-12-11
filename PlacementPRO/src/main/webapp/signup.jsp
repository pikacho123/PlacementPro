<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/signup-style1.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<title>Signup</title>
<style>
::placeholder {
  color: black;
  opacity: 2; /* Firefox */
}
</style>
</head>
<body>
<h1><center>Online Shopping <i class="fa fa-shopping-cart" aria-hidden="true"></i></center></h1>

<div id='container'>
  <div class='signup'>
  <h2><center>SIGNUP</center></h2>
    <form action="signupAction.jsp" method="post">
    
    <input type ="text" name="username" placeholder="Enter Username" required>
    <%-- Display error message if username already exists --%>
    <% String error = request.getParameter("error");
       if (error != null && error.equals("username_exists")) { %>
          <p style="color: red;">Username already exists. Please enter another username.</p>
    <% } %>
    
    
    <input type ="email" name="email" placeholder="Enter Email" required>
    <%-- Display error message if email already exists --%>
    <% String emailError = request.getParameter("email_error");
       if (emailError != null && emailError.equals("email_exists")) { %>
          <p style="color: red;">Email already registered. Please use a different email.</p>
    <% } %>
    
    
    <input type="password" name="password" placeholder="Enter Password" required>
    <select name="securityQuestions" required>
        <option value="What was your first car">What was your first car</option>
        <option value="What is the name of your first pet">What is the name of your first pet</option>
        <option value="Which school did you attend?">Which school did you attend?</option>
        <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
    </select>
    <input type="text" name="answer" placeholder="Enter Answer" required>
    <input type="submit" value="signup">
    </form>
    <br>
      <button ><h2><a href="studentLogin.jsp" style="color: white; text-decoration:none;">Login</a></h2></button>
  <%
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  { 
  %>
  <h5>Successfully Registered !</h5>
  <%} 
  %>
  
  <%
  if("invalid".equals(msg))
  {
  %>
  

<h5>Some thing Went Wrong! Try Again !</h5>
<%} %>

  </div>
</div>

</body>
</html>
 