<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String studentId = request.getParameter("studentId");
String currentStatus = request.getParameter("currentStatus");

// Handle null or empty currentStatus
String newStatus = (currentStatus != null && currentStatus.equals("placed")) ? "unplaced" : "placed";

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("UPDATE student SET placement_status = ? WHERE student_id = ?");
    ps.setString(1, newStatus);
    ps.setString(2, studentId);
    ps.executeUpdate();
    request.setAttribute("msg", "done"); // Set the attribute to indicate success
    request.getRequestDispatcher("adminPanel.jsp").forward(request, response); // Forward the request
} catch(Exception e) {
    System.out.println(e);
    request.setAttribute("msg", "wrong"); // Set the attribute to indicate failure
    request.getRequestDispatcher("adminPanel.jsp").forward(request, response); // Forward the request
}
%>
