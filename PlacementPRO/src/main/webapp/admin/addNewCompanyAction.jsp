<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String companyId = request.getParameter("company_id");
String companyName = request.getParameter("company_name");
String description = request.getParameter("description");
String location = request.getParameter("location");
/* String status = request.getParameter("status"); */
String adminUserId = request.getParameter("admin_user_id");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO Company_master (company_id, company_name, description, location,  admin_user_id) VALUES (?, ?, ?, ?, ?)");
    ps.setString(1, companyId);
    ps.setString(2, companyName);
    ps.setString(3, description);
    ps.setString(4, location);
   /*  ps.setString(5, status); */
    ps.setString(5, adminUserId);
    ps.executeUpdate();
    response.sendRedirect("addNewCompany.jsp?msg=done");
} catch(Exception e) {
	 e.printStackTrace(); // This will print the stack trace to the server log
	    // Or you can send the exception message to the browser
	    out.println("Exception occurred: " + e.getMessage());
    response.sendRedirect("addNewCompany.jsp?msg=wrong");
}
%>
