<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="../css/addNewProduct-style.css">
    <title>Add New Placement Drive</title>
</head>
<body>
<%
    String msg = request.getParameter("msg");
    if ("done".equals(msg)) {
%>
<h3 class="alert">Placement Drive Added Successfully!</h3>
<%
    }
    if ("wrong".equals(msg)) {
%>
<h3 class="alert">Something went wrong! Try Again!</h3>
<%
    }
%>

<%
    // Fetch active company names and their IDs
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        con = ConnectionProvider.getCon();
        ps = con.prepareStatement("SELECT company_id, company_name FROM Company_master WHERE status='active'");
        rs = ps.executeQuery();
%>
<form action="addNewPlacementDriveAction.jsp" method="post">
    <div class="left-div">
        <h3>Select Company</h3>
        <select class="input-style" name="company_id">
<%
            while (rs.next()) {
                int companyId = rs.getInt("company_id");
                String companyName = rs.getString("company_name");
%>
            <option value="<%= companyId %>"><%= companyName %></option>
<%
            }
%>
        </select>
        <hr>
    </div>
<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<div class="right-div">
    <h3>Drive Date</h3>
    <input class="input-style" type="date" name="drive_date" required>
    <hr>
    <h3>Job Role</h3>
    <input class="input-style" type="text" name="opening_positions" required>
    <hr>
    <h3>Form Opening Date</h3>
    <input class="input-style" type="date" name="form_opening_date" required>
    <hr>
    <h3>Form Closing Date</h3>
    <input class="input-style" type="date" name="form_closing_date" required>
    <hr>
    <h3>Degree Name</h3>
    <select class="input-style" name="degree_name">
        <option value="Bachelor of Arts">Bachelor of Arts</option>
        <option value="Bachelor of Science">Bachelor of Science</option>
        <option value="Bachelor of Engineering">Bachelor of Engineering</option>
        <option value="Master of Arts">Master of Arts</option>
        <option value="Master of Science">Master of Science</option>
        <option value="Master of Engineering">Master of Engineering</option>
        <option value="Other">Other</option>
    </select>
    <hr>
    <h3>Major Name</h3>
    <select class="input-style" name="major_name">
        <option value="Computer Science">Computer Science</option>
        <option value="Electrical Engineering">Electrical Engineering</option>
        <option value="Mechanical Engineering">Mechanical Engineering</option>
        <option value="Mathematics">Mathematics</option>
        <option value="Physics">Physics</option>
        <option value="Other">Other</option>
    </select>
    <hr>
    <h3>Minimum Percentage</h3>
    <input class="input-style" type="number" name="minimum_percentage" required>
    <hr>
    <h3>Status</h3>
    <select class="input-style" name="status">
        <option value="active">Active</option>
        <option value="inactive">Inactive</option>
    </select>
    <hr>
</div>

<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>
 --%>
 
 
 <%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Add New Drive</title>
  
    <!---Custom CSS File--->
    <link rel="stylesheet" href="../css/style.css" />
  </head>
  <body>
    <%
    String msg = request.getParameter("msg");
    if ("done".equals(msg)) {
%>
<script>alert("Drive Added Successfully!");</script>
<%
    }
    if ("wrong".equals(msg)) {
%>
<script>alert("Something went wrong! Try Again!");</script>
<%
    }
%>

<%
    // Fetch active company names and their IDs
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        con = ConnectionProvider.getCon();
        ps = con.prepareStatement("SELECT company_id, company_name FROM Company_master WHERE status='active'");
        rs = ps.executeQuery();
%>

    <section class="container">
      <header>Post Job Details</header>
      <form class='form' action="addNewPlacementDriveAction.jsp" method="post" >

        <label for="Company">Select Company</label>
<div class="select-box" >
    <select id="Company" name="company_id">
        <%
            while (rs.next()) {
                int companyId = rs.getInt("company_id");
                String companyName = rs.getString("company_name");
%>
            <option value="<%= companyId %>"><%= companyName %></option>
<%
            }
%>
        
    </select>
