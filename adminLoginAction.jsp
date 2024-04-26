<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("SELECT * FROM user_1 WHERE email=? AND password=? AND role='admin'");
    pst.setString(1, email);
    pst.setString(2, password);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        session.setAttribute("email", email);
        response.sendRedirect("admin/adminHome.jsp");
    } else {
        response.sendRedirect("adminLogin.jsp?msg=notexist");
    }
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("adminLogin.jsp?msg=invalid");
}
%>
