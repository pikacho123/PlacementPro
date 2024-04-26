<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div><br>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>

<form action="messageUsAction.jsp" method="post">
<input class="input-style" name="subject" type="text" placeholder="subject" required>
<hr>
<textarea class="input-style" name="body"  placeholder="Enter Your Message" required></textarea>
<hr>
<button class="button" type="submit">Send <i class="far fa-arrow-alt-circle-right"></i></button>
</form>
<br><br><br>
</body>
</html> --%>


<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Change Password</title>
  
    <!---Custom CSS File--->
    <link rel="stylesheet" href="../css/style.css" />
  </head>
  <body>

    <%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>

<script>alert("Message successfully sent");</script>

<%} %>
<%
if("invalid".equals(msg))
{
%>
<script>alert("Some thing Went Wrong! Try Again!");</script>
<%} %>

    <section class="container">
      <header>Post A Message</header>
      <form class='form' action="messageUsAction.jsp" method="post" >

        
 
        <div class="input-box">
          <label>Subject</label>
          <input type="text" name="subject"  placeholder="subject" required>
        </div>
<div class="input-box">
          <label>Body</label>
          <input type="text" name="body"  placeholder="Enter Your Message" required>
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