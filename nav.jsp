<%@page errorPage="error.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Responsive Drop Down Navigation Menu | CodingLab </title>
    <link rel="stylesheet" href="nav.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
  <nav>
    <div class="navbar">
      <i class='bx bx-menu'></i>
      <div class="logo"><a href="home.jsp">CarrerCrafter</a></div>
      <div class="nav-links">
        <div class="sidebar-logo">
          <span class="logo-name">CarrerCrafter</span>
          <i class='bx bx-x' ></i>
        </div>
        <ul class="links">
          <li><a href="home.jsp">HOME</a></li>
          <li><a href="Personal_Details.jsp">Profile</a></li>
          <li><a href="Application.jsp">Application</a></li>
          <li><a href="ApplicationDisplay.jsp">ApplicationDisplay</a></li>
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
          </li> -->
           <li>
            <a href="#">Profile</a>
            <i class='bx bxs-chevron-down js-arrow arrow '></i>
            <ul class="js-sub-menu sub-menu">
              <li><a href="#">My Profile</a></li>
              <li><a href="#">Change Password</a></li>
              <li><a href="#">Change Security Question</a></li>
              <li><a href="#">Complete Website</a></li>
            </ul>
          </li>
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
