<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page errorPage="error.jsp"%>
<%
String email = "";
if (session.getAttribute("email") != null) {
    email = session.getAttribute("email").toString();
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
 
<!--             <center><h2>Online shopping </h2></center>
 -->             <a href="adminHome.jsp">Home <i class='fas fa-plus-square'></i></a>
            <!-- <a href="addNewProduct.jsp">Add New Company <i class='fas fa-plus-square'></i></a> -->
            <a href="StudentDetails.jsp">Student Details <i class='fab fa-elementor'></i></a>
            <a href="Company_details.jsp">Company Details <i class='fab fa-elementor'></i></a>
            <!-- <a href="addNewPlacementDrive.jsp">PlacementDrive <i class='fab fa-elementor'></i></a> -->
            <a href="PlacementDisplay.jsp">PlacementDisplay <i class='fab fa-elementor'></i></a>
            <a href="adminApplication.jsp">Application <i class='fab fa-elementor'></i></a>
            <a href="messageUs.jsp">Messages <i class='fas fa-comment-alt'></i></a>
            <a href="placed.jsp">placed <i class='fas fa-comment-alt'></i></a>
            <a href="Adminlogout.jsp">Logout <i class='fas fa-share-square'></i></a>
          </div>
           <br>
           <!--table-->
