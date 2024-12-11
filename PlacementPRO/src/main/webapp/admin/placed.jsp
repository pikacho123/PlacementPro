<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin Panel - Manage Applications</title>
    <link rel="stylesheet" href="../css/Home.css"> 
    <style>
        h3 {
            color: black;
            text-align: center;
        }
    </style>
    <script>
        function togglePlacement(studentId, currentStatus) {
            var newStatus = currentStatus === 'placed' ? 'unplaced' : 'placed';
            // Send AJAX request to update placement status in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "togglePlacement.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("studentId=" + studentId + "&newStatus=" + newStatus);
        }
    </script>
</head>
<body>
<div class="content">
    <div style="color: black; text-align: center; font-size: 30px;">Admin Panel - Manage Applications <i class='fab fa-elementor'></i></div>
    <br>
    Display success or error messages
    <%
    String msg = (String) request.getAttribute("msg");
    if ("done".equals(msg)) {
    %>
    <h3 class="alert">Product Successfully Updated!</h3>
    <%} %>
    <%
    if ("wrong".equals(msg)) {
    %>
    <h3 class="alert">Something went wrong! Try again!</h3>
    <%} %>

    <table>
        <thead>
            <tr>
                <th scope="col">Student ID</th>
                <th scope="col">Student Name</th>
                <th scope="col">Company Name</th>
                <th scope="col">Placement Status</th>
                <th scope="col">Toggle Placement</th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
                Connection con = ConnectionProvider.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT s.student_id, s.first_name, s.last_name, c.company_name, a.status AS application_status, s.placement_status FROM student s INNER JOIN application a ON s.user_id = a.user_id INNER JOIN Placement_drive p ON a.drive_id = p.drive_id INNER JOIN Company_master c ON p.company_id = c.company_id WHERE a.status = 'accepted'");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("student_id") %></td>
                <td><%=rs.getString("first_name") %> <%=rs.getString("last_name") %></td>
                <td><%=rs.getString("company_name") %></td>
                <td><%=rs.getString("placement_status") %></td>
                <td>
                    <button onclick="togglePlacement('<%=rs.getString("student_id") %>', '<%=rs.getString("placement_status") %>')">Toggle Placement</button>
                </td>
            </tr>
            <%
                }
            } catch (Exception e) {
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
 
<%--  <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin Panel - Manage Applications</title>
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
    <div style="color: black; text-align: center; font-size: 30px;">Admin Panel - Manage Applications <i class='fab fa-elementor'></i></div>
    <br>
    Display success or error messages
    <%
    String msg = (String) request.getAttribute("msg");
    if ("done".equals(msg)) {
    %>
    <h3 class="alert">Product Successfully Updated!</h3>
    <%} %>
    <%
    if ("wrong".equals(msg)) {
    %>
    <h3 class="alert">Something went wrong! Try again!</h3>
    <%} %>

    <table>
        <thead>
            <tr>
                <th scope="col">Student ID</th>
                <th scope="col">Student Name</th>
                <th scope="col">Company Name</th>
                <th scope="col">Placement Date</th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
                Connection con = ConnectionProvider.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT s.student_id, s.first_name, s.last_name, c.company_name, s.placement_date_time FROM student s INNER JOIN application a ON s.user_id = a.user_id INNER JOIN Placement_drive p ON a.drive_id = p.drive_id INNER JOIN Company_master c ON p.company_id = c.company_id WHERE a.status = 'accepted' GROUP BY s.student_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("student_id") %></td>
                <td><%=rs.getString("first_name") %> <%=rs.getString("last_name") %></td>
                <td><%=rs.getString("company_name") %></td>
                <td><%=rs.getTimestamp("placement_date_time") %></td>
            </tr>
            <%
                }
            } catch (Exception e) {
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
</html> --%>
 
 
<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin Panel - Manage Applications</title>
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
    <div style="color: black; text-align: center; font-size: 30px;">Placement History <i class='fab fa-elementor'></i></div>
    <br>
    Display success or error messages
    <%
    String msg = (String) request.getAttribute("msg");
    if ("done".equals(msg)) {
    %>
    <h3 class="alert">Product Successfully Updated!</h3>
    <%} %>
    <%
    if ("wrong".equals(msg)) {
    %>
    <h3 class="alert">Something went wrong! Try again!</h3>
    <%} %>

    <table>
        <thead>
            <tr>
                <th scope="col">Student Name</th>
                <th scope="col">Company Name</th>
                <th scope="col">Job Role</th>
                <th scope="col">Placement Status</th>
                <th scope="col">Placement Date</th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
                Connection con = ConnectionProvider.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT s.first_name, s.last_name, c.company_name, pd.job_role, ph.status, ph.time_stamp FROM placement_history ph INNER JOIN application a ON ph.application_id = a.application_id INNER JOIN student s ON a.user_id = s.user_id INNER JOIN Placement_drive pd ON a.drive_id = pd.drive_id INNER JOIN Company_master c ON pd.company_id = c.company_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("first_name") %> <%=rs.getString("last_name") %></td>
                <td><%=rs.getString("company_name") %></td>
                <td><%=rs.getString("job_role") %></td>
                <td><%=rs.getString("status") %></td>
                <td><%=rs.getTimestamp("time_stamp") %></td>
            </tr>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
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
<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin Panel - Manage Applications</title>
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
    <div style="color: black; text-align: center; font-size: 30px;">Placement History <i class='fab fa-elementor'></i></div>
    <br>
    Display success or error messages
    <%
    String msg = (String) request.getAttribute("msg");
    if ("done".equals(msg)) {
    %>
    <h3 class="alert">Product Successfully Updated!</h3>
    <%} %>
    <%
    if ("wrong".equals(msg)) {
    %>
    <h3 class="alert">Something went wrong! Try again!</h3>
    <%} %>

    <table>
        <thead>
            <tr>
                <th scope="col">Student Name</th>
                <th scope="col">Company Name</th>
                <th scope="col">Job Role</th>
                <th scope="col">Placement Status</th>
                <th scope="col">Placement Date</th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
                Connection con = ConnectionProvider.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT s.first_name, s.last_name, c.company_name, pd.job_role, ph.status AS placement_status, ph.time_stamp AS placement_date_time FROM placement_history ph INNER JOIN application a ON ph.application_id = a.application_id INNER JOIN student s ON a.user_id = s.user_id INNER JOIN Placement_drive pd ON a.drive_id = pd.drive_id INNER JOIN Company_master c ON pd.company_id = c.company_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("first_name") %> <%=rs.getString("last_name") %></td>
                <td><%=rs.getString("company_name") %></td>
                <td><%=rs.getString("job_role") %></td>
                <td><%=rs.getString("placement_status") %></td>
                <td><%=rs.getTimestamp("placement_date_time") %></td>
            </tr>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
    <br>
    <br>
    <br>
    </div>
</body>
</html> --%>


<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin Panel - Manage Applications</title>
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
    <div style="color: black; text-align: center; font-size: 30px;">Placement History <i class='fab fa-elementor'></i></div>
    <br>
    <%-- Display success or error messages --%>
    <%
    String msg = (String) request.getAttribute("msg");
    if ("done".equals(msg)) {
    %>
    <h3 class="alert">Product Successfully Updated!</h3>
    <%} %>
    <%
    if ("wrong".equals(msg)) {
    %>
    <h3 class="alert">Something went wrong! Try again!</h3>
    <%} %>

    <table>
        <thead>
            <tr>
                <th scope="col">Student Name</th>
                <th scope="col">Company Name</th>
                <th scope="col">Job Role</th>
                <th scope="col">Placement Status</th>
                <th scope="col">Placement Date</th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
                Connection con = ConnectionProvider.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT s.first_name, s.last_name, c.company_name, pd.job_role, s.placement_status, s.placement_date_time FROM placement_history ph INNER JOIN application a ON ph.application_id = a.application_id INNER JOIN student s ON a.user_id = s.user_id INNER JOIN Placement_drive pd ON a.drive_id = pd.drive_id INNER JOIN Company_master c ON pd.company_id = c.company_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("first_name") %> <%=rs.getString("last_name") %></td>
                <td><%=rs.getString("company_name") %></td>
                <td><%=rs.getString("job_role") %></td>
                <td><%=rs.getString("placement_status") %></td>
                <td><%=rs.getTimestamp("placement_date_time") %></td>
            </tr>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
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

 