<%-- <%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%
// Retrieve parameter from the request
int applicationId = Integer.parseInt(request.getParameter("applicationId"));

try {
    // Fetch the current placement status of the application
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT placement_status FROM student WHERE user_id = (SELECT user_id FROM application WHERE application_id = ?)");
    ps.setInt(1, applicationId);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        String currentStatus = rs.getString("placement_status");
        String newStatus = currentStatus.equals("unplaced") ? "placed" : currentStatus; // Toggle status
        // Update placement status in the database
        PreparedStatement updatePs = con.prepareStatement("UPDATE student SET placement_status = ? WHERE user_id = (SELECT user_id FROM application WHERE application_id = ?)");
        updatePs.setString(1, newStatus);
        updatePs.setInt(2, applicationId);
        int rowsAffected = updatePs.executeUpdate();

        if (rowsAffected > 0) {
            // Send success response
            response.getWriter().write("success");
        } else {
            // Send failure response
            response.getWriter().write("failure");
        }
    } else {
        // Send failure response
        response.getWriter().write("failure");
    }
    con.close();
} catch (Exception e) {
    e.printStackTrace();
    // Send failure response
    response.getWriter().write("failure");
}
%>
 --%>
 
<%--  <%@ page import="java.sql.*" %>





<%@ page import="project.ConnectionProvider" %>
<%
// Retrieve parameter from the request
int applicationId = Integer.parseInt(request.getParameter("applicationId"));

try {
    // Fetch the current placement status of the application
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT placement_status FROM student WHERE user_id = (SELECT user_id FROM application WHERE application_id = ?)");
    ps.setInt(1, applicationId);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        String currentStatus = rs.getString("placement_status");
        String newStatus = currentStatus.equals("unplaced") ? "placed" : currentStatus; // Toggle status
        // Update placement status and date-time in the database
        PreparedStatement updatePs = con.prepareStatement("UPDATE student SET placement_status = ?, placement_date_time = CASE WHEN ? = 'placed' THEN NOW() ELSE NULL END WHERE user_id = (SELECT user_id FROM application WHERE application_id = ?)");
        updatePs.setString(1, newStatus);
        updatePs.setString(2, newStatus);
        updatePs.setInt(3, applicationId);
        int rowsAffected = updatePs.executeUpdate();

        if (rowsAffected > 0) {
            // Send success response
            response.getWriter().write("success");
        } else {
            // Send failure response
            response.getWriter().write("failure");
        }
    } else {
        // Send failure response
        response.getWriter().write("failure");
    }
    con.close();
} catch (Exception e) {
    e.printStackTrace();
    // Send failure response
    response.getWriter().write("failure");
}
%> --%>
 
 
 <%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%
// Retrieve parameter from the request
int applicationId = Integer.parseInt(request.getParameter("applicationId"));

try {
    // Fetch the current placement status of the application
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT placement_status FROM student WHERE user_id = (SELECT user_id FROM application WHERE application_id = ?)");
    ps.setInt(1, applicationId);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        String currentStatus = rs.getString("placement_status");
        String newStatus = currentStatus.equals("unplaced") ? "placed" : currentStatus; // Toggle status
        
        // Update placement status and date-time in the database
        PreparedStatement updatePs = con.prepareStatement("UPDATE student SET placement_status = ?, placement_date_time = CASE WHEN ? = 'placed' THEN NOW() ELSE NULL END WHERE user_id = (SELECT user_id FROM application WHERE application_id = ?)");
        updatePs.setString(1, newStatus);
        updatePs.setString(2, newStatus);
        updatePs.setInt(3, applicationId);
        int rowsAffected = updatePs.executeUpdate();

        if (rowsAffected > 0) {
            // Insert application ID into placement_history table
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO placement_history (application_id) VALUES (?)");
            insertPs.setInt(1, applicationId);
            insertPs.executeUpdate();
            
            // Send success response
            response.getWriter().write("success");
        } else {
            // Send failure response
            response.getWriter().write("failure");
        }
    } else {
        // Send failure response
        response.getWriter().write("failure");
    }
    con.close();
} catch (Exception e) {
    e.printStackTrace();
    // Send failure response
    response.getWriter().write("failure");
}
%>
 