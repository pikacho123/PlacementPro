<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Placement Drives & Company Details</title>
    <link rel="stylesheet" href="../css/Home.css"> 
    <style>
        h3 {
            color: black;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="content">
<div style="color: black; text-align: center; font-size: 30px;">Job Posting <i class='fab fa-elementor'></i></div>
<br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)) {
%>
<script>alert("Placement Drive Successfully Updated!");</script>
<%} %>
<%
if("worng".equals(msg)) {
%>
<script>alert("Something went wrong! Try again!");</script>
<%} %>

<div class="button-container">
    <button onclick="location.href='addNewPlacementDrive.jsp'" class="add-button">
        Add New Placement Drive <i class='fas fa-plus-square'></i>
    </button>
</div>
<!-- <a href="addNewPlacementDrive.jsp">Add New Placement Drive <i class='fas fa-plus-square'></i></a> -->


<table>
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
            <th scope="col">Edit</th>
        </tr>
    </thead>
    <tbody>
       <%
       try {
           Connection con=ConnectionProvider.getCon();
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("SELECT p.*, c.company_name, c.description AS company_description, c.location AS company_location FROM Placement_drive p INNER JOIN Company_master c ON p.company_id = c.company_id");
           while(rs.next()) {
       %>
        <tr>
            <td><%=rs.getString("drive_id") %></td>
            <td><%=rs.getString("company_name") %></td>
            <td><%=rs.getString("company_description") %></td>
            <td><%=rs.getString("company_location") %></td>
            <td><%=rs.getString("drive_date") %></td>
            <td><%=rs.getString("job_role") %></td>
            <td><%=rs.getString("form_opening") %></td>
            <td><%=rs.getString("form_closing") %></td>
            <td><%=rs.getString("degree_name") %></td>
            <td><%=rs.getString("major_name") %></td>
            <td><%=rs.getString("minimum_percentage") %></td>
            <td><%=rs.getString("status") %></td>
            <td><a href="editPlacementDrive.jsp?id=<%=rs.getString("drive_id") %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
        </tr>
       <%
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
 
 
 <%-- 
 <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Placement Drives & Company Details</title>
    <link rel="stylesheet" href="../css/Home.css"> 
    <style>
        h3 {
            color: black;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="content">
<div style="color: black; text-align: center; font-size: 30px;">Job Posting <i class='fab fa-elementor'></i></div>
<br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)) {
%>
<script>alert("Placement Drive Successfully Updated!");</script>
<%} %>
<%
if("worng".equals(msg)) {
%>
<script>alert("Something went wrong! Try again!");</script>
<%} %>

<div class="button-container">
    <!-- <form action="#" method="get"> -->
        <button type="submit" name="order" value="asc" class="order-button">Ascending Order</button>
        <button type="submit" name="order" value="desc" class="order-button">Descending Order</button>
    <!-- </form> -->
</div>

<table>
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
            <th scope="col">Edit</th>
        </tr>
    </thead>
    <tbody>
       <%
       try {
           Connection con=ConnectionProvider.getCon();
           Statement st=con.createStatement();
           
           String order = request.getParameter("order");
           String orderBy = "ASC"; // Default order
           if (order != null && order.equals("desc")) {
               orderBy = "DESC";
           }

           ResultSet rs=st.executeQuery("SELECT p.*, c.company_name, c.description AS company_description, c.location AS company_location FROM Placement_drive p INNER JOIN Company_master c ON p.company_id = c.company_id ORDER BY drive_id " + orderBy);
           
           while(rs.next()) {
       %>
        <tr>
            <td><%=rs.getString("drive_id") %></td>
            <td><%=rs.getString("company_name") %></td>
            <td><%=rs.getString("company_description") %></td>
            <td><%=rs.getString("company_location") %></td>
            <td><%=rs.getString("drive_date") %></td>
            <td><%=rs.getString("job_role") %></td>
            <td><%=rs.getString("form_opening") %></td>
            <td><%=rs.getString("form_closing") %></td>
            <td><%=rs.getString("degree_name") %></td>
            <td><%=rs.getString("major_name") %></td>
            <td><%=rs.getString("minimum_percentage") %></td>
            <td><%=rs.getString("status") %></td>
            <td><a href="editPlacementDrive.jsp?id=<%=rs.getString("drive_id") %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
        </tr>
       <%
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
</html> --%>
 