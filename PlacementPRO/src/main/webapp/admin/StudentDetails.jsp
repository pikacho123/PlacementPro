<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Product Edit</title>
    <link rel="stylesheet" href="../css/Home.css"> 
  
    <script>
        function toggleStatus(studentId) {
            var statusElement = document.getElementById("status_" + studentId);
            var currentStatus = statusElement.textContent.trim();
            var newStatus = currentStatus === "active" ? "inactive" : "active";
            statusElement.textContent = newStatus;

            // Send AJAX request to update status in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "studentStatusAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("studentId=" + studentId + "&status=" + newStatus);
        }
    </script>
</head>
<body>
    <div class="content">
        <div style="color: black; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
        <br>
        <%
        String msg = request.getParameter("msg");
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
                    <th scope="col">Student_ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Status</th>
                    <th scope="col">Edit </th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT s.student_id, CONCAT(s.first_name, ' ', s.last_name) AS full_name, u.status FROM student s JOIN user_1 u ON s.user_id = u.user_id");
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td id="status_<%=rs.getString(1)%>"><%=rs.getString(3) %></td>
                    <td>
                        <button onclick="toggleStatus('<%=rs.getString(1)%>')">Toggle Status <i class='fas fa-pen-fancy'></i></button>
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
   
   
   <%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Product Edit</title>
    <link rel="stylesheet" href="../css/Home.css"> 
  
    <script>
        function toggleStatus(studentId) {
            var statusElement = document.getElementById("status_" + studentId);
            var currentStatus = statusElement.textContent.trim();
            var newStatus = currentStatus === "active" ? "inactive" : "active";
            statusElement.textContent = newStatus;

            // Send AJAX request to update status in the database
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "studentStatusAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("studentId=" + studentId + "&status=" + newStatus);
        }
    </script>
</head>
<body>
    <div class="content">
        <div style="color: black; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
        <br>
        <%
        String msg = request.getParameter("msg");
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
                    <th scope="col">Student_ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Current Course</th>
                    <th scope="col">Status</th>
                    <th scope="col">Edit </th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT s.student_id, CONCAT(s.first_name, ' ', s.last_name) AS full_name, " +
                                                    "CASE " +
                                                    "WHEN s.masters_degree IS NOT NULL THEN s.masters_degree " +
                                                    "ELSE s.undergraduate_degree " +
                                                    "END AS degree, " +
                                                    "CASE " +
                                                    "WHEN s.masters_major IS NOT NULL THEN s.masters_major " +
                                                    "ELSE s.undergraduate_major " +
                                                    "END AS major, " +
                                                    "u.status FROM student s JOIN user_1 u ON s.user_id = u.user_id");
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %> - <%=rs.getString(4) %></td>
                    <td id="status_<%=rs.getString(1)%>"><%=rs.getString(5) %></td>
                    <td>
                        <button onclick="toggleStatus('<%=rs.getString(1)%>')">Toggle Status <i class='fas fa-pen-fancy'></i></button>
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
</html> --%>

<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Product Edit</title>
    <link rel="stylesheet" href="../css/Home.css"> 
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        function toggleStatus() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
            var studentIds = [];
            checkboxes.forEach(function(checkbox) {
                studentIds.push(checkbox.value);
                var statusElement = document.getElementById("status_" + checkbox.value);
                var currentStatus = statusElement.textContent.trim();
                var newStatus = currentStatus === "active" ? "inactive" : "active";
                statusElement.textContent = newStatus;
            });

            // Send AJAX request to update status in the database for all selected entries
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "studentStatusAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("studentIds=" + JSON.stringify(studentIds));
        }

        function selectAll() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = true;
            });
        }
    </script>
