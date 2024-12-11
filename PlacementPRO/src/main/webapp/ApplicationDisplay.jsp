<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="Navbar.jsp"%> 
<%@include file="header.jsp"%>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Applications</title>
    <link rel="stylesheet" href="css/Home.css">
    
</head>
<body>
<div class="content">
<div style="color: black; text-align: center; font-size: 30px;">All Applications <i class='fab fa-elementor'></i></div>
<br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)) {
%>
<script>alert("Your application has been submitted successfully!");</script>
<%} %>
<%
if("wrong".equals(msg)) {
%>
<script>alert("Something went wrong! Please try again.");</script>
<%} %>
<table>
<caption>Application List</caption>
    <thead>
        <tr>
            <th scope="col">Application ID</th>
            <th scope="col">User ID</th>
            <th scope="col">Drive ID</th>
            <th scope="col">Application Date</th>
            <th scope="col">Status</th>
            <th scope="col">Company Name</th>
            <th scope="col">Job role</th>
            <th scope="col">Drive Date</th>
        </tr>
    </thead>
    <tbody>
       <%
       try {
           /* String email = (String)session.getAttribute("email"); */
           if (email != null && !email.isEmpty()) {
               Connection con=ConnectionProvider.getCon();
               Statement st=con.createStatement();
               ResultSet rs=st.executeQuery("SELECT user_id FROM user_1 WHERE email='" + email + "'");
               
               if (rs.next()) {
                   int userId = rs.getInt("user_id");
                   PreparedStatement ps=con.prepareStatement("SELECT a.application_id, a.user_id, a.drive_id, a.application_date, a.status, c.company_name, p.job_role, p.drive_date FROM application a INNER JOIN Placement_drive p ON a.drive_id = p.drive_id INNER JOIN Company_master c ON p.company_id = c.company_id WHERE a.user_id = ?");
                   ps.setInt(1, userId);
                   ResultSet applicationRS=ps.executeQuery();
                   while(applicationRS.next()) {
       %>
        <tr>
            <td><%=applicationRS.getString("application_id") %></td>
            <td><%=applicationRS.getString("user_id") %></td>
            <td><%=applicationRS.getString("drive_id") %></td>
            <td><%=applicationRS.getString("application_date") %></td>
            <td><%=applicationRS.getString("status") %></td>
            <td><%=applicationRS.getString("company_name") %></td>
            <td><%=applicationRS.getString("job_role") %></td>
            <td><%=applicationRS.getString("drive_date") %></td>
        </tr>
       <%
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

</body>
</html>
    --%>
    
    
 <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="Navbar.jsp"%> 
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Applications</title>
    <link rel="stylesheet" href="css/Home.css">
</head>
<body>
<div class="content">
<!-- <div style="color: black; text-align: center; font-size: 30px;">All Applications <i class='fab fa-elementor'></i></div> -->
<br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)) {
%>
<script>alert("Your application has been submitted successfully!");</script>
<%} %>
<%
if("wrong".equals(msg)) {
%>
<script>alert("Something went wrong! Please try again.");</script>
<%} %>
<table>
<caption>Application List</caption>
    <thead>
        <tr>
            <th scope="col">Application ID</th>
            <th scope="col">Application Date</th>
            <th scope="col">Company Name</th>
            <th scope="col">Job Role</th>
            <th scope="col">Drive Date</th>
            <th scope="col">Status</th>
        </tr>
    </thead>
    <tbody>
       <%
       try {
           /* String email = (String)session.getAttribute("email"); */
           if (email != null && !email.isEmpty()) {
               Connection con=ConnectionProvider.getCon();
               Statement st=con.createStatement();
               ResultSet rs=st.executeQuery("SELECT user_id FROM user_1 WHERE email='" + email + "'");
               
               if (rs.next()) {
                   int userId = rs.getInt("user_id");
                   PreparedStatement ps=con.prepareStatement("SELECT a.application_id, a.application_date, c.company_name, p.job_role, p.drive_date, a.status FROM application a INNER JOIN Placement_drive p ON a.drive_id = p.drive_id INNER JOIN Company_master c ON p.company_id = c.company_id WHERE a.user_id = ?");
                   ps.setInt(1, userId);
                   ResultSet applicationRS=ps.executeQuery();
                   while(applicationRS.next()) {
       %>
        <tr>
            <td><%=applicationRS.getString("application_id") %></td>
            <td><%=applicationRS.getString("application_date") %></td>
            <td><%=applicationRS.getString("company_name") %></td>
            <td><%=applicationRS.getString("job_role") %></td>
            <td><%=applicationRS.getString("drive_date") %></td>
            <td><%=applicationRS.getString("status") %></td>
        </tr>
       <%
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
 