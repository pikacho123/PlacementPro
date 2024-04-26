<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>

<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Securtiy Question</h3>
  <select class="input-style" name="securityQuestions">
  <option value="What was your first car?">What was your first car?</option>
  <option value="What is the name of your first pet?">What is the name of your first pet?</option>
  <option value="What elementary school did you attend?">What elementary school did you attend?</option>
  <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
  </select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="Enter your new Answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter Password(For security)" required>

<hr>
 <button class="button" type="submit"> Save <i class='far fa-arrow-alt-circle-right'></i></button>
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
    <title>Change Security Question</title>
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
<script>alert("Your Password is wrong!");</script>
<%} %>
<%
if("done".equals(msg))
{
%>
<script>alert("Your security Question successfully changed !");</script>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<script>alert("Some thing went wrong! Try again!");</script>
<%} %>

    <section class="container">
      <header>Change Security Question</header>
      <form class='form' action="changeSecurityQuestionAction.jsp" method="post" >

        <label for="security-question">Select Your New Security Question</label>
<div class="select-box">
    <select id="security-question" name="securityQuestions">
        <option hidden>Security Question</option>
        <option value="What was your first car?">What was your first car?</option>
  <option value="What is the name of your first pet?">What is the name of your first pet?</option>
  <option value="What elementary school did you attend?">What elementary school did you attend?</option>
  <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
    </select>
</div>


        <div class="input-box">
          <label>Enter Your New Answer</label>
          <input type="text" name="newAnswer" placeholder="Enter your new Answer" required>
        </div>

        <div class="input-box">
          <label>Enter Password (For Security)</label>
          <input type="password" name="password" placeholder="Enter Password(For security)" required>
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
