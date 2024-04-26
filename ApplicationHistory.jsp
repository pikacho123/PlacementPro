<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin Panel - Accepted/Rejected Applications</title>
    <link rel="stylesheet" href="../css/Home.css"> 
    <style>
        h3 {
            color: black;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="content">
        <div style="color: black; text-align: center; font-size: 30px;">Application History <i class='fab fa-elementor'></i></div>
        <br>
        <%
        String msg = (String) request.getAttribute("msg");
        if ("done".equals(msg)) {
        %>
        <h3 class="alert">Product Successfully Updated!</h3>
        <%} %>
        <%
        if ("wrong".equals(msg)) {
        %>
        <h3 class="alert">Something went wrong! Try again!</h3>
        <%} %>
        
        <table>
            <thead>
                <tr>
                    <th scope="col">Application ID</th>
                    <th scope="col">Drive ID</th>
                    <th scope="col">Student Name</th>
                    <th scope="col">Company Name</th>
                    <th scope="col">Drive Date</th>
                    <th scope="col">Application Date</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con=ConnectionProvider.getCon();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("SELECT a.application_id, a.drive_id, CONCAT(s.first_name, ' ', s.last_name) AS student_name, c.company_name, d.drive_date, a.application_date, a.status FROM application a JOIN student s ON a.user_id = s.user_id JOIN Placement_drive d ON a.drive_id = d.drive_id JOIN Company_master c ON d.company_id = c.company_id WHERE a.status IN ('accepted', 'rejected')");
                    while(rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("application_id") %></td>
                    <td><%=rs.getString("drive_id") %></td>
                    <td><%=rs.getString("student_name") %></td>
                    <td><%=rs.getString("company_name") %></td>
                    <td><%=rs.getString("drive_date") %></td>
                    <td><%=rs.getString("application_date") %></td>
                    <td><%=rs.getString("status") %></td>
                </tr>
                <%
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                %>
            </tbody>
        </table>
        <br>
        <br>
        <br>
    </div>
</body>
</html>
