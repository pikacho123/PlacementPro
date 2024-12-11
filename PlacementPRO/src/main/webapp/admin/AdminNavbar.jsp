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

<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Admin </title>
    <link rel="stylesheet" href="../css/nav.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
   
<body>
  <nav>
    <div class="navbar">
      <i class='bx bx-menu'></i>
      <div class="logo"><a href="adminHome.jsp">PlaCementPro</a></div>
      <div class="nav-links">
        <div class="sidebar-logo">
          <span class="logo-name">PlaCementPro</span>
          <i class='bx bx-x' ></i>
        </div>
        <ul class="links">
        	<%-- <li><a href=""><i class='bx bx-user'></i><%=   username %><li> --%>
          <li><a href="adminHome.jsp"><i class='bx bx-home'></i>&nbsp;HOME</a></li>
          <li><a href="StudentDetails.jsp"><i class='bx bx-id-card'></i></i>&nbsp;Student Details</a></li>
           <li>
            <a href="#"><i class='bx bx-briefcase'></i>&nbsp;Placement Drive</a>
            <i class='bx bxs-chevron-down htmlcss-arrow arrow  '></i>
            <ul class="htmlCss-sub-menu sub-menu">
              <li><a href="Company_details.jsp">Company Details</a></li>
              <li><a href="PlacementDisplay.jsp">Job Posting</a></li>
              <li><a href="adminApplication.jsp">Application Recieved</a></li>
              <li><a href="ApplicationHistory.jsp">Application History</a></li>
              <!-- <li><a href="SelectionProcess.jsp">Selection Process</a></li> -->
            </ul>
          </li> 
          
          <li><a href="messageUs.jsp"><i class='bx bx-envelope'></i>&nbsp;Post Notification</a></li>
          <li><a href="placed.jsp"><i class='bx bx-user-check'></i>&nbsp;Placement History</a></li>
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
           
          <li><a href="Adminlogout.jsp"><i class='bx bx-log-out'></i>&nbsp;Logout</a></li>
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
  <script src="../nav.js"></script>

</body>
</html>
