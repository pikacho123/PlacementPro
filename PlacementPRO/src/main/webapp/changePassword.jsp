<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="Navbar.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Password</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg))
{
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your old Password is wrong!</h3>
<%} %>
<%
if("done".equals(msg))
{
%>
<h3 class="alert">Password change successfully!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>

<form action="changePasswordAction.jsp" method="post">
<h3>Enter Old Password</h3>
 <input class="input-style" type="password" name="oldPassword" placeholder="Enter Old Password" required>
  <hr>
 <h3>Enter New Password</h3>
  <input class="input-style" type="password" name="newPassword" placeholder="Enter New Password" required>
 
 <hr>
<h3>Enter Confirm Password</h3>
 <input class="input-style" type="password" name="confirmPassword" placeholder="Enter Confirm Password" required>

<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html> --%>


<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="Navbar.jsp"%>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Change Password</title>
    <!---Custom CSS File--->
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>

    <%
String msg=request.getParameter("msg");
if("notMatch".equals(msg))
{
%>
<script>alert("password and Confirm password does not match!");</script>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<script>alert("Your old Password is wrong!");</script>
<%} %>
<%
if("done".equals(msg))
{
%>
<script>alert("Password change successfully!");</script>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<script>alert("Some thing went wrong! Try again!");</script>
<%} %>

    <section class="container">
      <header>Change Password</header>
      <form class='form' action="changePasswordAction.jsp" method="post" >


        <div class="input-box">
          <label>Enter Old Password</label>
          <input type="password" name="oldPassword" placeholder="Enter Old Password" required>
        </div>

        <div class="input-box">
          <label>Enter New Password</label>
          <input type="password" name="newPassword" placeholder="Enter New Password" required>
        </div>


        <div class="input-box">
          <label>Confirm Password</label>
          <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
        </div>

        
        <button  type="submit">Submit</button>
      </form>
    </section>
    <script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }
</script>
  </body>
</html>
