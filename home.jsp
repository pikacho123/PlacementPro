<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="Navbar.jsp"%> 
<%@include file="footer.jsp"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Profile Cards | CodingLab</title>
    <link rel="stylesheet" href="css/Card.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  </head>
              <!-- Creating By CodingLab -->
  <body>
  
    <%
try {
    Connection con = ConnectionProvider.getCon();
    String userEmail = (String) session.getAttribute("email"); // Retrieve email from session
    if (userEmail != null) {
        // Fetch student details associated with the email from user_1 and student tables
        String query = "SELECT u.username, u.email, s.phone, s.gender, s.date_of_birth, s.status,s.placement_status,s.undergraduate_degree, s.undergraduate_major, s.masters_degree, s.masters_major  FROM user_1 u INNER JOIN student s ON u.user_id = s.user_id WHERE u.email = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, userEmail);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            // Check if the student status is active
            String status = rs.getString("status");
            if (status.equals("inactive")) {
%>
                <h3>Your account is inactive. Please complete your details.</h3>
<%
            } else {
                String currentDegree = "";
                if (rs.getString("masters_degree") != null && rs.getString("masters_major") != null) {
                    currentDegree = rs.getString("masters_degree") + " in                      " + rs.getString("masters_major");
                } else {
                    currentDegree = rs.getString("undergraduate_degree") + " in " + rs.getString("undergraduate_major");
                }
%>
    <div class="container">
      <div class="box">
      <div class="image">
          <img src="Images/blank-profile-picture-973460_1280.png">
        </div>
        <div class="name_job">Welcome <%= rs.getString("username") %></div>
        




        <div class="rating">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="far fa-star"></i>
          <i class="far fa-star"></i>
          <i class="far fa-star"></i>
        </div>




        <p><b>Email:</b> <%= rs.getString("email") %></p>
                <p><b>Phone:</b> <%= rs.getString("phone") %></p>
                <p><b>Gender:</b> <%= rs.getString("gender") %></p>
                <p><b>Date of Birth:</b> <%= rs.getString("date_of_birth") %></p>
                
                <p><b>Current Degree:</b> <%= currentDegree %></p>
                <p><b>Placement Status:</b> <%= rs.getString("placement_status") %></p>
        <!-- <div class="btns">


          <button>Read More</button>
          <button>Subscribe</button>
        </div> -->
      </div>
    </div>
    <%
            }
        } else {
%>
            <h3>No data found for the provided email.</h3>
<%
        }
    } else {
%>
        <h3>No email found in session.</h3>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
    // Handle exceptions
}
%>

      </body>
</html>
 