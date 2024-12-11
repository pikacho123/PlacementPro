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
        function updateStatus(applicationId) {
            var statusElement = document.getElementById("status_" + applicationId);
            var newStatus = statusElement.value;

            // Send AJAX request to update status in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "adminApplicationStatusAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("applicationId=" + applicationId + "&status=" + newStatus);
        }
    </script>
</head>
<body>
<div class="content">
    <div style="color: black; text-align: center; font-size: 30px;">Admin Panel - Manage Applications <i class='fab fa-elementor'></i></div>
    <br>
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
                <th scope="col">Application ID</th>
                <th scope="col">User ID</th>
                <th scope="col">Drive ID</th>
                <th scope="col">Application Date</th>
                <th scope="col">Status</th>
                <th scope="col">Update Status</th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
                Connection con=ConnectionProvider.getCon();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("SELECT * FROM application");
                while(rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("application_id") %></td>
                <td><%=rs.getString("user_id") %></td>
                <td><%=rs.getString("drive_id") %></td>
                <td><%=rs.getString("application_date") %></td>
                <td>
                    <select id="status_<%=rs.getString("application_id") %>" onchange="updateStatus('<%=rs.getString("application_id") %>')">
                        <option value="pending" <%=rs.getString("status").equals("pending") ? "selected" : "" %>>Pending</option>
                        <option value="accepted" <%=rs.getString("status").equals("accepted") ? "selected" : "" %>>Accepted</option>
                        <option value="rejected" <%=rs.getString("status").equals("rejected") ? "selected" : "" %>>Rejected</option>
                    </select>
                </td>
                <td>
                    <button onclick="updateStatus('<%=rs.getString("application_id") %>')">Update Status</button>
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
    </div>>
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
    <script>
        function updateStatus(applicationId) {
            var statusElement = document.getElementById("status_" + applicationId);
            var newStatus = statusElement.value;

            // Send AJAX request to update status in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "adminApplicationStatusAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("applicationId=" + applicationId + "&status=" + newStatus);
        }
    </script>
</head>
<body>
    <div class="content">
        <div style="color: black; text-align: center; font-size: 30px;">Admin Panel - Manage Applications <i class='fab fa-elementor'></i></div>
        <br>
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
                    <th scope="col">Application ID</th>
                    <th scope="col">Drive ID</th>
                    <th scope="col">Student Name</th>
                    <th scope="col">Company Name</th>
                    <th scope="col">Drive Date</th>
                    <th scope="col">Application Date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Update Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con=ConnectionProvider.getCon();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("SELECT a.application_id, a.drive_id, CONCAT(s.first_name, ' ', s.last_name) AS student_name, c.company_name, d.drive_date, a.application_date, a.status FROM application a JOIN student s ON a.user_id = s.user_id JOIN Placement_drive d ON a.drive_id = d.drive_id JOIN Company_master c ON d.company_id = c.company_id WHERE a.status = 'pending'");
                    while(rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("application_id") %></td>
                    <td><%=rs.getString("drive_id") %></td>
                    <td><%=rs.getString("student_name") %></td>
                    <td><%=rs.getString("company_name") %></td>
                    <td><%=rs.getString("drive_date") %></td>
                    <td><%=rs.getString("application_date") %></td>
                    <td>
                        <select id="status_<%=rs.getString("application_id") %>" onchange="updateStatus('<%=rs.getString("application_id") %>')">
                            <option value="pending" <%=rs.getString("status").equals("pending") ? "selected" : "" %>>Pending</option>
                            <option value="accepted" <%=rs.getString("status").equals("accepted") ? "selected" : "" %>>Accepted</option>
                            <option value="rejected" <%=rs.getString("status").equals("rejected") ? "selected" : "" %>>Rejected</option>
                        </select>
                    </td>
                    <td>
                        <button onclick="updateStatus('<%=rs.getString("application_id") %>')">Update Status</button>
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

 
<%--  <%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
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
        function updateStatus(applicationId) {
            var statusElement = document.getElementById("status_" + applicationId);
            var newStatus = statusElement.value;

            // Send AJAX request to update status in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "adminApplicationStatusAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = xhr.responseText;
                    if (response === "success") {
                        // Optionally, you can handle success here
                        console.log("Status updated successfully");
                    } else {
                        // Optionally, you can handle failure here
                        console.error("Failed to update status");
                    }
                }
            };
            xhr.send("applicationId=" + applicationId + "&status=" + newStatus);
        }
    </script>
