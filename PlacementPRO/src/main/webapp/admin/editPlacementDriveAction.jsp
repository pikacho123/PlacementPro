<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String driveId = request.getParameter("driveId");
String status = request.getParameter("status");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pstmt = con.prepareStatement("UPDATE Placement_drive SET status=? WHERE drive_id=?");
    pstmt.setString(1, status);
    pstmt.setString(2, driveId);

    int rowsUpdated = pstmt.executeUpdate();
    
    if (rowsUpdated > 0) {
        if (status.equals("inactive")) {
            // Delete related entries from other tables if needed
            // For example: st.executeUpdate("DELETE FROM related_table WHERE drive_id=?");
        }
        response.sendRedirect("PlacementDisplay.jsp?msg=done");
    } else {
        response.sendRedirect("PlacementDisplay.jsp?msg=error");
    }
} catch(Exception e) {
    System.out.println(e);
    response.sendRedirect("PlacementDisplay.jsp?msg=error");
}
%>
