<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%@include file="Navbar.jsp"%> 
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Placement Drives </title>
    <link rel="stylesheet" href="css/Home.css">
</head>
<body>
<div class="content">
<!-- <div style="color: black; text-align: center; font-size: 30px;">All Placement Drives  <i class='fab fa-elementor'></i></div>
<br> -->
<%
String msg = request.getParameter("msg");
if ("done".equals(msg)) {
%>
<h3 class="alert">Your application has been submitted successfully!</h3>
<% } else if ("wrong".equals(msg)) { %>
<h3 class="alert">Something went wrong! Please try again.</h3>
<% } else if ("alreadyapplied".equals(msg)) { %>
<h3 class="alert">You have already applied for this drive!</h3>
<% } %>
<table>
<caption>Job List</caption>
    <thead>
        <tr>
            <th scope="col">Drive ID</th>
            <th scope="col">Company Name</th>
            <th scope="col">Description</th>
            <th scope="col">Location</th>
            <th scope="col">Drive Date</th>
            <th scope="col">Job Role</th>
            <th scope="col">Form Opening Date</th>
            <th scope="col">Form Closing Date</th>
            <th scope="col">Degree Name</th>
            <th scope="col">Major Name</th>
            <th scope="col">Minimum Percentage</th>
            <th scope="col">Status</th>
            <th scope="col">Apply</th>
        </tr>
    </thead>
    <tbody>
       <%
       try {
           /* String email = (String) session.getAttribute("email"); */
           if (email != null && !email.isEmpty()) {
               Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery("SELECT user_id FROM user_1 WHERE email='" + email + "'");

               if (rs.next()) {
                   int userId = rs.getInt("user_id");
                   PreparedStatement driveStatement = con.prepareStatement("SELECT p.*, c.company_name, c.description AS company_description, c.location AS company_location FROM Placement_drive p INNER JOIN Company_master c ON p.company_id = c.company_id");
                   ResultSet driveRS = driveStatement.executeQuery();
                   while (driveRS.next()) {
                       PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM application WHERE user_id=? AND drive_id=?");
                       checkStatement.setInt(1, userId);
                       checkStatement.setInt(2, driveRS.getInt("drive_id"));
                       ResultSet checkRS = checkStatement.executeQuery();
                       boolean hasApplied = checkRS.next();

                       if (!hasApplied) {
       %>
        <tr>
            <td><%=driveRS.getString("drive_id") %></td>
            <td><%=driveRS.getString("company_name") %></td>
            <td><%=driveRS.getString("company_description") %></td>
            <td><%=driveRS.getString("company_location") %></td>
            <td><%=driveRS.getString("drive_date") %></td>
            <td><%=driveRS.getString("job_role") %></td>
            <td><%=driveRS.getString("form_opening") %></td>
            <td><%=driveRS.getString("form_closing") %></td>
            <td><%=driveRS.getString("degree_name") %></td>
            <td><%=driveRS.getString("major_name") %></td>
            <td><%=driveRS.getString("minimum_percentage") %></td>
            <td><%=driveRS.getString("status") %></td>
            <td>
                <form action="applicationAction.jsp" method="post">
                    <input type="hidden" name="drive_id" value="<%=driveRS.getString("drive_id") %>">
                    <input type="hidden" name="user_id" value="<%=userId %>">
                    <input type="submit" value="Apply">
                </form>
            </td>
        </tr>
       <%
                       }
                   }
               }
           }
       }
       catch(Exception e) {
           System.out.println(e);
       }
       %>
    </tbody>
</table>
<br>
<br>
<br>
</div>
</body>
</html>
    --%>
    
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%@include file="Navbar.jsp"%> 
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Placement Drives</title>
    <link rel="stylesheet" href="css/Home.css">
</head>
<body>
<div class="content">
<%
String msg = request.getParameter("msg");
if ("done".equals(msg)) {
%>
<script>alert("Your application has been submitted successfully!");</script>
<% } else if ("wrong".equals(msg)) { %>
<script>alert("Something went wrong! Please try again.");</script>
<% } else if ("alreadyapplied".equals(msg)) { %>
<script>alert("You have already applied for this drive!");</script>
<% } %>
<table>
<caption>Job List</caption>
    <thead>
        <tr>
            <th scope="col">Drive ID</th>
            <th scope="col">Company Name</th>
            <th scope="col">Location</th>
            <th scope="col">Drive Date</th>
            <th scope="col">Job Role</th>
            <th scope="col">Form Closing Date</th>
            <th scope="col">Degree Name</th>
            <th scope="col">Major Name</th>
            <th scope="col">Minimum Percentage</th>
            <th scope="col">Status</th>
            <th scope="col">Package</th>
            <th scope="col">Job openings</th>
            <th scope="col">Apply</th>
        </tr>
    </thead>
    <tbody>
       <%
       try {
           if (email != null && !email.isEmpty()) {
               Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery("SELECT user_id FROM user_1 WHERE email='" + email + "'");

               if (rs.next()) {
                   int userId = rs.getInt("user_id");
                   PreparedStatement driveStatement = con.prepareStatement("SELECT p.*, c.company_name, c.description AS company_description, c.location AS company_location FROM Placement_drive p INNER JOIN Company_master c ON p.company_id = c.company_id WHERE p.status = 'active'");
                   ResultSet driveRS = driveStatement.executeQuery();
                   while (driveRS.next()) {
                       PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM application WHERE user_id=? AND drive_id=?");
                       checkStatement.setInt(1, userId);
                       checkStatement.setInt(2, driveRS.getInt("drive_id"));
                       ResultSet checkRS = checkStatement.executeQuery();
                       boolean hasApplied = checkRS.next();

                       if (!hasApplied) {
       %>
        <tr>
            <td><%=driveRS.getString("drive_id") %></td>
            <td><%=driveRS.getString("company_name") %></td>
            <td><%=driveRS.getString("company_location") %></td>
            <td><%=driveRS.getString("drive_date") %></td>
            <td><%=driveRS.getString("job_role") %></td>
            <td><%=driveRS.getString("form_closing") %></td>
            <td><%=driveRS.getString("degree_name") %></td>
            <td><%=driveRS.getString("major_name") %></td>
            <td><%=driveRS.getString("minimum_percentage") %></td>
            <td><%=driveRS.getString("status") %></td>
            <td><%=driveRS.getString("package_rupees") %></td>
            <td><%=driveRS.getString("job_openings") %></td>
            <td>
                <form action="applicationAction.jsp" method="post">
                    <input type="hidden" name="drive_id" value="<%=driveRS.getString("drive_id") %>">
                    <input type="hidden" name="user_id" value="<%=userId %>">
                    <input type="submit" value="Apply">
                </form>
            </td>
        </tr>
       <%
                       }
                   }
               }
           }
       }
       catch(Exception e) {
           System.out.println(e);
       }
       %>
    </tbody>
</table>
<br>
<br>
<br>
</div>
<script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }
</script>
</body>
</html>
    