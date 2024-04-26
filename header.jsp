<%@page errorPage="error.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="css/home-style.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <% 
        // Retrieve email from session
        String email = (String) session.getAttribute("email");
        // Initialize username
        String username = "";
        
        // Fetch username from database using the email
        try {
        	Connection con=ConnectionProvider.getCon();
            PreparedStatement pst = con.prepareStatement("SELECT username FROM user_1 WHERE email=?");
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                username = rs.getString("username");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException
        } catch (Exception ex) {
            ex.printStackTrace();
            // Handle other exceptions
        }
    %>
    <!-- Print the username in the header -->
    <center><h2>Online shopping</h2></center>
    <h2><a href=""><%= username %> <i class='fas fa-user-alt'></i></a></h2>
    <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
    <a href="changeDetails.jsp">Profile<i class="fa fa-edit"></i></a>
        <a href="Application.jsp">Appllcation<i class='fas fa-cart-arrow-down'></i></a>
        <a href="ApplicationDisplay.jsp">AppllcationDisplay<i class='fas fa-cart-arrow-down'></i></a>
    
    
    
    <a href="messagesReceived.jsp">Message Us <i class='fas fa-comment-alt'></i></a>
    
    <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
    <div class="search-container">
        <form action="searchHome.jsp" method="post">
            <input type="text" placeholder="Search" name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>
</div>
<br>
<!--table-->
 