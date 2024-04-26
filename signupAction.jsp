<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%
String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");
String securityQuestion = request.getParameter("securityQuestions");
String answer = request.getParameter("answer");

try {
    Connection con = ConnectionProvider.getCon();
    
    // Check if the username already exists
    PreparedStatement psCheckUsername = con.prepareStatement("SELECT * FROM user_1 WHERE username = ?");
    psCheckUsername.setString(1, username);
    ResultSet rsCheckUsername = psCheckUsername.executeQuery();
    
    // Check if the email already exists
    PreparedStatement psCheckEmail = con.prepareStatement("SELECT * FROM user_1 WHERE email = ?");
    psCheckEmail.setString(1, email);
    ResultSet rsCheckEmail = psCheckEmail.executeQuery();
    
    if (rsCheckUsername.next()) {
        // Username already exists, redirect with error message
        response.sendRedirect("studentLogin.jsp?msg=wrong&error=username_exists");
    } else if (rsCheckEmail.next()) {
        // Email already exists, redirect with error message
        response.sendRedirect("studentLogin.jsp?msg=wrong&email_error=email_exists");
    } else {
        // Username and email are unique, proceed with signup
        PreparedStatement ps = con.prepareStatement("INSERT INTO user_1 (username, password, email, role, status, security_question, answer, time_stamp, Last_modified_time) VALUES (?, ?, ?, 'student', 'active', ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)");
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.setString(4, securityQuestion);
        ps.setString(5, answer);
        ps.executeUpdate();
        response.sendRedirect("studentLogin.jsp?msg=correct");
    }
} catch (Exception e) {
    System.out.println(e);
    response.sendRedirect("studentLogin.jsp?msg=wrong&error=database_error");
}
%>
