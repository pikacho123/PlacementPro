<%-- <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String studentId = request.getParameter("studentId");
String status = request.getParameter("status");

try {
    Connection con = ConnectionProvider.getCon();
  /*   PreparedStatement ps = con.prepareStatement("UPDATE student SET status = ? WHERE student_id = ?");
    ps.setString(1, status);
    ps.setString(2, studentId);
    ps.executeUpdate(); */
    
    PreparedStatement psUser = con.prepareStatement("UPDATE user_1 SET status = ? WHERE user_id = (SELECT user_id FROM student WHERE student_id = ?)");
    psUser.setString(1, status);
    psUser.setString(2, studentId);
    psUser.executeUpdate();
    response.sendRedirect("StudentDetails.jsp.jsp?msg=done");
} catch(Exception e) {
    System.out.println(e);
    response.sendRedirect("StudentDetails.jsp.jsp?msg=wrong");
}
%>
 --%>
 
 <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String studentId = request.getParameter("studentId");
String status = request.getParameter("status");

try {
    Connection con = ConnectionProvider.getCon();
    
    PreparedStatement psUser = con.prepareStatement("UPDATE user_1 SET status = ? WHERE user_id = (SELECT user_id FROM student WHERE student_id = ?)");
    psUser.setString(1, status);
    psUser.setString(2, studentId);
    psUser.executeUpdate();
    
    response.sendRedirect("StudentDetails.jsp?msg=done");
} catch(Exception e) {
    System.out.println(e);
    response.sendRedirect("StudentDetails.jsp?msg=wrong");
}
%>
 