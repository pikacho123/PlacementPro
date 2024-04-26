<%-- <%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="AdminNavbar.jsp" %>
<%@ include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Manage Selection Process</title>
    <link rel="stylesheet" href="../css/Home.css">
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        h3 {
            color: black;
            text-align: center;
        }
    </style>
    <script>
        function updateProcess(applicationId, processId) {
            var processElement = document.getElementById("process_" + applicationId);
            var newProcess = processElement.value;

            // Send AJAX request to update process name in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "adminProcessUpdateAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = xhr.responseText;
                    if (response === "success") {
                        // Optionally, you can handle success here
                        console.log("Process updated successfully");
                    } else {
                        // Optionally, you can handle failure here
                        console.error("Failed to update process");
                    }
                }
            };
            xhr.send("applicationId=" + applicationId + "&processId=" + processId + "&newProcess=" + newProcess);
        }

        function togglePlacementStatus(applicationId) {
            // Send AJAX request to toggle placement status in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "adminPlacementStatusToggleAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = xhr.responseText;
                    if (response === "success") {
                        // Optionally, you can handle success here
                        console.log("Placement status toggled successfully");
                    } else {
                        // Optionally, you can handle failure here
                        console.error("Failed to toggle placement status");
                    }
                }
            };
            xhr.send("applicationId=" + applicationId);
        }
    </script>
</head>
<body>
<div class="content">
    <div style="color: black; text-align: center; font-size: 30px;">Admin Panel - Manage Selection Process <i
                class='fab fa-elementor'></i></div>
    <br>
    <%
        String msg = (String) request.getAttribute("msg");
        if ("done".equals(msg)) {
    %>
    <script>alert("Process Successfully Updated!");</script>
    <%} %>
    <%
        if ("wrong".equals(msg)) {
    %>
    <script>alert("Something went wrong! Try again!");</script>
    <%} %>

    <table>
        <thead>
        <tr>
            <th scope="col">Process ID</th>
            <th scope="col">Application ID</th>
            <th scope="col">Student Name</th>
            <th scope="col">Company Name</th>
            <th scope="col">Job Role</th>
            <th scope="col">Process Name</th>
            <th scope="col">Update Process</th>
            <th scope="col">Placement Status</th>
            <th scope="col">Update Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                Connection con = ConnectionProvider.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT sp.process_id, sp.application_id, s.first_name, s.last_name, cm.company_name, pd.job_role, sp.process_name " +
                        "FROM selection_process sp " +
                        "JOIN application a ON sp.application_id = a.application_id " +
                        "JOIN student s ON a.user_id = s.user_id " +
                        "JOIN Placement_drive pd ON a.drive_id = pd.drive_id " +
                        "JOIN Company_master cm ON pd.company_id = cm.company_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("process_id") %></td>
            <td><%= rs.getInt("application_id") %></td>
            <td><%= rs.getString("first_name") + " " + rs.getString("last_name") %></td>
            <td><%= rs.getString("company_name") %></td>
            <td><%= rs.getString("job_role") %></td>
            <td>
                <select id="process_<%= rs.getInt("application_id") %>"
                        onchange="updateProcess(<%= rs.getInt("application_id") %>, <%= rs.getInt("process_id") %>)">
                    <option value="Application" <%= rs.getString("process_name").equals("Application") ? "selected" : "" %>>Application</option>
                    <option value="Resume screening" <%= rs.getString("process_name").equals("Resume screening") ? "selected" : "" %>>Resume screening</option>
                    <option value="Screening call" <%= rs.getString("process_name").equals("Screening call") ? "selected" : "" %>>Screening call</option>
                    <option value="Assessment test" <%= rs.getString("process_name").equals("Assessment test") ? "selected" : "" %>>Assessment test</option>
                    <option value="In-person interviewing" <%= rs.getString("process_name").equals("In-person interviewing") ? "selected" : "" %>>In-person interviewing</option>
                    <option value="Background checks" <%= rs.getString("process_name").equals("Background checks") ? "selected" : "" %>>Background checks</option>
                    <option value="Reference checks" <%= rs.getString("process_name").equals("Reference checks") ? "selected" : "" %>>Reference checks</option>
                    <option value="Decision and job offer" <%= rs.getString("process_name").equals("Decision and job offer") ? "selected" : "" %>>Decision and job offer</option>
                </select>
            </td>
            <td><button onclick="updateProcess(<%= rs.getInt("application_id") %>, <%= rs.getInt("process_id") %>)">Update Process</button></td>
            <td><%= rs.getString("placement_status") %></td>
            <td><button onclick="togglePlacementStatus(<%= rs.getInt("application_id") %>)"
                        <%= rs.getString("placement_status").equals("placed") ? "disabled" : "" %>>Toggle Status</button></td>
        </tr>
        <%
                }
                con.close();
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
 
 <%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="AdminNavbar.jsp" %>
