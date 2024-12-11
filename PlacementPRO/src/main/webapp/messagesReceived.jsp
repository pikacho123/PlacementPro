<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="Navbar.jsp"%> 
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message Recieved</title>

<style>
/* general styling */
body {
  margin: 0;
  padding: 0;
  font-family: "Open Sans", sans-serif;
  min-height: 100vh;
  line-height: 1.25;
}

.content {
  padding-top: 100px; /* Adjust this value as needed */
}

h1 {
  color: black;
  text-align: center;
  font-size: 100px;
}

/* Responsive adjustments */
@media screen and (max-width: 768px) {
  h1 {
    font-size: 60px; /* Adjust as needed for smaller screens */
  }
}

@media screen and (max-width: 480px) {
  .content {
    padding-top: 100px; /* Adjust as needed for smaller screens */
  }

  h1 {
    font-size: 40px; /* Adjust as needed for smaller screens */
  }
}


 /* table styling */
table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: center;
  }
  
  table td::before {
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}
 
/* for button */

.button-container {
    text-align: center;
    margin-bottom: 20px; /* Optional: Add margin for spacing */
}

.add-button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

.add-button:hover {
    background-color: #0056b3;
}

@media screen and (max-width: 600px) {
	.button-container {
        text-align: center; /* Align button container to center */
    }

    .add-button {
        display: inline-block; /* Ensure button is centered */
        padding: 8px 16px;
        font-size: 14px;
    }
}

 
 
</style>
</head>
<body>
<div class="content">
<div style="color: black; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div><br>
<table>
        <thead>
          <tr>
            <th scope="col">Date</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
       <%
       try
       {
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select * from message");
    	   while(rs.next())
    	   {
       

       %>
          <tr>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
          </tr>
       <%
    	   }}
       catch(Exception e)
       {
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
</html> --%>


<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="Navbar.jsp"%> 
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message Received</title>

<style>
/* General styling */
/* body {
  margin: 0;
  padding: 0;
  font-family: "Open Sans", sans-serif;
  min-height: 100vh;
  line-height: 1.25;
} */

body {
  margin: 0;
  padding: 0;
  font-family: "Open Sans", sans-serif;
  min-height: 100vh;
  line-height: 1.25;
  background-image: url('17973908.jpg');
  background-size: cover;
  background-position: center;
}

.content {
  padding-top: 100px;
}

h3 {
  color: black;
  text-align: center;
  font-size: 30px;
}

/* Table styling */
table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  width: 100%;
}

thead th, tbody td {
  padding: 10px;
  text-align: center;
}

tbody td {
  padding: 10px;
}

thead th:nth-child(4), tbody td:nth-child(4) {
  width: 60%; /* Adjust the width as needed */
}

tbody tr:nth-child(even) {
  background-color: #f8f8f8;
}
</style>
</head>
<body>
<div class="content">
<div style="color: black; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div><br>
<table>
        <thead>
          <tr>
            <th scope="col">Date</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
       <%
       try {
           Connection con = ConnectionProvider.getCon();
           Statement st = con.createStatement();
           ResultSet rs = st.executeQuery("select * from message");
           while(rs.next()) {
       %>
          <tr>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
          </tr>
       <%
           }
       } catch(Exception e) {
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
