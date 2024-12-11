<%@page errorPage="error.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>

<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Home </title>
    <link rel="stylesheet" href="css/nav.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
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
<body>
  <nav>
    <div class="navbar">
      <i class='bx bx-menu'></i>
      <div class="logo"><a href="home.jsp">PlaCementPro</a></div>
      <div class="nav-links">
        <div class="sidebar-logo">
          <span class="logo-name">PlaCementPro</span>
          <i class='bx bx-x' ></i>
        </div>
        <ul class="links">
        	<%-- <li><a href=""><i class='bx bx-user'></i><%=   username %><li> --%>
          <li><a href="home.jsp"><i class='bx bx-home'></i>&nbsp;HOME</a></li>
          
          
          
          <li>
            <a href="#"><i class='bx bx-user'></i>&nbsp;Profile</a>
            <!-- <i class='bx bxs-chevron-down js-arrow arrow '></i>
            <ul class="js-sub-menu sub-menu"> -->
            <i class='bx bxs-chevron-down htmlcss-arrow arrow  '></i>
            <ul class="htmlCss-sub-menu sub-menu">
              <li><a href="Personal_Details.jsp">My Profile</a></li>
              <li><a href="changePassword.jsp">Change Password</a></li>
              <li><a href="changeSecurityQuestion.jsp">Change Security Question</a></li>
            </ul>
          </li>
          
          
          
          <li><a href="Application.jsp"><i class='bx bx-book-alt'></i>&nbsp;Job Listing</a></li>
          <li><a href="ApplicationDisplay.jsp"><i class='bx bx-list-ul'></i>&nbsp;Application</a></li>
          <li><a href="SP.jsp"><i class='bx bx-list-ul'></i>&nbsp;Selection Process</a></li>
          <li><a href="messagesReceived.jsp"><i class='bx bx-bell'></i>&nbsp;Notification</i></a></li>
          
          
          
           <!-- <li>
            <a href="#">HTML & CSS</a>
            <i class='bx bxs-chevron-down htmlcss-arrow arrow  '></i>
            <ul class="htmlCss-sub-menu sub-menu">
              <li><a href="#">Web Design</a></li>
              <li><a href="#">Login Forms</a></li>
              <li><a href="#">Card Design</a></li>
              <li class="more">
                <span><a href="#">More</a>
                <i class='bx bxs-chevron-right arrow more-arrow'></i>
              </span>
                <ul class="more-sub-menu sub-menu">
                  <li><a href="#">Neumorphism</a></li>
                  <li><a href="#">Pre-loader</a></li>
                  <li><a href="#">Glassmorphism</a></li>
                </ul>
              </li>
            </ul>
          </li>  
            -->
          <li><a href="logout.jsp"><i class='bx bx-log-out'></i>&nbsp;Logout</a></li>
         <!--  <li><a href="#">ABOUT US</a></li>
          <li><a href="#">CONTACT US</a></li> -->
        </ul>
      </div>
       <div class="search-box">
        <i class='bx bx-search'></i>
        <div class="input-box">
          <input type="text" placeholder="Search...">
        </div>
      </div>
     
    </div>
  </nav>
  <script src="nav.js"></script>

</body>
</html>
