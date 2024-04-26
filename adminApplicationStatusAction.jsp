<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String applicationId = request.getParameter("applicationId");
String status = request.getParameter("status");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("UPDATE application SET status = ? WHERE application_id = ?");
    ps.setString(1, status);
    ps.setString(2, applicationId);
    ps.executeUpdate();
    response.sendRedirect("adminPanel.jsp?msg=done");
} catch(Exception e) {
    System.out.println(e);
    response.sendRedirect("adminPanel.jsp?msg=wrong");
}
%>
 --%>
 
<%--  <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String applicationId = request.getParameter("applicationId");
String status = request.getParameter("status");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("UPDATE application SET status = ? WHERE application_id = ?");
    ps.setString(1, status);
    ps.setString(2, applicationId);
    ps.executeUpdate();
    request.setAttribute("msg", "done"); // Set the attribute to indicate success
    request.getRequestDispatcher("adminPanel.jsp").forward(request, response); // Forward the request
} catch(Exception e) {
    System.out.println(e);
    request.setAttribute("msg", "wrong"); // Set the attribute to indicate failure
    request.getRequestDispatcher("adminPanel.jsp").forward(request, response); // Forward the request
}
%>
  --%>
  
  <%-- 
  <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String applicationId = request.getParameter("applicationId");
String status = request.getParameter("status");

try {
    Connection con = ConnectionProvider.getCon();
    
    // Update status in the application table
    PreparedStatement ps = con.prepareStatement("UPDATE application SET status = ? WHERE application_id = ?");
    ps.setString(1, status);
    ps.setString(2, applicationId);
    ps.executeUpdate();
    
    // Check if status is 'active' and insert into selection_process table
    if (status.equals("accepted")) {
        // Retrieve user_id associated with the application
        PreparedStatement getUserIdPs = con.prepareStatement("SELECT user_id FROM application WHERE application_id = ?");
        getUserIdPs.setString(1, applicationId);
        ResultSet rs = getUserIdPs.executeQuery();
        int userId = -1; // Initialize with an invalid value
        if (rs.next()) {
            userId = rs.getInt("user_id");
        }
        
        if (userId != -1) {
            // Insert into selection_process table using the retrieved user_id
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO selection_process (application_id, process_description, admin_user_id) VALUES (?, ?, ?)");
            insertPs.setString(1, applicationId);
            insertPs.setString(2, "Application");
            insertPs.setInt(3, userId);
            insertPs.executeUpdate();
        }
    }
    
    // Set the attribute to indicate success
    request.setAttribute("msg", "done");
    // Forward the request
    request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
} catch(Exception e) {
    e.printStackTrace();
    // Set the attribute to indicate failure
    request.setAttribute("msg", "wrong");
    // Forward the request
    request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
}
%>
   --%>
   
   <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String applicationId = request.getParameter("applicationId");
String status = request.getParameter("status");

try {
    Connection con = ConnectionProvider.getCon();
    
    // Update status in the application table
    PreparedStatement ps = con.prepareStatement("UPDATE application SET status = ? WHERE application_id = ?");
    ps.setString(1, status);
    ps.setString(2, applicationId);
    ps.executeUpdate();
    
    // Check if status is 'accepted' and insert into selection_process table
    if (status.equals("accepted")) {
        // Retrieve user_id associated with the application
        PreparedStatement getUserIdPs = con.prepareStatement("SELECT user_id FROM application WHERE application_id = ?");
        getUserIdPs.setString(1, applicationId);
        ResultSet rs = getUserIdPs.executeQuery();
        int userId = -1; // Initialize with an invalid value
        if (rs.next()) {
            userId = rs.getInt("user_id");
        }
        
        if (userId != -1) {
            // Insert into selection_process table using the retrieved user_id
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO selection_process (application_id, process_description, admin_user_id) VALUES (?, ?, ?)");
            insertPs.setString(1, applicationId);
            insertPs.setString(2, "Application");
            insertPs.setInt(3, userId);
            insertPs.executeUpdate();
        }
    }
    
    // Set the attribute to indicate success
    request.setAttribute("msg", "done");
    // Forward the request
    request.getRequestDispatcher("adminApplication.jsp").forward(request, response);
} catch(Exception e) {
    e.printStackTrace();
    // Set the attribute to indicate failure
    request.setAttribute("msg", "wrong");
    // Forward the request
    request.getRequestDispatcher("adminApplication.jsp").forward(request, response);
}
%>
   