<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<% 
String email=request.getParameter("email");
/* String mobilenumber=request.getParameter("mobilenumber"); */
String securityQuestions=request.getParameter("securityQuestions");
String answer=request.getParameter("answer");
String newpassword=request.getParameter("newpassword");

int check=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	/* ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and mobilenumber='"+mobilenumber+"'and securityQuestions='"+securityQuestions+"'and answer='"+answer+"'"); */
	ResultSet rs = st.executeQuery("SELECT * FROM user_1 WHERE email='" + email + "' AND security_question='" + securityQuestions + "' AND answer='" + answer + "'");
	while(rs.next())	
	{
		check=1;
		st.executeUpdate("update user_1 set password='"+newpassword+"'where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
		
	}
	if(check==0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>  --%>

<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<% 
String email=request.getParameter("email");
String securityQuestions=request.getParameter("securityQuestions");
String answer=request.getParameter("answer");
String newpassword=request.getParameter("newpassword");

int check=0;
try
{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM user_1 WHERE email='" + email + "' AND security_question='" + securityQuestions + "' AND answer='" + answer + "'");
    while(rs.next())    
    {
        check=1;
        st.executeUpdate("update user_1 set password='"+newpassword+"'where email='"+email+"'");
        response.sendRedirect("forgotPassword.jsp?msg=done");
    }
    if(check==0)
    {
        response.sendRedirect("forgotPassword.jsp?msg=invalid");
    }
}
catch(Exception e)
{
    System.out.println(e);
}
%> 
<script>
    // Function to clear the message after refreshing the page
    function clearMessage() {
        var url = window.location.href.split("?")[0];
        window.location.href = url;
    }
    
    // Call the clearMessage function after 3 seconds (adjust as needed)
    setTimeout(clearMessage, 3000); // Clear message after 3 seconds
</script>