</head>
<body>
    <div class="content">
        <div style="color: black; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
        <br>
        <%
        String msg = request.getParameter("msg");
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
                    <th scope="col">Select</th>
                    <th scope="col">Student_ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Current Course</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT s.student_id, CONCAT(s.first_name, ' ', s.last_name) AS full_name, " +
                                                    "CASE " +
                                                    "WHEN s.masters_degree IS NOT NULL THEN s.masters_degree " +
                                                    "ELSE s.undergraduate_degree " +
                                                    "END AS degree, " +
                                                    "CASE " +
                                                    "WHEN s.masters_major IS NOT NULL THEN s.masters_major " +
                                                    "ELSE s.undergraduate_major " +
                                                    "END AS major, " +
                                                    "u.status FROM student s JOIN user_1 u ON s.user_id = u.user_id");
                    while (rs.next()) {
                %>
                <tr>
                    <td><input type="checkbox" value="<%=rs.getString(1)%>"></td>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %> - <%=rs.getString(4) %></td>
                    <td id="status_<%=rs.getString(1)%>"><%=rs.getString(5) %></td>
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
        <button onclick="selectAll()">Select All</button>
        <button onclick="toggleStatus()">Toggle Status <i class='fas fa-pen-fancy'></i></button>
        <br>
        <br>
    </div>
</body>
</html> --%>

<%-- <%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="project.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>All Product Edit</title>
    <link rel="stylesheet" href="../css/Home.css"> 
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        function toggleStatus() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
            var studentIds = [];
            checkboxes.forEach(function(checkbox) {
                studentIds.push(checkbox.value);
                var statusElement = document.getElementById("status_" + checkbox.value);
                var currentStatus = statusElement.textContent.trim();
                var newStatus = currentStatus === "active" ? "inactive" : "active";
                statusElement.textContent = newStatus;
            });

            // Send AJAX request to update status in the database for all selected entries
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "studentStatusAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("studentIds=" + JSON.stringify(studentIds));
        }

        function selectAll() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = true;
            });
        }
    </script>
</head>
<body>
    <div class="content">
        <div style="color: black; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
        <br>
        <%
        String msg = request.getParameter("msg");
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
                    <th scope="col">Select</th>
                    <th scope="col">Student_ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Current Course</th>
                    <th scope="col">Current Course Completion Year</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT s.student_id, CONCAT(s.first_name, ' ', s.last_name) AS full_name, " +
                                                    "CASE " +
                                                    "WHEN s.masters_passing_year IS NOT NULL THEN s.masters_passing_year " +
                                                    "ELSE s.undergraduate_passing_year " +
                                                    "END AS current_course_completion_year, " +
                                                    "CASE " +
                                                    "WHEN s.masters_degree IS NOT NULL THEN " +
                                                    "CONCAT(s.masters_degree, ' in ', s.masters_major) " +
                                                    "ELSE " +
                                                    "CONCAT(s.undergraduate_degree, ' in ', s.undergraduate_major) " +
                                                    "END AS current_course, " +
                                                    "u.status FROM student s JOIN user_1 u ON s.user_id = u.user_id");
                    while (rs.next()) {
                %>
                <tr>
                    <td><input type="checkbox" value="<%=rs.getString(1)%>"></td>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td id="status_<%=rs.getString(1)%>"><%=rs.getString(5) %></td>
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
        <button onclick="selectAll()">Select All</button>
        <button onclick="toggleStatus()">Toggle Status <i class='fas fa-pen-fancy'></i></button>
        <br>
        <br>
    </div>
</body>
</html> --%>

<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="project.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Student Details</title>
    <link rel="stylesheet" href="../css/Home.css"> 
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
      /*   function toggleStatus() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
            var studentIds = [];
            checkboxes.forEach(function(checkbox) {
                studentIds.push(checkbox.value);
                var statusElement = document.getElementById("status_" + checkbox.value);
                var currentStatus = statusElement.textContent.trim();
                var newStatus = currentStatus === "active" ? "inactive" : "active";
                statusElement.textContent = newStatus;
            });

            // Send AJAX request to update status in the database for all selected entries
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "studentStatusAction.jsp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("studentIds=" + JSON.stringify(studentIds));
        }
 */
 
 function toggleStatus() {
	    var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
	    var studentIds = [];
	    checkboxes.forEach(function(checkbox) {
	        studentIds.push(checkbox.value);
	        var statusElement = document.getElementById("status_" + checkbox.value);
	        var currentStatus = statusElement.textContent.trim();
	        var newStatus = currentStatus === "active" ? "inactive" : "active";
	        statusElement.textContent = newStatus;
	        // Send AJAX request to update status in the database for this student
	        var xhr = new XMLHttpRequest();
	        xhr.open("POST", "studentStatusAction.jsp", true);
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.send("studentId=" + checkbox.value + "&status=" + newStatus);
	    });
	}

        /* function selectAll() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = true;
            });
        } */
        
        function selectAll() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function(checkbox) {
                var row = checkbox.parentNode.parentNode; // Get the parent row of the checkbox
                if (row.style.display !== "none") { // Check if the row is displayed
                    checkbox.checked = true;
                }
            });
        }



         function filterByYear() {
            var year = document.getElementById("filterYear").value;
            var table = document.getElementById("studentTable");
            var rows = table.getElementsByTagName("tr");
            for (var i = 0; i < rows.length; i++) {
                var yearCell = rows[i].getElementsByTagName("td")[4];
                if (yearCell) {
                    var yearText = yearCell.textContent || yearCell.innerText;
                    if (yearText === year || year === "All") {
                        rows[i].style.display = "";
                    } else {
                        rows[i].style.display = "none";
                    }
                }
            }
        } 
        
      
    </script>