<%@ include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Selection Process</title>
    <link rel="stylesheet" href="../css/Home.css">
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        h3 {
            color: black;
            text-align: center;
        }
    </style>
    <script>
        function updateProcess(applicationId, processId) {
            var processElement = document.getElementById("process_" + applicationId);
            var newProcess = processElement.value;

            // Send AJAX request to update process name in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "adminProcessUpdateAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = xhr.responseText;
                    if (response === "success") {
                        // Optionally, you can handle success here
                        console.log("Process updated successfully");
                    } else {
                        // Optionally, you can handle failure here
                        console.error("Failed to update process");
                    }
                }
            };
            xhr.send("applicationId=" + applicationId + "&processId=" + processId + "&newProcess=" + newProcess);
        }

        function togglePlacementStatus(applicationId) {
            // Send AJAX request to toggle placement status in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "adminPlacementStatusToggleAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = xhr.responseText;
                    if (response === "success") {
                        // Optionally, you can handle success here
                        console.log("Placement status toggled successfully");
                    } else {
                        // Optionally, you can handle failure here
                        console.error("Failed to toggle placement status");
                    }
                }
            };
            xhr.send("applicationId=" + applicationId);
        }
    </script>
</head>
<body>
<div class="content">
    <div style="color: black; text-align: center; font-size: 30px;">Manage Selection Process </div>
    <br>
    <%
        String msg = (String) request.getAttribute("msg");
        if ("done".equals(msg)) {
    %>
    <script>alert("Process Successfully Updated!");</script>
    <%} %>
    <%
        if ("wrong".equals(msg)) {
    %>
    <script>alert("Something went wrong! Try again!");</script>
    <%} %>

    <table>
        <thead>
        <tr>
            <th scope="col">Process ID</th>
            <th scope="col">Application ID</th>
            <th scope="col">Student Name</th>
            <th scope="col">Company Name</th>
            <th scope="col">Job Role</th>
            <th scope="col">Process Name</th>
            <th scope="col">Update Process</th>
            <th scope="col">Placement Status</th>
            <th scope="col">Update Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                Connection con = ConnectionProvider.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT sp.process_id, sp.application_id, s.first_name, s.last_name, cm.company_name, pd.job_role, sp.process_name, st.placement_status " +
                        "FROM selection_process sp " +
                        "JOIN application a ON sp.application_id = a.application_id " +
                        "JOIN student s ON a.user_id = s.user_id " +
                        "JOIN Placement_drive pd ON a.drive_id = pd.drive_id " +
                        "JOIN Company_master cm ON pd.company_id = cm.company_id " +
                        "JOIN student st ON a.user_id = st.user_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("process_id") %></td>
            <td><%= rs.getInt("application_id") %></td>
            <td><%= rs.getString("first_name") + " " + rs.getString("last_name") %></td>
            <td><%= rs.getString("company_name") %></td>
            <td><%= rs.getString("job_role") %></td>
            <td>
                <select id="process_<%= rs.getInt("application_id") %>"
                        onchange="updateProcess(<%= rs.getInt("application_id") %>, <%= rs.getInt("process_id") %>)">
                    <option value="Application" <%= rs.getString("process_name").equals("Application") ? "selected" : "" %>>Application</option>
                    <option value="Resume screening" <%= rs.getString("process_name").equals("Resume screening") ? "selected" : "" %>>Resume screening</option>
                    <option value="Screening call" <%= rs.getString("process_name").equals("Screening call") ? "selected" : "" %>>Screening call</option>
                    <option value="Assessment test" <%= rs.getString("process_name").equals("Assessment test") ? "selected" : "" %>>Assessment test</option>
                    <option value="In-person interviewing" <%= rs.getString("process_name").equals("In-person interviewing") ? "selected" : "" %>>In-person interviewing</option>
                    <option value="Background checks" <%= rs.getString("process_name").equals("Background checks") ? "selected" : "" %>>Background checks</option>
                    <option value="Reference checks" <%= rs.getString("process_name").equals("Reference checks") ? "selected" : "" %>>Reference checks</option>
                    <option value="Decision and job offer" <%= rs.getString("process_name").equals("Decision and job offer") ? "selected" : "" %>>Decision and job offer</option>
                </select>
            </td>
            <td><button onclick="updateProcess(<%= rs.getInt("application_id") %>, <%= rs.getInt("process_id") %>)">Update Process</button></td>
            <td><%= rs.getString("placement_status") %></td>
            <td><button onclick="togglePlacementStatus(<%= rs.getInt("application_id") %>)"
                        <%= rs.getString("placement_status").equals("placed") ? "disabled" : "" %>>Toggle Status</button></td>
        </tr>
        <%
                }
                con.close();
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
 