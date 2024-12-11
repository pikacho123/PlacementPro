<%-- <%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>

<%
    // Get the processId parameter from the request
    String processId = request.getParameter("processId");

    try {
        // Establish a connection to the database
        Connection con = ConnectionProvider.getCon();

        // Prepare the SQL statement to insert data into the placement_history table
        PreparedStatement ps = con.prepareStatement("INSERT INTO placement_history (process_id) VALUES (?)");

        // Set the processId parameter for the SQL statement
        ps.setString(1, processId);

        // Execute the SQL statement
        int rowsInserted = ps.executeUpdate();

        // Check if the insertion was successful
        if (rowsInserted > 0) {
            // If successful, send a success response
            out.println("success");
        } else {
            // If unsuccessful, send an error response
            out.println("error");
        }

        // Close the database connection
        con.close();
    } catch (Exception e) {
        // If an exception occurs, print the stack trace and send an error response
        e.printStackTrace();
        out.println("error");
    }
%>
 --%>
 
<%--  
 <%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>

<%
    // Get the processId parameter from the request attributes
    int processId = (int) request.getAttribute("processId");

    try {
        // Establish a connection to the database
        Connection con = ConnectionProvider.getCon();

        // Prepare the SQL statement to insert data into the placement_history table
        PreparedStatement ps = con.prepareStatement("INSERT INTO placement_history (process_id) VALUES (?)");

        // Set the processId parameter for the SQL statement
        ps.setInt(1, processId);

        // Execute the SQL statement
        int rowsInserted = ps.executeUpdate();

        // Check if the insertion was successful
        if (rowsInserted > 0) {
            // If successful, send a success response
            out.println("success");
        } else {
            // If unsuccessful, send an error response
            out.println("error");
        }

        // Close the database connection
        con.close();
    } catch (Exception e) {
        // If an exception occurs, print the stack trace and send an error response
        e.printStackTrace();
        out.println("error");
    }
%> --%>
 