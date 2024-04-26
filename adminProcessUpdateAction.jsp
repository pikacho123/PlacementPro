<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%
// Retrieve parameters from the request
int applicationId = Integer.parseInt(request.getParameter("applicationId"));
int processId = Integer.parseInt(request.getParameter("processId"));
String newProcess = request.getParameter("newProcess");

try {
    // Update the process name in the database
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("UPDATE selection_process SET process_name = ? WHERE application_id = ? AND process_id = ?");
    ps.setString(1, newProcess);
    ps.setInt(2, applicationId);
    ps.setInt(3, processId);
    int rowsAffected = ps.executeUpdate();
    con.close();

    if (rowsAffected > 0) {
        // Send success response
        response.getWriter().write("success");
    } else {
        // Send failure response
        response.getWriter().write("failure");
    }
} catch (Exception e) {
    e.printStackTrace();
    // Send failure response
    response.getWriter().write("failure");
}
%>
