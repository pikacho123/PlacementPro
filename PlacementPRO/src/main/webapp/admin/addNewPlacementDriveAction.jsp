<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String companyId = request.getParameter("company_id");
String driveDate = request.getParameter("drive_date");
String openingPositions = request.getParameter("opening_positions");
String formOpeningDate = request.getParameter("form_opening_date");
String formClosingDate = request.getParameter("form_closing_date");
String degreeName = request.getParameter("degree_name");
String majorName = request.getParameter("major_name");
String minimumPercentage = request.getParameter("minimum_percentage");
String status = request.getParameter("status");
String Package = request.getParameter("Package");
String Job_openings = request.getParameter("Job_openings");
String adminUserId = request.getParameter("admin_user_id");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO Placement_drive (company_id, drive_date, job_role, form_opening, form_closing, degree_name, major_name, minimum_percentage, status, admin_user_id,package_rupees,job_openings) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    ps.setString(1, companyId);
    ps.setString(2, driveDate);
    ps.setString(3, openingPositions);
    ps.setString(4, formOpeningDate);
    ps.setString(5, formClosingDate);
    ps.setString(6, degreeName);
    ps.setString(7, majorName);
    ps.setString(8, minimumPercentage);
    ps.setString(9, status);
    ps.setString(10, adminUserId);
    ps.setString(11, Package);
    ps.setString(12, Job_openings);
    ps.executeUpdate();
    response.sendRedirect("addNewPlacementDrive.jsp?msg=done");
} catch(Exception e) {
    e.printStackTrace(); // This will print the stack trace to the server log
    // Or you can send the exception message to the browser
    out.println("Exception occurred: " + e.getMessage());
    response.sendRedirect("addNewPlacementDrive.jsp?msg=wrong");
}
%>
 --%>
 
 
 
<%--  <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String companyId = request.getParameter("company_id");
String driveDate = request.getParameter("drive_date");
String openingPositions = request.getParameter("opening_positions");
String formOpeningDate = request.getParameter("form_opening_date");
String formClosingDate = request.getParameter("form_closing_date");
String degreeName = request.getParameter("degree_name");
String majorName = request.getParameter("major_name");
String minimumPercentage = request.getParameter("minimum_percentage");
String status = request.getParameter("status");
String Package = request.getParameter("Package");
String Job_openings = request.getParameter("Job_openings");
String adminUserId = request.getParameter("admin_user_id");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO Placement_drive (company_id, drive_date, job_role, form_opening, form_closing, degree_name, major_name, minimum_percentage, status, admin_user_id, package_rupees, job_openings) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    ps.setString(1, companyId);
    ps.setString(2, driveDate);
    ps.setString(3, openingPositions);
    ps.setString(4, formOpeningDate);
    ps.setString(5, formClosingDate);
    ps.setString(6, degreeName);
    ps.setString(7, majorName);
    ps.setString(8, minimumPercentage);
    ps.setString(9, status);
    ps.setInt(10, Integer.parseInt(adminUserId)); // Parse adminUserId to integer
    ps.setString(11, Package);
    ps.setString(12, Job_openings);
    ps.executeUpdate();
    response.sendRedirect("addNewPlacementDrive.jsp?msg=done");
} catch(Exception e) {
    e.printStackTrace(); // This will print the stack trace to the server log
    // Or you can send the exception message to the browser
    out.println("Exception occurred: " + e.getMessage());
    response.sendRedirect("addNewPlacementDrive.jsp?msg=wrong");
}
%>
  --%>
  
<%--   <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String companyId = request.getParameter("company_id");
String driveDate = request.getParameter("drive_date");
String openingPositions = request.getParameter("opening_positions");
String formOpeningDate = request.getParameter("form_opening_date");
String formClosingDate = request.getParameter("form_closing_date");
String degreeName = request.getParameter("degree_name");
String majorName = request.getParameter("major_name");
String minimumPercentage = request.getParameter("minimum_percentage");
String status = request.getParameter("status");
String Package = request.getParameter("Package");
String Job_openings = request.getParameter("Job_openings");
String adminUserId = request.getParameter("admin_user_id");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO Placement_drive (company_id, drive_date, job_role, form_opening, form_closing, degree_name, major_name, minimum_percentage, status, admin_user_id, package_rupees, job_openings) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    ps.setString(1, companyId);
    ps.setString(2, driveDate);
    ps.setString(3, openingPositions);
    ps.setString(4, formOpeningDate);
    ps.setString(5, formClosingDate);
    ps.setString(6, degreeName);
    ps.setString(7, majorName);
    ps.setString(8, minimumPercentage);
    ps.setString(9, status);
    ps.setInt(10, Integer.parseInt(adminUserId)); // Parse adminUserId to integer
    
    // Set package_rupees to an empty string if Package is empty
    if (Package != null && !Package.isEmpty()) {
        ps.setString(11, Package);
    } else {
        ps.setString(11, ""); // Set package_rupees to empty string
    }
    
    ps.setString(12, Job_openings);
    ps.executeUpdate();
    response.sendRedirect("addNewPlacementDrive.jsp?msg=done");
} catch(Exception e) {
    e.printStackTrace(); // This will print the stack trace to the server log
    // Or you can send the exception message to the browser
    out.println("Exception occurred: " + e.getMessage());
    response.sendRedirect("addNewPlacementDrive.jsp?msg=wrong");
}
%> --%>

<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String companyId = request.getParameter("company_id");
String driveDate = request.getParameter("drive_date");
String openingPositions = request.getParameter("opening_positions");
String formOpeningDate = request.getParameter("form_opening_date");
String formClosingDate = request.getParameter("form_closing_date");
String degreeName = request.getParameter("degree_name");
String majorName = request.getParameter("major_name");
String minimumPercentage = request.getParameter("minimum_percentage");
/* String status = request.getParameter("status"); */
String Package = request.getParameter("Package");
String Job_openings = request.getParameter("Job_openings");
String adminUserId = request.getParameter("admin_user_id");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO Placement_drive (company_id, drive_date, job_role, form_opening, form_closing, degree_name, major_name, minimum_percentage, admin_user_id, package_rupees, job_openings) VALUES (?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?)");
    ps.setString(1, companyId);
    ps.setString(2, driveDate);
    ps.setString(3, openingPositions);
    ps.setString(4, formOpeningDate);
    ps.setString(5, formClosingDate);
    ps.setString(6, degreeName);
    ps.setString(7, majorName);
    ps.setString(8, minimumPercentage);
  
    ps.setInt(9, Integer.parseInt(adminUserId)); // Parse adminUserId to integer
   
    
    // Set package_rupees to NULL if Package is empty
    if (Package != null && !Package.isEmpty()) {
        ps.setString(10, Package);
    } else {
        ps.setNull(10, Types.DECIMAL);
    }
    
    ps.setString(11, Job_openings);
    ps.executeUpdate();
    response.sendRedirect("addNewPlacementDrive.jsp?msg=done");
} catch(Exception e) {
    e.printStackTrace(); // This will print the stack trace to the server log
    // Or you can send the exception message to the browser
    out.println("Exception occurred: " + e.getMessage());
    response.sendRedirect("addNewPlacementDrive.jsp?msg=wrong");
}
%>

  