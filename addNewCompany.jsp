<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Company</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Company Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Something went wrong! Try Again!</h3>
<%} %>

<% 
int id=1;
try
{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("SELECT MAX(company_id) FROM Company_master");
    while(rs.next())
    {
        id=rs.getInt(1);
        id=id+1;
    }
}
catch(Exception e)
{}
%>

<%
// Fetch admin_user_id from user_1 table
int adminUserId = 0; // Default value
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet adminRs = st.executeQuery("SELECT user_id FROM user_1 WHERE role='admin' AND status='active' LIMIT 1");
    if (adminRs.next()) {
        adminUserId = adminRs.getInt("user_id");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>

<form action="addNewCompanyAction.jsp" method="post">
<h3 style="color: black;">Company ID: <%= id %></h3>
<input type="hidden" name="company_id" value="<%= id %>"> 

<div class="left-div">
 <h3>Enter Company Name</h3>
 <input class="input-style" type="text" name="company_name" placeholder="Enter Company Name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Description</h3>
  <textarea class="input-style" name="description" placeholder="Enter Description" required></textarea>
<hr>
</div>

<div class="left-div">
<h3>Enter Location</h3>
  <input class="input-style" type="text" name="location" placeholder="Enter Location" required>
<hr>
</div>

<div class="right-div">
<h3>Status</h3>
   <select class="input-style" name="status">
   <option value="active">Active</option>
   <option value="inactive">Inactive</option>
   </select>
<hr>
</div>

<div class="left-div">
<input type="hidden" name="admin_user_id" value="<%= adminUserId %>">
</div>

 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>
 --%>
 
 
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
if("notMatch".equals(msg))
{
%>
<script>alert("password and Confirm password does not match!");</script>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<script>alert("Something went wrong! Try Again!");</script>
<%} %>
<%
if("done".equals(msg))
{
%>
<script>alert("Company Added Successfully!");</script>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<script>alert("Some thing went wrong! Try again!");</script>
<%} %>

<% 
int id=1;
try
{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("SELECT MAX(company_id) FROM Company_master");
    while(rs.next())
    {
        id=rs.getInt(1);
        id=id+1;
    }
}
catch(Exception e)
{}
%>

<%
// Fetch admin_user_id from user_1 table
int adminUserId = 0; // Default value
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet adminRs = st.executeQuery("SELECT user_id FROM user_1 WHERE role='admin' AND status='active' LIMIT 1");
    if (adminRs.next()) {
        adminUserId = adminRs.getInt("user_id");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>

    <section class="container">
      <header>Add Company Details</header>
      <form class='form' action="addNewCompanyAction.jsp" method="post" >

        <div class="input-box">
          <label>Company ID: <%= id %></label>
          <input type="hidden" name="company_id" value="<%= id %>">
        </div>

 <div class="column">
        <div class="input-box">
          <label>Enter Company Name</label>
          <input type="text" name="company_name" placeholder="Enter Company Name" required>
        </div>
<div class="input-box">
          <label>Enter Location</label>
          <input type="text" name="location" placeholder="Enter Location" required>
        </div>
        
</div>
<div class="input-box">
          <label>Enter Description</label>
          <input type="text" name="description" placeholder="Enter Description" required>
        </div>
        
        
<!--         <label for="Status">Status</label>
<div class="select-box" >
    <select id="Status" name="status">
        
        <option value="active">Active</option>
   <option value="inactive">Inactive</option>
        
    </select>
</div> -->


        <input type="hidden" name="admin_user_id" value="<%= adminUserId %>">

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
 