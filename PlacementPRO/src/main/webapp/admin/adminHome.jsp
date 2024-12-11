<%-- <%@include file="adminHeader.jsp" %> --%>
<%-- <%@include file="AdminNavbar.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome</title>
<link rel="stylesheet" href="../css/Home.css">
</head>
<body>
<div class="content">
  <h1>Welcome Admin!</h1>
</div>
</body>
</html>
<%@include file="../footer.jsp" %> --%>


<%@include file="AdminNavbar.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome</title>
<style>
  .content {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* This will make the container take up the full height of the viewport */
  }

  .centered {
    text-align: center;
  }
</style>
<link rel="stylesheet" href="../css/Home.css">
</head>
<body>
<div class="content">
  <div class="centered">
    <h1>Welcome Admin!</h1>
  </div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>
