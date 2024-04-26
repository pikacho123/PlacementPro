<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("SELECT * FROM user_1 WHERE email=? AND password=? AND role='student'");
    pst.setString(1, email);
    pst.setString(2, password);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        String status = rs.getString("status");
        if (status.equals("active")) {
            session.setAttribute("email", email);
            response.sendRedirect("home.jsp");
        } else {
            // If status is inactive, show error message
            response.sendRedirect("studentLogin.jsp?msg=inactive");
        }
    } else {
        response.sendRedirect("studentLogin.jsp?msg=notexist");
    }
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("studentLogin.jsp?msg=invalid");
}
%>
