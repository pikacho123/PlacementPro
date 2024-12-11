<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="../css/addNewProduct-style.css">
    <title>Edit Company</title>
    <style>
        .back {
            color: white;
            margin-left: 2.5%;
        }
    </style>
</head>
<body>
    <h2><a class="back" href="Company_details.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
    <%
    String companyIdParam = request.getParameter("id");
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM Company_master WHERE company_id='" + companyIdParam + "'");
        while(rs.next()) {
    %>

    <form action="editCompanyAction.jsp" method="post">
        <input type="hidden" name="companyId" value="<%=rs.getString(1)%>">
        <div class="left-div">
            <h3>Enter Name</h3>
            <input class="input-style" type="text" name="companyName" value="<%=rs.getString(2)%>" required>
            <hr>
        </div>

        <div class="right-div">
            <h3>Enter Description</h3>
            <textarea class="input-style" name="description" required><%=rs.getString(3)%></textarea>
            <hr>
        </div>

        <div class="left-div">
            <h3>Enter Location</h3>
            <input class="input-style" type="text" name="location" value="<%=rs.getString(4)%>" required>
            <hr>
        </div>

        <div class="right-div">
            <h3>Status</h3>
            <select class="input-style" name="status" required>
                <option value="active" <%= rs.getString(5).equals("active") ? "selected" : "" %>>Active</option>
                <option value="inactive" <%= rs.getString(5).equals("inactive") ? "selected" : "" %>>Inactive</option>
            </select>
            <hr>
        </div>

        
        <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
    </form>

    <%
        }
    } catch(Exception e) {
        System.out.println(e);
    }
    %>
</body>
</html>
 --%>
 
 
 <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminNavbar.jsp" %>
<%@include file="../footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Change Password</title>
    <!---Custom CSS File--->
    <link rel="stylesheet" href="../css/style.css" />
  </head>
  <body>
    
    <%
    String companyIdParam = request.getParameter("id");
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM Company_master WHERE company_id='" + companyIdParam + "'");
        while(rs.next()) {
    %>

    <section class="container">
      <header>Edit Company Details</header>
      <form class='form' action="editCompanyAction.jsp" method="post" >
        <input type="hidden" name="companyId" value="<%=rs.getString(1)%>">

 <div class="column">
        <div class="input-box">
          <label>Enter Company Name</label>
          <input type="text" name="companyName" value="<%=rs.getString(2)%>" required>
        </div>
<div class="input-box">
          <label>Enter Location</label>
          <input type="text" name="location" value="<%=rs.getString(4)%>" required>
        </div>
        
</div>
<div class="input-box">
          <label>Enter Description</label>
          <input type="text" name="description" value="<%=rs.getString(3)%>" required>
        </div>
        
        
        <label for="Status">Status</label>
<div class="select-box" >
    <select id="Status" name="status" required>
        
        <option value="active" <%= rs.getString(5).equals("active") ? "selected" : "" %>>Active</option>
                <option value="inactive" <%= rs.getString(5).equals("inactive") ? "selected" : "" %>>Inactive</option>
        
    </select>
</div>


        

        <button  type="submit">Save</button>
      </form>
    </section>
    <%
        }
    } catch(Exception e) {
        System.out.println(e);
    }
    %>
    <script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }
</script>
  </body>
</html>