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
String status = request.getParameter("status");
String adminUserId = request.getParameter("admin_user_id");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO Placement_drive (company_id, drive_date, job_role, form_opening, form_closing, degree_name, major_name, minimum_percentage, status, admin_user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
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
    ps.executeUpdate();
    response.sendRedirect("addNewPlacementDrive.jsp?msg=done");
} catch(Exception e) {
    e.printStackTrace(); // This will print the stack trace to the server log
    // Or you can send the exception message to the browser
    out.println("Exception occurred: " + e.getMessage());
    response.sendRedirect("addNewPlacementDrive.jsp?msg=wrong");
}
%>