</head>
<body>
    <div class="content">
        <div style="color: black; text-align: center; font-size: 30px;">Student Details<i class='fab fa-elementor'></i></div>
        <br>
        <%
        String msg = request.getParameter("msg");
        if ("done".equals(msg)) {
        %>
        <script>alert("Product Successfully Updated!");</script>
        <%} %>
        <%
        if ("wrong".equals(msg)) {
        %>
        <script>alert("Something went wrong! Try again!");</script>
        <%} %>
        <!-- <input type="text" id="filterYear" placeholder="Enter Year"> -->
        <input type="number" id="filterYear" placeholder="Enter Year" min="1900" max="2100">
        
        <button onclick="filterByYear()">Filter</button>
        <!-- <button onclick="filterByYear('All')">Show All</button> -->

        <table id="studentTable">
            <thead>
                <tr>
                    <th scope="col">Select</th>
                    <th scope="col">Student_ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Current Course</th>
                    <th scope="col">Current Course Completion Year</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT s.student_id, CONCAT(s.first_name, ' ', s.last_name) AS full_name, " +
                                                    "CASE " +
                                                    "WHEN s.masters_passing_year IS NOT NULL THEN s.masters_passing_year " +
                                                    "ELSE s.undergraduate_passing_year " +
                                                    "END AS current_course_completion_year, " +
                                                    "CASE " +
                                                    "WHEN s.masters_degree IS NOT NULL THEN " +
                                                    "CONCAT(s.masters_degree, ' in ', s.masters_major) " +
                                                    "ELSE " +
                                                    "CONCAT(s.undergraduate_degree, ' in ', s.undergraduate_major) " +
                                                    "END AS current_course, " +
                                                    "u.status FROM student s JOIN user_1 u ON s.user_id = u.user_id");
                    while (rs.next()) {
                %>
                <tr>
                    <td><input type="checkbox" value="<%=rs.getString(1)%>"></td>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td id="status_<%=rs.getString(1)%>"><%=rs.getString(5) %></td>
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
        <button onclick="selectAll()">Select All</button>
        <button onclick="toggleStatus()">Toggle Status <i class='fas fa-pen-fancy'></i></button>
        <br>
        <br>
    </div>
</body>
</html>


