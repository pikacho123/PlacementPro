<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String companyId = request.getParameter("companyId");
String companyName = request.getParameter("companyName");
String description = request.getParameter("description");
String location = request.getParameter("location");
String status = request.getParameter("status");

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pstmt = con.prepareStatement("UPDATE Company_master SET company_name=?, description=?, location=?, status=? WHERE company_id=?");
    pstmt.setString(1, companyName);
    pstmt.setString(2, description);
    pstmt.setString(3, location);
    pstmt.setString(4, status);
    pstmt.setString(5, companyId);

    int rowsUpdated = pstmt.executeUpdate();
    
    if (rowsUpdated > 0) {
        if (status.equals("inactive")) {
            // Delete related entries from other tables if needed
            // For example: st.executeUpdate("DELETE FROM related_table WHERE company_id=?");
        }
        response.sendRedirect("Company_details.jsp?msg=done");
    } else {
        response.sendRedirect("Company_details.jsp?msg=error");
    }
} catch(Exception e) {
    System.out.println(e);
    response.sendRedirect("Company_details.jsp?msg=error");
}
%>
