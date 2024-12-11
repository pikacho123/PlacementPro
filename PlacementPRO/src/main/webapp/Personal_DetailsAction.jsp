<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String userIdString = request.getParameter("userId");
if(userIdString != null && !userIdString.isEmpty()) {
    int userId = Integer.parseInt(userIdString);
    String firstName=request.getParameter("firstName");
    String lastName=request.getParameter("lastName");
    String phone=request.getParameter("phone");

    String dateOfBirth=request.getParameter("dateOfBirth");
    String gender=request.getParameter("gender");
    String nationality=request.getParameter("nationality");
    String highSchoolPercentage=request.getParameter("highSchoolPercentage");
    String highSchoolPassingYear=request.getParameter("highSchoolPassingYear");
    String intermediatePercentage=request.getParameter("intermediatePercentage");
    String intermediatePassingYear=request.getParameter("intermediatePassingYear");
    String undergraduateUniversityName=request.getParameter("undergraduateUniversityName");
    String undergraduateDegree=request.getParameter("undergraduateDegree");
    String undergraduateMajor=request.getParameter("undergraduateMajor");
    String undergraduatePercentage=request.getParameter("undergraduatePercentage");
    String undergraduatePassingYear=request.getParameter("undergraduatePassingYear");
    String masters=request.getParameter("masters");
    String mastersUniversityName=request.getParameter("mastersUniversityName");
    String mastersDegree=request.getParameter("mastersDegree");
    String mastersMajor=request.getParameter("mastersMajor");
    String mastersPassingYear=request.getParameter("mastersPassingYear");
    try {
        Connection con=ConnectionProvider.getCon();
        
        // Check if the userId already exists in the table
        PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM student WHERE user_id=?");
        checkStatement.setInt(1, userId);
        ResultSet resultSet = checkStatement.executeQuery();
        if(resultSet.next()) {
            // userId already exists, so update the existing record
            PreparedStatement updateStatement = con.prepareStatement("UPDATE student SET first_name=?, last_name=?, phone=?, date_of_birth=?, gender=?, nationality=?, high_school_percentage=?, high_school_passing_year=?, intermediate_percentage=?, intermediate_passing_year=?, undergraduate_university_name=?, undergraduate_degree=?, undergraduate_major=?, undergraduate_percentage=?, undergraduate_passing_year=?, Masters=?, masters_university_name=?, masters_degree=?, masters_major=?,masters_passing_year=? WHERE user_id=?");
            updateStatement.setString(1, firstName);
            updateStatement.setString(2, lastName);
            updateStatement.setString(3, phone);
            
            updateStatement.setString(4, dateOfBirth);
            updateStatement.setString(5, gender);
            updateStatement.setString(6, nationality);
            updateStatement.setString(7, highSchoolPercentage);
            updateStatement.setString(8, highSchoolPassingYear);
            updateStatement.setString(9, intermediatePercentage);
            updateStatement.setString(10, intermediatePassingYear);
            updateStatement.setString(11, undergraduateUniversityName);
            updateStatement.setString(12, undergraduateDegree);
            updateStatement.setString(13, undergraduateMajor);
            updateStatement.setString(14, undergraduatePercentage);
            updateStatement.setString(15, undergraduatePassingYear);
            updateStatement.setString(16, masters);
            updateStatement.setString(17, mastersUniversityName);
            updateStatement.setString(18, mastersDegree);
            updateStatement.setString(19, mastersMajor);
            updateStatement.setString(20, mastersPassingYear);
            updateStatement.setInt(21, userId);
            updateStatement.executeUpdate();
            response.sendRedirect("Personal_Details.jsp?msg=valid");
        } else {
            // userId doesn't exist, so insert a new record
            PreparedStatement insertStatement = con.prepareStatement("INSERT INTO student (user_id, first_name, last_name, phone, date_of_birth, gender, nationality, high_school_percentage, high_school_passing_year, intermediate_percentage, intermediate_passing_year, undergraduate_university_name, undergraduate_degree, undergraduate_major, undergraduate_percentage, undergraduate_passing_year, Masters, masters_university_name, masters_degree, masters_major, masters_percentage, masters_passing_year,status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            insertStatement.setInt(1, userId);
            insertStatement.setString(2, firstName);
            insertStatement.setString(3, lastName);
            insertStatement.setString(4, phone);
           
            insertStatement.setString(5, dateOfBirth);
            insertStatement.setString(6, gender);
            insertStatement.setString(7, nationality);
            insertStatement.setString(8, highSchoolPercentage);
            insertStatement.setString(9, highSchoolPassingYear);
            insertStatement.setString(10, intermediatePercentage);
            insertStatement.setString(11, intermediatePassingYear);
            insertStatement.setString(12, undergraduateUniversityName);
            insertStatement.setString(13, undergraduateDegree);
            insertStatement.setString(14, undergraduateMajor);
            insertStatement.setString(15, undergraduatePercentage);
            insertStatement.setString(16, undergraduatePassingYear);
            insertStatement.setString(17, masters);
            insertStatement.setString(18, mastersUniversityName);
            insertStatement.setString(19, mastersDegree);
            insertStatement.setString(20, mastersMajor);
            insertStatement.setString(21, mastersPassingYear);
            insertStatement.setString(22, "active");
            insertStatement.executeUpdate();
            response.sendRedirect("Personal_Details.jsp?msg=valid");
        }
    } catch(Exception e) {
    	 e.printStackTrace();
        System.out.println(e);
        response.sendRedirect("Personal_Details.jsp?msg=invalid");
    }
} else {
    // Handle the case where userId is not provided
    response.sendRedirect("Personal_Details.jsp?msg=invalid");
}
%>
--%>


<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String userIdString = request.getParameter("userId");
if(userIdString != null && !userIdString.isEmpty()) {
    int userId = Integer.parseInt(userIdString);
    String firstName=request.getParameter("firstName");
    String lastName=request.getParameter("lastName");
    String phone=request.getParameter("phone");
    String address=request.getParameter("address");
    String dateOfBirth=request.getParameter("dateOfBirth");
    String gender=request.getParameter("gender");
    String nationality=request.getParameter("nationality");
    String highSchoolPercentage=request.getParameter("highSchoolPercentage");
    String highSchoolPassingYear=request.getParameter("highSchoolPassingYear");
    String intermediatePercentage=request.getParameter("intermediatePercentage");
    String intermediatePassingYear=request.getParameter("intermediatePassingYear");
    String undergraduateUniversityName=request.getParameter("undergraduateUniversityName");
    String undergraduateDegree=request.getParameter("undergraduateDegree");
    String undergraduateMajor=request.getParameter("undergraduateMajor");
    String undergraduatePercentage=request.getParameter("undergraduatePercentage");
    String undergraduatePassingYear=request.getParameter("undergraduatePassingYear");
    String masters=request.getParameter("masters");
    String mastersUniversityName=request.getParameter("mastersUniversityName");
    String mastersDegree=request.getParameter("mastersDegree");
    String mastersMajor=request.getParameter("mastersMajor");
    String mastersPercentage=request.getParameter("mastersPercentage");
    String mastersPassingYear=request.getParameter("mastersPassingYear");
    try {
        Connection con=ConnectionProvider.getCon();
        
        // Check if the userId already exists in the table
        PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM student WHERE user_id=?");
        checkStatement.setInt(1, userId);
        ResultSet resultSet = checkStatement.executeQuery();
        if(resultSet.next()) {
            // userId already exists, so update the existing record
            PreparedStatement updateStatement = con.prepareStatement("UPDATE student SET first_name=?, last_name=?, phone=?, address=?, date_of_birth=?, gender=?, nationality=?, high_school_percentage=?, high_school_passing_year=?, intermediate_percentage=?, intermediate_passing_year=?, undergraduate_university_name=?, undergraduate_degree=?, undergraduate_major=?, undergraduate_percentage=?, undergraduate_passing_year=?, Masters=?, masters_university_name=?, masters_degree=?, masters_major=?, masters_percentage=?, masters_passing_year=? WHERE user_id=?");
            updateStatement.setString(1, firstName);
            updateStatement.setString(2, lastName);
            updateStatement.setString(3, phone);
            updateStatement.setString(4, address);
            updateStatement.setString(5, dateOfBirth);
            updateStatement.setString(6, gender);
            updateStatement.setString(7, nationality);
            updateStatement.setString(8, highSchoolPercentage);
            updateStatement.setString(9, highSchoolPassingYear);
            updateStatement.setString(10, intermediatePercentage);
            updateStatement.setString(11, intermediatePassingYear);
            updateStatement.setString(12, undergraduateUniversityName);
            updateStatement.setString(13, undergraduateDegree);
            updateStatement.setString(14, undergraduateMajor);
            updateStatement.setString(15, undergraduatePercentage);
            updateStatement.setString(16, undergraduatePassingYear);
            updateStatement.setString(17, masters);
            updateStatement.setString(18, mastersUniversityName);
            updateStatement.setString(19, mastersDegree);
            updateStatement.setString(20, mastersMajor);
            updateStatement.setString(21, mastersPercentage);
            updateStatement.setString(22, mastersPassingYear);
            updateStatement.setInt(23, userId);
            updateStatement.executeUpdate();
            response.sendRedirect("addChangeAddress.jsp?msg=valid");
        } else {
            // userId doesn't exist, so insert a new record
            PreparedStatement insertStatement = con.prepareStatement("INSERT INTO student (user_id, first_name, last_name, phone, address, date_of_birth, gender, nationality, high_school_percentage, high_school_passing_year, intermediate_percentage, intermediate_passing_year, undergraduate_university_name, undergraduate_degree, undergraduate_major, undergraduate_percentage, undergraduate_passing_year, Masters, masters_university_name, masters_degree, masters_major, masters_percentage, masters_passing_year,status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
            insertStatement.setInt(1, userId);
            insertStatement.setString(2, firstName);
            insertStatement.setString(3, lastName);
            insertStatement.setString(4, phone);
            insertStatement.setString(5, address);
            insertStatement.setString(6, dateOfBirth);
            insertStatement.setString(7, gender);
            insertStatement.setString(8, nationality);
            insertStatement.setString(9, highSchoolPercentage);
            insertStatement.setString(10, highSchoolPassingYear);
            insertStatement.setString(11, intermediatePercentage);
            insertStatement.setString(12, intermediatePassingYear);
            insertStatement.setString(13, undergraduateUniversityName);
            insertStatement.setString(14, undergraduateDegree);
            insertStatement.setString(15, undergraduateMajor);
            insertStatement.setString(16, undergraduatePercentage);
            insertStatement.setString(17, undergraduatePassingYear);
            insertStatement.setString(18, masters);
            insertStatement.setString(19, mastersUniversityName);
            insertStatement.setString(20, mastersDegree);
            insertStatement.setString(21, mastersMajor);
            insertStatement.setString(22, mastersPercentage);
            insertStatement.setString(23, mastersPassingYear);
            insertStatement.setString(24, "active");
            insertStatement.executeUpdate();
            response.sendRedirect("Personal_Details.jsp?msg=valid");
        }
    } catch(Exception e) {
        System.out.println(e);
        response.sendRedirect("Personal_Details.jsp?msg=invalid");
    }
} else {
    // Handle the case where userId is not provided
    response.sendRedirect("Personal_Details.jsp?msg=invalid");
}
%> --%>


<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String userIdString = request.getParameter("userId");
if(userIdString != null && !userIdString.isEmpty()) {
    int userId = Integer.parseInt(userIdString);
    String firstName=request.getParameter("firstName");
    String lastName=request.getParameter("lastName");
    String phone=request.getParameter("phone");

    String dateOfBirth=request.getParameter("dateOfBirth");
    String gender=request.getParameter("gender");
    String nationality=request.getParameter("nationality");
    String highSchoolPercentage=request.getParameter("highSchoolPercentage");
    String highSchoolPassingYear=request.getParameter("highSchoolPassingYear");
    String intermediatePercentage=request.getParameter("intermediatePercentage");
    String intermediatePassingYear=request.getParameter("intermediatePassingYear");
    String undergraduateUniversityName=request.getParameter("undergraduateUniversityName");
    String undergraduateDegree=request.getParameter("undergraduateDegree");
    String undergraduateMajor=request.getParameter("undergraduateMajor");
    String undergraduatePercentage=request.getParameter("undergraduatePercentage");
    String undergraduatePassingYear=request.getParameter("undergraduatePassingYear");
    String masters=request.getParameter("masters");
    String mastersUniversityName=request.getParameter("mastersUniversityName");
    String mastersDegree=request.getParameter("mastersDegree");
    String mastersMajor=request.getParameter("mastersMajor");
    String mastersPassingYear=request.getParameter("mastersPassingYear");
    try {
        Connection con=ConnectionProvider.getCon();
        
        // Check if the userId already exists in the table
        PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM student WHERE user_id=?");
        checkStatement.setInt(1, userId);
        ResultSet resultSet = checkStatement.executeQuery();
        if(resultSet.next()) {
            // userId already exists, so update the existing record
            PreparedStatement updateStatement = con.prepareStatement("UPDATE student SET first_name=?, last_name=?, phone=?, date_of_birth=?, gender=?, nationality=?, high_school_percentage=?, high_school_passing_year=?, intermediate_percentage=?, intermediate_passing_year=?, undergraduate_university_name=?, undergraduate_degree=?, undergraduate_major=?, undergraduate_percentage=?, undergraduate_passing_year=?, Masters=?, masters_university_name=?, masters_degree=?, masters_major=?,masters_passing_year=? WHERE user_id=?");
            updateStatement.setString(1, firstName);
            updateStatement.setString(2, lastName);
            updateStatement.setString(3, phone);
            
            updateStatement.setString(4, dateOfBirth);
            updateStatement.setString(5, gender);
            updateStatement.setString(6, nationality);
            updateStatement.setString(7, highSchoolPercentage);
            updateStatement.setString(8, highSchoolPassingYear);
            updateStatement.setString(9, intermediatePercentage);
            updateStatement.setString(10, intermediatePassingYear);
            updateStatement.setString(11, undergraduateUniversityName);
            updateStatement.setString(12, undergraduateDegree);
            updateStatement.setString(13, undergraduateMajor);
            updateStatement.setString(14, undergraduatePercentage);
            updateStatement.setString(15, undergraduatePassingYear);
            updateStatement.setString(16, masters);
            updateStatement.setString(17, mastersUniversityName);
            updateStatement.setString(18, mastersDegree);
            updateStatement.setString(19, mastersMajor);
            updateStatement.setString(20, mastersPassingYear);
            updateStatement.setInt(21, userId);
            updateStatement.executeUpdate();
            response.sendRedirect("Personal_Details.jsp?msg=valid");
        } else {
            // userId doesn't exist, so insert a new record
            PreparedStatement insertStatement = con.prepareStatement("INSERT INTO student (user_id, first_name, last_name, phone, date_of_birth, gender, nationality, high_school_percentage, high_school_passing_year, intermediate_percentage, intermediate_passing_year, undergraduate_university_name, undergraduate_degree, undergraduate_major, undergraduate_percentage, undergraduate_passing_year, Masters, masters_university_name, masters_degree, masters_major, masters_percentage, masters_passing_year,status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            insertStatement.setInt(1, userId);
            insertStatement.setString(2, firstName);
            insertStatement.setString(3, lastName);
            insertStatement.setString(4, phone);
           
            insertStatement.setString(5, dateOfBirth);
            insertStatement.setString(6, gender);
            insertStatement.setString(7, nationality);
            insertStatement.setString(8, highSchoolPercentage);
            insertStatement.setString(9, highSchoolPassingYear);
            insertStatement.setString(10, intermediatePercentage);
            insertStatement.setString(11, intermediatePassingYear);
            insertStatement.setString(12, undergraduateUniversityName);
            insertStatement.setString(13, undergraduateDegree);
            insertStatement.setString(14, undergraduateMajor);
            insertStatement.setString(15, undergraduatePercentage);
            insertStatement.setString(16, undergraduatePassingYear);
            insertStatement.setString(17, masters);
            insertStatement.setString(18, mastersUniversityName);
            insertStatement.setString(19, mastersDegree);
            insertStatement.setString(20, mastersMajor);
            insertStatement.setString(21, mastersPassingYear);
            insertStatement.setString(22, "active");
            insertStatement.executeUpdate();
            response.sendRedirect("Personal_Details.jsp?msg=valid");
        }
    } catch(Exception e) {
    	 e.printStackTrace();
        System.out.println(e);
        response.sendRedirect("Personal_Details.jsp?msg=invalid");
    }
} else {
    // Handle the case where userId is not provided
    response.sendRedirect("Personal_Details.jsp?msg=invalid");
}
%>
--%>


<%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String userIdString = request.getParameter("userId");
if(userIdString != null && !userIdString.isEmpty()) {
    int userId = Integer.parseInt(userIdString);
    String firstName=request.getParameter("firstName");
    String lastName=request.getParameter("lastName");
    String phone=request.getParameter("phone");
    String dateOfBirth=request.getParameter("dateOfBirth");
    String gender=request.getParameter("gender");
    String nationality=request.getParameter("nationality");
    String highSchoolPercentage=request.getParameter("highSchoolPercentage");
    String highSchoolPassingYear=request.getParameter("highSchoolPassingYear");
    String intermediatePercentage=request.getParameter("intermediatePercentage");
    String intermediatePassingYear=request.getParameter("intermediatePassingYear");
    String undergraduateUniversityName=request.getParameter("undergraduateUniversityName");
    String undergraduateDegree=request.getParameter("undergraduateDegree");
    String undergraduateMajor=request.getParameter("undergraduateMajor");
    String undergraduatePercentage=request.getParameter("undergraduatePercentage");
    String undergraduatePassingYear=request.getParameter("undergraduatePassingYear");
    String masters=request.getParameter("masters");
    String mastersUniversityName=request.getParameter("mastersUniversityName");
    String mastersDegree=request.getParameter("mastersDegree");
    String mastersMajor=request.getParameter("mastersMajor");
    String mastersPassingYear = request.getParameter("mastersPassingYear");

 // Validate mastersPassingYear parameter
 Integer mastersPassingYearInt = null; // default value if empty or null
 if (mastersPassingYear != null && !mastersPassingYear.isEmpty()) {
     try {
         mastersPassingYearInt = Integer.parseInt(mastersPassingYear);
     } catch (NumberFormatException e) {
         // Handle the case where mastersPassingYear is not a valid integer
         // You can log the error or perform other error handling here
         e.printStackTrace(); // This line prints the error to the console
     }
 }

 // Now use mastersPassingYearInt in your SQL queries


    
    String skills=request.getParameter("skills");
    String projects=request.getParameter("projects");
    String workExperience=request.getParameter("workExperience");
    try {
        Connection con=ConnectionProvider.getCon();
        
        // Check if the userId already exists in the table
        PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM student WHERE user_id=?");
        checkStatement.setInt(1, userId);
        ResultSet resultSet = checkStatement.executeQuery();
        if(resultSet.next()) {
            // userId already exists, so update the existing record
            PreparedStatement updateStatement = con.prepareStatement("UPDATE student SET first_name=?, last_name=?, phone=?, date_of_birth=?, gender=?, nationality=?, high_school_percentage=?, high_school_passing_year=?, intermediate_percentage=?, intermediate_passing_year=?, undergraduate_university_name=?, undergraduate_degree=?, undergraduate_major=?, undergraduate_percentage=?, undergraduate_passing_year=?, Masters=?, masters_university_name=?, masters_degree=?, masters_major=?,masters_passing_year=?, skills=?, projects=?,work_experience=? WHERE user_id=?");
            updateStatement.setString(1, firstName);
            updateStatement.setString(2, lastName);
            updateStatement.setString(3, phone);
            updateStatement.setString(4, dateOfBirth);
            updateStatement.setString(5, gender);
            updateStatement.setString(6, nationality);
            updateStatement.setString(7, highSchoolPercentage);
            updateStatement.setString(8, highSchoolPassingYear);
            updateStatement.setString(9, intermediatePercentage);
            updateStatement.setString(10, intermediatePassingYear);
            updateStatement.setString(11, undergraduateUniversityName);
            updateStatement.setString(12, undergraduateDegree);
            updateStatement.setString(13, undergraduateMajor);
            updateStatement.setString(14, undergraduatePercentage);
            updateStatement.setString(15, undergraduatePassingYear);
            updateStatement.setString(16, masters);
            updateStatement.setString(17, mastersUniversityName);
            updateStatement.setString(18, mastersDegree);
            updateStatement.setString(19, mastersMajor);
            updateStatement.setString(20, mastersPassingYear);
            updateStatement.setString(21, skills);
            updateStatement.setString(22, projects);
            updateStatement.setString(23, workExperience);
            updateStatement.setInt(24, userId);
            updateStatement.executeUpdate();
            response.sendRedirect("Personal_Details.jsp?msg=valid");
        } else {
            // userId doesn't exist, so insert a new record
            PreparedStatement insertStatement = con.prepareStatement("INSERT INTO student (user_id, first_name, last_name, phone, date_of_birth, gender, nationality, high_school_percentage, high_school_passing_year, intermediate_percentage, intermediate_passing_year, undergraduate_university_name, undergraduate_degree, undergraduate_major, undergraduate_percentage, undergraduate_passing_year, Masters, masters_university_name, masters_degree, masters_major, masters_passing_year,status,skills,work_experience,projects) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)");
            insertStatement.setInt(1, userId);
            insertStatement.setString(2, firstName);
            insertStatement.setString(3, lastName);
            insertStatement.setString(4, phone);
            insertStatement.setString(5, dateOfBirth);
            insertStatement.setString(6, gender);
            insertStatement.setString(7, nationality);
            insertStatement.setString(8, highSchoolPercentage);
            insertStatement.setString(9, highSchoolPassingYear);
            insertStatement.setString(10, intermediatePercentage);
            insertStatement.setString(11, intermediatePassingYear);
            insertStatement.setString(12, undergraduateUniversityName);
            insertStatement.setString(13, undergraduateDegree);
            insertStatement.setString(14, undergraduateMajor);
            insertStatement.setString(15, undergraduatePercentage);
            insertStatement.setString(16, undergraduatePassingYear);
            insertStatement.setString(17, masters);
            insertStatement.setString(18, mastersUniversityName);
            insertStatement.setString(19, mastersDegree);
            insertStatement.setString(20, mastersMajor);
            insertStatement.setString(21, mastersPassingYear);
            insertStatement.setString(22, "active");
            insertStatement.setString(23, skills);
            insertStatement.setString(24, projects);
            insertStatement.setString(25, workExperience);
            insertStatement.executeUpdate();
            response.sendRedirect("Personal_Details.jsp?msg=valid");
        }
    } catch(Exception e) {
        System.out.println(e);
        response.sendRedirect("Personal_Details.jsp?msg=invalid");
    }
} else {
    // Handle the case where userId is not provided
    response.sendRedirect("Personal_Details.jsp?msg=invalid");
}
%>
 --%>
 

<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String userIdString = request.getParameter("userId");
if(userIdString != null && !userIdString.isEmpty()) {
    int userId = Integer.parseInt(userIdString);
    String firstName=request.getParameter("firstName");
    String lastName=request.getParameter("lastName");
    String phone=request.getParameter("phone");
    String dateOfBirth=request.getParameter("dateOfBirth");
    String gender=request.getParameter("gender");
    String nationality=request.getParameter("nationality");
    String highSchoolPercentage=request.getParameter("highSchoolPercentage");
    String highSchoolPassingYear=request.getParameter("highSchoolPassingYear");
    String intermediatePercentage=request.getParameter("intermediatePercentage");
    String intermediatePassingYear=request.getParameter("intermediatePassingYear");
    String undergraduateUniversityName=request.getParameter("undergraduateUniversityName");
    String undergraduateDegree=request.getParameter("undergraduateDegree");
    String undergraduateMajor=request.getParameter("undergraduateMajor");
    String undergraduatePercentage=request.getParameter("undergraduatePercentage");
    String undergraduatePassingYear=request.getParameter("undergraduatePassingYear");
    String masters=request.getParameter("masters");
    String mastersUniversityName=request.getParameter("mastersUniversityName");
    String mastersDegree=request.getParameter("mastersDegree");
    String mastersMajor=request.getParameter("mastersMajor");
    String mastersPassingYear=request.getParameter("mastersPassingYear");
    String skills=request.getParameter("skills");
    String projects=request.getParameter("projects");
    String workExperience=request.getParameter("workExperience");
    String resume=request.getParameter("resume");
    try {
        Connection con=ConnectionProvider.getCon();
        
        // Check if the userId already exists in the table
        PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM student WHERE user_id=?");
        checkStatement.setInt(1, userId);
        ResultSet resultSet = checkStatement.executeQuery();
        if(resultSet.next()) {
            // userId already exists, so update the existing record
            PreparedStatement updateStatement = con.prepareStatement("UPDATE student SET first_name=?, last_name=?, phone=?, date_of_birth=?, gender=?, nationality=?, high_school_percentage=?, high_school_passing_year=?, intermediate_percentage=?, intermediate_passing_year=?, undergraduate_university_name=?, undergraduate_degree=?, undergraduate_major=?, undergraduate_percentage=?, undergraduate_passing_year=?, Masters=?, masters_university_name=?, masters_degree=?, masters_major=?, masters_passing_year=?, status=?, skills=?, projects=?, work_experience=?,resume=? WHERE user_id=?");
            updateStatement.setString(1, firstName);
            updateStatement.setString(2, lastName);
            updateStatement.setString(3, phone);
            updateStatement.setString(4, dateOfBirth);
            updateStatement.setString(5, gender);
            updateStatement.setString(6, nationality);
            updateStatement.setString(7, highSchoolPercentage);
            updateStatement.setString(8, highSchoolPassingYear);
            updateStatement.setString(9, intermediatePercentage);
            updateStatement.setString(10, intermediatePassingYear);
            updateStatement.setString(11, undergraduateUniversityName);
            updateStatement.setString(12, undergraduateDegree);
            updateStatement.setString(13, undergraduateMajor);
            updateStatement.setString(14, undergraduatePercentage);
            updateStatement.setString(15, undergraduatePassingYear);
            updateStatement.setString(16, masters);
            updateStatement.setString(17, mastersUniversityName);
            updateStatement.setString(18, mastersDegree);
            updateStatement.setString(19, mastersMajor);
            if (mastersPassingYear != null && !mastersPassingYear.isEmpty()) {
                updateStatement.setInt(20, Integer.parseInt(mastersPassingYear));
            } else {
                updateStatement.setNull(20, Types.INTEGER);
            }
            updateStatement.setString(21, "active");
            updateStatement.setString(22, skills);
            updateStatement.setString(23, projects);
            updateStatement.setString(24, workExperience);
            updateStatement.setString(25, resume);
            updateStatement.setInt(26, userId);
            updateStatement.executeUpdate();
            response.sendRedirect("Personal_Details.jsp?msg=valid");
        } else {
            // userId doesn't exist, so insert a new record
            PreparedStatement insertStatement = con.prepareStatement("INSERT INTO student (user_id, first_name, last_name, phone, date_of_birth, gender, nationality, high_school_percentage, high_school_passing_year, intermediate_percentage, intermediate_passing_year, undergraduate_university_name, undergraduate_degree, undergraduate_major, undergraduate_percentage, undergraduate_passing_year, Masters, masters_university_name, masters_degree, masters_major, masters_passing_year, status, skills, work_experience, projects,resume) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
            insertStatement.setInt(1, userId);
            insertStatement.setString(2, firstName);
            insertStatement.setString(3, lastName);
            insertStatement.setString(4, phone);
            insertStatement.setString(5, dateOfBirth);
            insertStatement.setString(6, gender);
            insertStatement.setString(7, nationality);
            insertStatement.setString(8, highSchoolPercentage);
            insertStatement.setString(9, highSchoolPassingYear);
            insertStatement.setString(10, intermediatePercentage);
            insertStatement.setString(11, intermediatePassingYear);
            insertStatement.setString(12, undergraduateUniversityName);
            insertStatement.setString(13, undergraduateDegree);
            insertStatement.setString(14, undergraduateMajor);
            insertStatement.setString(15, undergraduatePercentage);
            insertStatement.setString(16, undergraduatePassingYear);
            insertStatement.setString(17, masters);
            insertStatement.setString(18, mastersUniversityName);
            insertStatement.setString(19, mastersDegree);
            insertStatement.setString(20, mastersMajor);
            if (mastersPassingYear != null && !mastersPassingYear.isEmpty()) {
                insertStatement.setInt(21, Integer.parseInt(mastersPassingYear));
            } else {
                insertStatement.setNull(21, Types.INTEGER);
            }
            insertStatement.setString(22, "active");
            insertStatement.setString(23, skills);
            insertStatement.setString(24, projects);
            insertStatement.setString(25, workExperience);
            insertStatement.setString(26, resume);
            insertStatement.executeUpdate();
            response.sendRedirect("Personal_Details.jsp?msg=valid");
        }
    } catch(Exception e) {
        System.out.println(e);
        response.sendRedirect("Personal_Details.jsp?msg=invalid");
    }
} else {
    // Handle the case where userId is not provided
    response.sendRedirect("Personal_Details.jsp?msg=invalid");
}
%>

  