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
 
 
 <%@page import="project.ConnectionProvider" %>
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
        
        
        <label for="Status">Status</label>
<div class="select-box" >
    <select id="Status" name="status">
        
        <option value="active">Active</option>
        <option value="inactive">Inactive</option>
        
    </select>
</div>
</div>




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
  </body>
</html>
 