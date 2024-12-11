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
    <title>Edit Placement Drive</title>
    <link rel="stylesheet" href="../css/style.css" />
</head>
<body>
<%
String driveIdParam = request.getParameter("id");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM Placement_drive WHERE drive_id=?");
    ps.setString(1, driveIdParam);
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
%>

<section class="container">
    <header>Edit Placement Drive</header>
    <form class='form' action="editPlacementDriveAction.jsp" method="post">
        <input type="hidden" name="driveId" value="<%=rs.getString(1)%>">
        <div class="input-box">
            <label>Company ID</label>
            <input type="text" name="companyId" value="<%=rs.getString(2)%>" required>
        </div>
        <div class="input-box">
            <label>Drive Date</label>
            <input type="text" name="driveDate" value="<%=rs.getString(3)%>" required>
        </div>
        <div class="input-box">
            <label>Job Role</label>
            <input type="text" name="jobRole" value="<%=rs.getString(4)%>" required>
        </div>
        <div class="input-box">
            <label>Form Opening Date</label>
            <input type="text" name="formOpening" value="<%=rs.getString(5)%>" required>
        </div>
        <div class="input-box">
            <label>Form Closing Date</label>
            <input type="text" name="formClosing" value="<%=rs.getString(6)%>" required>
        </div>
        <div class="input-box">
            <label>Degree Name</label>
            <input type="text" name="degreeName" value="<%=rs.getString(7)%>" required>
        </div>
        <div class="input-box">
            <label>Major Name</label>
            <input type="text" name="majorName" value="<%=rs.getString(8)%>" required>
        </div>
        <div class="input-box">
            <label>Minimum Percentage</label>
            <input type="text" name="minPercentage" value="<%=rs.getString(9)%>" required>
        </div>
        <div class="input-box">
            <label>Status</label>
            <input type="text" name="status" value="<%=rs.getString(10)%>" required>
        </div>
        <button type="submit">Save</button>
    </form>
</section>

<%
    }
} catch(Exception e) {
    System.out.println(e);
}
%>

<script>
// Check if the page was loaded by refreshing
if (performance.navigation.type === 1) {
    // Remove the message parameter from the URL
    history.replaceState({}, document.title, location.pathname);
}
</script>
</body>
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
    <title>Edit Placement Drive</title>
    <link rel="stylesheet" href="../css/style.css" />
</head>
<body>
<%
String driveIdParam = request.getParameter("id");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM Placement_drive WHERE drive_id=?");
    ps.setString(1, driveIdParam);
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
%>

<section class="container">
    <header>Edit Drive Status</header>
    <form class='form' action="editPlacementDriveAction.jsp" method="post">
        <input type="hidden" name="driveId" value="<%=rs.getString(1)%>">
        
             <label for="Status">Status</label>
<div class="select-box" >
    <select id="Status" name="status" required>
        
        <option value="active" <%= rs.getString(5).equals("active") ? "selected" : "" %>>Active</option>
                <option value="inactive" <%= rs.getString(5).equals("inactive") ? "selected" : "" %>>Inactive</option>
        
    </select>
</div>
        
        
        <button type="submit">Save</button>
    </form>
</section>

<%
    }
} catch(Exception e) {
    System.out.println(e);
}
%>

<script>
// Check if the page was loaded by refreshing
if (performance.navigation.type === 1) {
    // Remove the message parameter from the URL
    history.replaceState({}, document.title, location.pathname);
}
</script>
</body>
</html>
 