<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String userId = "";
Object userIdObj = request.getParameter("user_id"); // Getting user_id from request parameter
if (userIdObj != null) {
    userId = userIdObj.toString();
}

String driveId = request.getParameter("drive_id");
String applicationDate = (new java.sql.Date(System.currentTimeMillis())).toString();
String status = "pending"; // Assuming the application status starts as pending

try {
    int userIdInt = 0;
    if (!userId.isEmpty()) {
        userIdInt = Integer.parseInt(userId); // Parse userId to integer
    }

    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO application (user_id, drive_id, application_date, status) VALUES (?, ?, ?, ?)");
    ps.setInt(1, userIdInt); // Set userId as integer
    ps.setString(2, driveId);
    ps.setString(3, applicationDate);
    ps.setString(4, status);
    ps.executeUpdate();
    response.sendRedirect("Application.jsp?msg=done"); // Redirect to student dashboard with success message
} catch(Exception e) {
    e.printStackTrace(); 
    System.out.println(e);
    response.sendRedirect("Application.jsp?msg=wrong"); // Redirect to student dashboard with error message
}
%>

  --%>
  
  <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String userId = "";
Object userIdObj = request.getParameter("user_id");
if (userIdObj != null) {
    userId = userIdObj.toString();
}

String driveId = request.getParameter("drive_id");
String applicationDate = (new java.sql.Date(System.currentTimeMillis())).toString();
String status = "pending";

try {
    int userIdInt = 0;
    if (!userId.isEmpty()) {
        userIdInt = Integer.parseInt(userId);
    }

    Connection con = ConnectionProvider.getCon();
    PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM application WHERE user_id=? AND drive_id=?");
    checkStatement.setInt(1, userIdInt);
    checkStatement.setString(2, driveId);
    ResultSet checkRS = checkStatement.executeQuery();
    boolean hasApplied = checkRS.next();

    if (!hasApplied) {
        PreparedStatement ps = con.prepareStatement("INSERT INTO application (user_id, drive_id, application_date, status) VALUES (?, ?, ?, ?)");
        ps.setInt(1, userIdInt);
        ps.setString(2, driveId);
        ps.setString(3, applicationDate);
        ps.setString(4, status);
        ps.executeUpdate();
        response.sendRedirect("Application.jsp?msg=done");
    } else {
        response.sendRedirect("Application.jsp?msg=alreadyapplied");
    }
} catch(Exception e) {
    e.printStackTrace(); 
    System.out.println(e);
    response.sendRedirect("Application.jsp?msg=wrong");
}
%>
  