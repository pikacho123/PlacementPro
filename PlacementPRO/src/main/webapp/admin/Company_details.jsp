<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Company Edit</title>
<link rel="stylesheet" href="../css/Home.css"> 
<style>
h3 {
    color: black;
    text-align: center;
}


</style>
</head>
<body>
<div class=content>
<div style="color: black; text-align: center; font-size: 30px;">Company Details<i class='fab fa-elementor'></i></div>
<br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)) {
%>
<!-- <h3 class="alert">Company Successfully Updated!</h3> -->
<script>
alert("Company Successfully Updated!");
</script>
<%} %>
<%
if("error".equals(msg)) {
%>
<!-- <h3 class="alert">Something went wrong! Try again!</h3> -->
<script>
alert("Something went wrong! Try again!");
</script>
<%} %>
<!-- <a href="addNewProduct.jsp">Add New Company <i class='fas fa-plus-square'></i></a> -->

 <!-- <button onclick="location.href='addNewProduct.jsp'" class="add-button">
    Add New Company <i class='fas fa-plus-square'></i>
</button> -->

<div class="button-container">
    <button onclick="location.href='addNewCompany.jsp'" class="add-button">
        Add New Company <i class='fas fa-plus-square'></i>
    </button>
</div>


<table>
        <thead>
          <tr>
            <th scope="col">Company ID</th>
            <th scope="col">Company Name</th>
            <th scope="col">Description</th>
            <th scope="col">Location</th>
            <th scope="col">Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
       try {
           Connection con=ConnectionProvider.getCon();
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("SELECT * FROM Company_master");
           while(rs.next()) {
       %>
          <tr>
            <td><%=rs.getString("company_id") %></td>
            <td><%=rs.getString("company_name") %></td>
            <td><%=rs.getString("description") %></td>
            <td><%=rs.getString("location") %></td>
            <td><%=rs.getString("status") %></td>
            <td><a href="editCompany.jsp?id=<%=rs.getString("company_id") %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%
         }
         }
         catch(Exception e) {
             System.out.println(e);
         }
         %>
        </tbody>
      </table>
     
      <br>
      <br>
      <br>
</div>
<script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }
</script>
</body>
</html>