</div>
<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<%
// Fetch admin_user_id from user_1 table
int adminUserId = 0; // Default value
try {
   /*  Connection con = ConnectionProvider.getCon(); */
    Statement st = con.createStatement();
    ResultSet adminRs = st.executeQuery("SELECT user_id FROM user_1 WHERE role='admin' AND status='active' LIMIT 1");
    if (adminRs.next()) {
        adminUserId = adminRs.getInt("user_id");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>


 <div class="column">
        <div class="input-box">
          <label>Form Opening Date</label>
          <input type="date" name="form_opening_date" required>
        </div>
<div class="input-box">
          <label>Form Closing Date</label>
          <input type="date" name="form_closing_date" required>
        </div>
        
</div>

 <div class="column">
        <div class="input-box">
          <label>Drive Date</label>
          <input type="date" name="drive_date" required>
        </div>
<div class="input-box">
          <label>Job Role</label>
          <input type="text" name="opening_positions" required>
        </div>
        
</div>



<br>
 <div class="column">

                <label for="Degree">Degree Name</label>
<div class="select-box" >
    <select id="Degree" name="degree_name">
        <option value="Bachelor of Arts">Bachelor of Arts</option>
        <option value="Bachelor of Science">Bachelor of Science</option>
        <option value="Bachelor of Engineering">Bachelor of Engineering</option>
        <option value="Master of Arts">Master of Arts</option>
        <option value="Master of Science">Master of Science</option>
        <option value="Master of Engineering">Master of Engineering</option>
        <option value="Other">Other</option>
        
    </select>
</div>



<label for="Major">Major Name</label>
<div class="select-box" >

    <select id="Major" name="major_name">
        <option value="Computer Science">Computer Science</option>
        <option value="Electrical Engineering">Electrical Engineering</option>
        <option value="Mechanical Engineering">Mechanical Engineering</option>
        <option value="Mathematics">Mathematics</option>
        <option value="Physics">Physics</option>
        <option value="Other">Other</option>
        
    </select>
</div>
        
</div>

<div class="column">
<div class="input-box">
          <label>Minimum Percentage</label>
          <input type="number" name="minimum_percentage" required>
        </div>
       
<div class="input-box">
          <label>Package</label>
          <input type="number" name="Package" >
        </div>
        
<div class="input-box">
          <label>Job Openings</label>
          <input type="number" name="Job_openings" required>
        </div>
        
<!--         <label for="Status">Status</label>
<div class="select-box" >
    <select id="Status" name="status">
        
        <option value="active">Active</option>
        <option value="inactive">Inactive</option>
        
    </select>
</div> -->
</div>


<input type="hidden" name="admin_user_id" value="<%= adminUserId %>">

        <button  type="submit">Submit</button>
      </form>
    </section>
    <script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }
</script>

<script>
  // Function to validate dates
  function validateDates() {
    // Get today's date
    var today = new Date();
    today.setHours(0, 0, 0, 0); // Set hours, minutes, seconds, and milliseconds to 0

    // Get selected dates from the form
    var driveDate = new Date(document.getElementsByName("drive_date")[0].value);
    var formOpeningDate = new Date(document.getElementsByName("form_opening_date")[0].value);
    var formClosingDate = new Date(document.getElementsByName("form_closing_date")[0].value);

    // Check if any of the selected dates are less than today's date
    if (driveDate < today || formOpeningDate < today || formClosingDate < today) {
      alert("Dates cannot be less than today's date.");
      return false; // Prevent form submission
    }

    // Check if drive date is greater than form closing date
    if (driveDate <= formClosingDate) {
      alert("Drive date must be greater than form closing date.");
      return false; // Prevent form submission
    }

    // Check if form closing date is greater than form opening date
    if (formClosingDate <= formOpeningDate) {
      alert("Form closing date must be greater than form opening date.");
      return false; // Prevent form submission
    }

    return true; // Allow form submission
  }

  // Add event listener to the form for validation
  document.querySelector('.form').addEventListener('submit', function(event) {
    if (!validateDates()) {
      event.preventDefault(); // Prevent form submission if validation fails
    }
  });
</script>


  </body>
</html> --%>
 
 
 <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp"%>
<%@include file="../footer.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Add New Drive</title>

    <!---Custom CSS File--->
    <link rel="stylesheet" href="../css/style.css"/>
</head>
<body>
<%
    String msg = request.getParameter("msg");
    if ("done".equals(msg)) {
%>
    <script>alert("Drive Added Successfully!");</script>
<%
    }
    if ("wrong".equals(msg)) {
%>
    <script>alert("Something went wrong! Try Again!");</script>
<%
    }
%>

<%
// Fetch admin_user_id from user_1 table
int adminUserId = 0; // Default value
Connection con = null;
Statement st = null;
ResultSet adminRs = null;
try {
    con = ConnectionProvider.getCon();
    st = con.createStatement();
    adminRs = st.executeQuery("SELECT user_id FROM user_1 WHERE role='admin' AND status='active' LIMIT 1");
    if (adminRs.next()) {
        adminUserId = adminRs.getInt("user_id");
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (adminRs != null) adminRs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

<section class="container">
    <header>Post Job Details</header>
    <form class='form' action="addNewPlacementDriveAction.jsp" method="post">

        <label for="Company">Select Company</label>
        <div class="select-box">
            <select id="Company" name="company_id">
                <%
                    Connection con1 = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        con1 = ConnectionProvider.getCon();
                        ps = con1.prepareStatement("SELECT company_id, company_name FROM Company_master WHERE status='active'");
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            int companyId = rs.getInt("company_id");
                            String companyName = rs.getString("company_name");
                %>
                <option value="<%= companyId %>"><%= companyName %></option>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (ps != null) ps.close();
                            if (con1 != null) con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </select>
        </div>

        <div class="column">
            <div class="input-box">
                <label>Form Opening Date</label>
                <input type="date" name="form_opening_date" required>
            </div>
            <div class="input-box">
                <label>Form Closing Date</label>
                <input type="date" name="form_closing_date" required>
            </div>
        </div>

        <div class="column">
            <div class="input-box">
                <label>Drive Date</label>
                <input type="date" name="drive_date" required>
            </div>
            <div class="input-box">
                <label>Job Role</label>
                <input type="text" name="opening_positions" required>
            </div>
        </div>

        <div class="column">
            <label for="Degree">Degree Name</label>
            <div class="select-box">
                <select id="Degree" name="degree_name">
                    <option value="Bachelor of Arts">Bachelor of Arts</option>
                    <option value="Bachelor of Science">Bachelor of Science</option>
                    <option value="Bachelor of Engineering">Bachelor of Engineering</option>
                    <option value="Master of Arts">Master of Arts</option>
                    <option value="Master of Science">Master of Science</option>
                    <option value="Master of Engineering">Master of Engineering</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <label for="Major">Major Name</label>
            <div class="select-box">
                <select id="Major" name="major_name">
                    <option value="Computer Science">Computer Science</option>
                    <option value="Electrical Engineering">Electrical Engineering</option>
                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                    <option value="Mathematics">Mathematics</option>
                    <option value="Physics">Physics</option>
                    <option value="Other">Other</option>
                </select>
            </div>
        </div>

        <div class="column">
            <div class="input-box">
                <label>Minimum Percentage</label>
                <input type="number" name="minimum_percentage" required>
            </div>
            <div class="input-box">
                <label>Package</label>
                <input type="number" name="Package">
            </div>
            <div class="input-box">
                <label>Job Openings</label>
                <input type="number" name="Job_openings" required>
            </div>
        </div>

        <input type="hidden" name="admin_user_id" value="<%= adminUserId %>">

        <button type="submit">Submit</button>
    </form>
</section>
<script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }

    // Function to validate dates
    function validateDates() {
        // Get today's date
        var today = new Date();
        today.setHours(0, 0, 0, 0); // Set hours, minutes, seconds, and milliseconds to 0

        // Get selected dates from the form
        var driveDate = new Date(document.getElementsByName("drive_date")[0].value);
        var formOpeningDate = new Date(document.getElementsByName("form_opening_date")[0].value);
        var formClosingDate = new Date(document.getElementsByName("form_closing_date")[0].value);

        // Check if any of the selected dates are less than today's date
        if (driveDate < today || formOpeningDate < today || formClosingDate < today) {
            alert("Dates cannot be less than today's date.");
            return false; // Prevent form submission
        }

        // Check if drive date is greater than form closing date
        if (driveDate <= formClosingDate) {
            alert("Drive date must be greater than form closing date.");
            return false; // Prevent form submission
        }

        // Check if form closing date is greater than form opening date
        if (formClosingDate <= formOpeningDate) {
            alert("Form closing date must be greater than form opening date.");
            return false; // Prevent form submission
        }

        return true; // Allow form submission
    }

    // Add event listener to the form for validation
    document.querySelector('.form').addEventListener('submit', function (event) {
        if (!validateDates()) {
            event.preventDefault(); // Prevent form submission if validation fails
        }
    });
</script>
</body>
</html>
 