</head>
<body>
    <div class="content">
        <div style="color: black; text-align: center; font-size: 30px;">Manage Application <i class='fab fa-elementor'></i></div>
        <br>
        <%
        String msg = (String) request.getAttribute("msg");
        if ("done".equals(msg)) {
        %>
        <script>alert("Product Successfully Updated!");</script>
        <%} %>
        <%
        if ("wrong".equals(msg)) {
        %>
        <script>alert("Something went wrong! Try again!");</script>
        <%} %>
        
        <table>
            <thead>
                <tr>
                    <th scope="col">Application ID</th>
                    <th scope="col">Drive ID</th>
                    <th scope="col">Student Name</th>
                    
                    <th scope="col">Company Name</th>
                    <th scope="col">Drive Date</th>
                    <th scope="col">Application Date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Update Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con=ConnectionProvider.getCon();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("SELECT a.application_id, a.drive_id, CONCAT(s.first_name, ' ', s.last_name) AS student_name, c.company_name, d.drive_date, a.application_date, a.status FROM application a JOIN student s ON a.user_id = s.user_id JOIN Placement_drive d ON a.drive_id = d.drive_id JOIN Company_master c ON d.company_id = c.company_id WHERE a.status = 'pending'");
                    while(rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("application_id") %></td>
                    <td><%=rs.getString("drive_id") %></td>
                    <td><%=rs.getString("student_name") %></td>
                    <td><%=rs.getString("company_name") %></td>
                    <td><%=rs.getString("drive_date") %></td>
                    <td><%=rs.getString("application_date") %></td>
                    <td>
                        <select id="status_<%=rs.getString("application_id") %>" onchange="updateStatus('<%=rs.getString("application_id") %>')">
                            <option value="pending" <%=rs.getString("status").equals("pending") ? "selected" : "" %>>Pending</option>
                            <option value="accepted" <%=rs.getString("status").equals("accepted") ? "selected" : "" %>>Accepted</option>
                            <option value="rejected" <%=rs.getString("status").equals("rejected") ? "selected" : "" %>>Rejected</option>
                        </select>
                    </td>
                    <td>
                        <button onclick="updateStatus('<%=rs.getString("application_id") %>')">Update Status</button>
                    </td>
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
 
 
 <%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
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
        function updateStatus(applicationId) {
            var statusElement = document.getElementById("status_" + applicationId);
            var newStatus = statusElement.value;

            // Send AJAX request to update status in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "adminApplicationStatusAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = xhr.responseText;
                    if (response === "success") {
                        // Optionally, you can handle success here
                        console.log("Status updated successfully");
                    } else {
                        // Optionally, you can handle failure here
                        console.error("Failed to update status");
                    }
                }
            };
            xhr.send("applicationId=" + applicationId + "&status=" + newStatus);
        }
    </script>
</head>
<body>
    <div class="content">
        <div style="color: black; text-align: center; font-size: 30px;">Manage Application <i class='fab fa-elementor'></i></div>
        <br>
        <%
        String msg = (String) request.getAttribute("msg");
        if ("done".equals(msg)) {
        %>
        <script>alert("Product Successfully Updated!");</script>
        <%} %>
        <%
        if ("wrong".equals(msg)) {
        %>
        <script>alert("Something went wrong! Try again!");</script>
        <%} %>
        
        <table>
            <thead>
                <tr>
                    <th scope="col">Application ID</th>
                    <th scope="col">Drive ID</th>
                    <th scope="col">Student Name</th>
                    <th scope="col">Student Resume</th>
                    <th scope="col">Company Name</th>
                    <th scope="col">Drive Date</th>
                    <th scope="col">Application Date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Update Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con=ConnectionProvider.getCon();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("SELECT a.application_id, a.drive_id, CONCAT(s.first_name, ' ', s.last_name) AS student_name, s.resume, c.company_name, d.drive_date, a.application_date, a.status FROM application a JOIN student s ON a.user_id = s.user_id JOIN Placement_drive d ON a.drive_id = d.drive_id JOIN Company_master c ON d.company_id = c.company_id WHERE a.status = 'pending'");
                    while(rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("application_id") %></td>
                    <td><%=rs.getString("drive_id") %></td>
                    <td><%=rs.getString("student_name") %></td>
                    <td><a href="<%=rs.getString("resume") %>" target="_blank">View Resume</a></td>
                    <td><%=rs.getString("company_name") %></td>
                    <td><%=rs.getString("drive_date") %></td>
                    <td><%=rs.getString("application_date") %></td>
                    <td>
                        <select id="status_<%=rs.getString("application_id") %>" onchange="updateStatus('<%=rs.getString("application_id") %>')">
                            <option value="pending" <%=rs.getString("status").equals("pending") ? "selected" : "" %>>Pending</option>
                            <option value="accepted" <%=rs.getString("status").equals("accepted") ? "selected" : "" %>>Accepted</option>
                            <option value="rejected" <%=rs.getString("status").equals("rejected") ? "selected" : "" %>>Rejected</option>
                        </select>
                    </td>
                    <td>
                        <button onclick="updateStatus('<%=rs.getString("application_id") %>')">Update Status</button>
                    </td>
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
 