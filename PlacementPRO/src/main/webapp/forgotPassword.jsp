<%-- <!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style1.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<style>
::placeholder {
  color: black;
  opacity: 2; /* Firefox */
}
</style>
<title>ForgotPassword</title>
</head>
<body>
<h1><center>Online Shopping <i class="fa fa-shopping-cart" aria-hidden="true"></i></center></h1>

<div id='container'>
  <div class='signup' align="center">
  <h2><center>Forgot Password</center></h2>
     <form action="forgotPasswordAction.jsp" method="post">
     <input type="email" name="email" placeholder="Enter email" required>
     <!-- <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required> -->
     <select name="securityQuestions">
     <option value="What was your first car">What was your first car</option>
     <option value="What is the name of your first pet">What is the name of your first pet</option>
     <option value="Which school did you attend?">Which school did you attend?</option>
     <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
     </select>
     <input type="text" name="answer" placeholder="Enter Answer" required>
     <input type="password" name="newpassword" placeholder="Enter new password" required>
     <input type="submit" value="Save">
     
     </form>
     <br>
    <button > <h2><a href="studentLogin.jsp" style="color: white; text-decoration:none;">Login</a></h2></button>
   <%
   String msg=request.getParameter("msg");
   if("done".equals(msg))
   {
   %>
<h5>Password Changed Successfully!</h5>
<%} %>

 <%
 if("invalid".equals(msg))
 {
 %>
<h5>Some thing Went Wrong! Try Again !</h5>
<%}%>
    </div>
    
  
  </div>

</body>
</html> --%>

<%-- <!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style1.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<style>
::placeholder {
  color: black;
  opacity: 2; /* Firefox */
}
</style>
<title>ForgotPassword</title>
</head>
<body>
<h1><center>Online Shopping <i class="fa fa-shopping-cart" aria-hidden="true"></i></center></h1>

<div id='container'>
  <div class='signup' align="center">
  <h2><center>Forgot Password</center></h2>
     <form action="forgotPasswordAction.jsp" method="post">
     
     <input type="email" name="email" placeholder="Enter email" required>
     
     <select name="securityQuestions">
     <option value="What was your first car">What was your first car</option>
     <option value="What is the name of your first pet">What is the name of your first pet</option>
     <option value="Which school did you attend?">Which school did you attend?</option>
     <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
     </select>
     
     <input type="text" name="answer" placeholder="Enter Answer" required>
     <input type="password" name="newpassword" placeholder="Enter new password" required>
     <input type="submit" value="Save">
     
     </form>
     <br>
    <button > <h2><a href="studentLogin.jsp" style="color: white; text-decoration:none;">Login</a></h2></button>
    <% String msg = request.getParameter("msg");
       if ("done".equals(msg)) { %>
        <script>
            alert("Password Changed Successfully!");
        </script>
    <% } else if ("invalid".equals(msg)) { %>
        <script>
            alert("Something Went Wrong! Try Again!");
        </script>
    <% } %>
  </div>
</div>
</body>
</html> --%>

<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%-- <%@include file="Navbar.jsp"%> --%>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Forgot Password</title>
    <!---Custom CSS File--->
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>

    <section class="container">
      <header>Change Password</header>
      <form class='form' action="forgotPasswordAction.jsp" method="post" >


        <div class="input-box">
          <label>Enter Email_id</label>
          <input type="email" name="email" placeholder="Enter email" required>
        </div>

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
          <label>Enter Answer</label>
          <input type="text" name="answer" placeholder="Enter Answer" required>
        </div>


        <div class="input-box">
          <label>Enter New Password</label>
          <input type="password" name="newpassword" placeholder="Enter new password" required>
        </div>

        
        <button  type="submit">Submit</button>
        <button ><a href="studentLogin.jsp" style="color: white; text-decoration:none;">Login</a></button>
      </form>
    </section>
    <% String msg = request.getParameter("msg");
       if ("done".equals(msg)) { %>
        <script>
            alert("Password Changed Successfully!");
        </script>
    <% } else if ("invalid".equals(msg)) { %>
        <script>
            alert("Something Went Wrong! Try Again!");
        </script>
    <% } %>
    <script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }
</script>
  </body>
</html>



