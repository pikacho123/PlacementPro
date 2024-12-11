<%-- 
 <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="Navbar.jsp"%>

<%@include file="footer.jsp" %>
<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/Personal_Detail.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Responsive Regisration Form </title> 
</head>
<body>


    <%
    String msg = request.getParameter("msg");
    if ("valid".equals(msg)) {
    %>
        <script>alert("Student Details Successfully Updated!")</script>
    <%
    } else if ("invalid".equals(msg)) {
    %>
        <script>alert("Something Went Wrong! Try Again!")</script>
    <%
    }
    
    try {
        /* String email = (String)session.getAttribute("email"); */ 
        if (email != null && !email.isEmpty()) {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT user_id FROM user_1 WHERE email='" + email + "'");
            
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                session.setAttribute("userId", userId);
                PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE user_id=?");
                ps.setInt(1, userId);
                ResultSet studentRS = ps.executeQuery();
                
                // Set flag to check if student record exists
                boolean studentExists = studentRS.next();
    %>
    
    
    <div class="container">
        <header>Registration</header>

        <!-- <form action="Personal_DetailsAction.jsp" method="post"> -->
        <form action="Personal_DetailsAction.jsp" method="post" enctype="multipart/form-data">
        
            <div class="form first">
                <div class="details personal">
                    <span class="title">Personal Details</span>

                    
                        <div class="fields">
                            <input type="hidden" name="userId" value="<%=userId%>">


                            <div class="input-field">
                                <label>First Name</label>
                                <input type="text" name="firstName" value="<%=studentExists ? studentRS.getString("first_name") : ""%>" placeholder="Enter your first name" required>
                            </div>

    
                            <div class="input-field">
                                <label>Last Name</label>
                                <input type="text" name="lastName" value="<%=studentExists ? studentRS.getString("last_name") : ""%>" placeholder="Enter your last name" required>
                            </div>
    
                            <div class="input-field">
                                <label>Phone</label>
                                <input type="text" id="phone" name="phone" value="<%=studentExists ? studentRS.getString("phone") : ""%>" placeholder="Enter your phone number" required>
                            </div>
    
                            <div class="input-field">
                                <label>Date of Birth</label>
                                <input type="date" id="dateOfBirth"  name="dateOfBirth" value="<%=studentExists ? studentRS.getString("date_of_birth") : ""%>" required onchange="validateForm()">
                            </div>
    
                            <div class="input-field">
                                <label>Gender</label>
                                <select name="gender" required>
                                    <option disabled selected>Select gender</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Others</option>
                                </select>
                            </div>
    
                            <div class="input-field">
                                <label>Nationality</label>
                                <input type="text" name="nationality" value="<%=studentExists ? studentRS.getString("nationality") : ""%>" placeholder="Enter your nationality" required>
                            </div>
                            
    
                           
                    </div>                         

                </div>              

                <div class="details ID">
                    <span class="title">Education Details</span>

                    <div class="fields">

                        <div class="input-field">
                            <label>High School Percentage</label>
                            <input type="text" id="highSchoolPercentage" name="highSchoolPercentage" value="<%=studentExists ? studentRS.getString("high_school_percentage") : ""%>" placeholder="Enter high school percentage" required >
                        </div>

                        <div class="input-field">
                            <label>High School Passing Year</label>
                            <input type="text" id="highSchoolPassingYear" name="highSchoolPassingYear" value="<%=studentExists ? studentRS.getString("high_school_passing_year") : ""%>" placeholder="Enter high school passing year" required>
                        </div>

                        <div class="input-field">
                            <label>Intermediate Percentage</label>
                            <input type="text" id="intermediatePercentage" name="intermediatePercentage" value="<%=studentExists ? studentRS.getString("intermediate_percentage") : ""%>" placeholder="Enter intermediate percentage" required >
                        </div>
                        <div class="input-field">
                            <label>Intermediate Passing Year</label>
                            <input type="text" id="intermediatePassingYear" name="intermediatePassingYear" value="<%=studentExists ? studentRS.getString("intermediate_passing_year") : ""%>" placeholder="Enter intermediate passing year" required>
                        </div>

                        <div class="input-field">
                            <label>Undergraduate University Name</label>
                            <input type="text" name="undergraduateUniversityName" value="<%=studentExists ? studentRS.getString("undergraduate_university_name") : ""%>" placeholder="Enter undergraduate university name" required>
                        </div>

                        <div class="input-field">
                            <label for="undergraduateDegree">Undergraduate Degree</label>
                            <select id="undergraduateDegree" name="undergraduateDegree" required>
                                <option value="" disabled selected>Select your undergraduate degree</option>
                                <option value="Bachelor of Arts">Bachelor of Arts</option>
                                <option value="Bachelor of Science">Bachelor of Science</option>
                                <option value="Bachelor of Engineering">Bachelor of Engineering</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>

                         
                        </div> 
                    <button class="nextBtn">
                        <span class="btnText">Next</span>
                        <i class="uil uil-navigator"></i>
                    </button>
                </div>  <!-- <div class="details ID"> -->
            </div>          <!-- <div class="form first"> -->




                
            <div class="form second">
                <div class="details address">
                    <!-- <span class="title">Address Details</span> -->

                    <div class="fields">
                        

                        <div class="input-field">
                            <label for="undergraduateMajor">Undergraduate Major</label>
                            <select id="undergraduateMajor" name="undergraduateMajor" required>
                                <option value="" disabled selected>Select your undergraduate major</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Electrical Engineering">Electrical Engineering</option>
                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                                <option value="Mathematics">Mathematics</option>
                                <option value="Physics">Physics</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        

                        <div class="input-field">
                            <label>Undergraduate Percentage</label>
                            <input type="text" id="undergraduatePercentage" name="undergraduatePercentage" value="<%=studentExists ? studentRS.getString("undergraduate_percentage") : ""%>" placeholder="Enter undergraduate percentage" required >
                        </div>

                        <div class="input-field">
                            <label>Undergraduate Passing Year</label>
                            <input type="text" id="undergraduatePassingYear" name="undergraduatePassingYear" value="<%=studentExists ? studentRS.getString("undergraduate_passing_year") : ""%>" placeholder="Enter undergraduate passing year" required>
                        </div>

                    </div>
                </div>

                <div class="details family">
                    <!-- <span class="title">Family Details</span> -->

                    <div class="fields">
                        <div class="input-field">
                            <label for="masters">Masters</label>
                            <select id="masters" name="masters" required onchange="toggleMasterFields(this)">
                                <option value="" disabled selected>Select your master's status</option>
                                <option value="pursuing">Pursuing</option>
                                <option value="not_pursuing">Not Pursuing</option>
                            </select>
                        </div>
                        

                        <div id="mastersUniversityNameField" class="input-field">
                            <label>Masters University Name</label>
                            <input type="text" name="mastersUniversityName" value="<%=studentExists ? studentRS.getString("masters_university_name") : ""%>" placeholder="Enter masters university name" required>
                        </div>

                        <div id="mastersDegreeField" class="input-field">
                            <label for="mastersDegree">Masters Degree</label>
                            <select id="mastersDegree" name="mastersDegree" required>
                                <option value="" disabled selected>Select your master's degree</option>
                                <option value="Master of Arts">Master of Arts</option>
                                <option value="Master of Science">Master of Science</option>
                                <option value="Master of Engineering">Master of Engineering</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        

                        <div  id="mastersMajorField" class="input-field">
                            <label for="mastersMajor">Masters Major</label>
                            <select id="mastersMajor" name="mastersMajor" required>
                                <option value="" disabled selected>Select your master's major</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Electrical Engineering">Electrical Engineering</option>
                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                                <option value="Mathematics">Mathematics</option>
                                <option value="Physics">Physics</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>                


                        <div id="mastersPassingYearField" class="input-field">
                            <label>Masters Passing Year</label>
                            <input type="text"  id="mastersPassingYear" name="mastersPassingYear" value="<%=studentExists ? studentRS.getString("masters_passing_year") : ""%>" placeholder="Enter masters passing year" required>
                        </div>
                       
                    </div>

                    <div class="buttons">
                        <div class="backBtn">
                            <i class="uil uil-navigator"></i>
                            <span class="btnText">Back</span>
                        </div>
                        
                        <button class="sumbit">
                            <span class="btnText">Submit</span>
                            <i class="uil uil-navigator"></i>
                        </button>
                        <!-- <button type="reset" onclick="location.href='home.jsp'" class="sumbit">
                            <span class="btnText">Home</span>
                            <i class="uil uil-home"></i>
                        </button> -->
                    </div>
                </div> 
            </div>
        </form>
    </div>

    <script src="script.js"></script>
    <%
        } else {
            out.println("User not found.");
        }
    } else {
        out.println("User email not provided.");
    }
} catch(Exception e) {
    System.out.println(e);
}
%>





<script>
    // Function to validate date of birth
    function validateForm() {
        // Validate date of birth
        var dobInput = document.getElementById("dateOfBirth");
        var selectedDate = new Date(dobInput.value);
        var cutoffDate = new Date("2006-01-01"); // January 1, 2006
        
        if (selectedDate >= cutoffDate) {
            alert("Age should be greate than 18");
            dobInput.value = ""; // Clear the input field
            return false; // Prevent form submission
        }

        // Validate percentages
        var percentageFields = ["highSchoolPercentage", "intermediatePercentage", "undergraduatePercentage", "mastersPercentage"];
        for (var i = 0; i < percentageFields.length; i++) {
            var field = document.getElementById(percentageFields[i]);
            var percentage = parseFloat(field.value);
            if (isNaN(percentage) || percentage < 40 || percentage > 100) {
                alert("Percentage must be a number between 40 and 100.");
                field.value = ""; // Clear the input field
                field.focus(); // Set focus on the invalid field
                return false; // Prevent form submission
            }
        }

        // Validate phone number
        var phoneInput = document.getElementById("phone");
        var phoneNumber = phoneInput.value;
        if (phoneNumber.length !== 10 || isNaN(phoneNumber)) {
            alert("Phone number must be a 10-digit number.");
            phoneInput.value = ""; // Clear the input field
            phoneInput.focus(); // Set focus on the invalid field
            return false; // Prevent form submission
        }

        // Validate passing years
        var highSchoolYear = parseInt(document.getElementById("highSchoolPassingYear").value);
        var intermediateYear = parseInt(document.getElementById("intermediatePassingYear").value);
        var undergraduateYear = parseInt(document.getElementById("undergraduatePassingYear").value);
        var mastersYear = parseInt(document.getElementById("mastersPassingYear").value);

        if (highSchoolYear >= intermediateYear || intermediateYear >= undergraduateYear || undergraduateYear >= mastersYear) {
            alert("Passing years must be in increasing order.");
            return false; // Prevent form submission
        }

        // Validate passing years format (4 digits)
        var passingYearFields = ["highSchoolPassingYear", "intermediatePassingYear", "undergraduatePassingYear", "mastersPassingYear"];
        for (var i = 0; i < passingYearFields.length; i++) {
            var field = document.getElementById(passingYearFields[i]);
            var year = parseInt(field.value);
            if (isNaN(year) || field.value.length !== 4) {
                alert("Passing year must be a 4-digit number.");
                field.value = ""; // Clear the input field
                field.focus(); // Set focus on the invalid field
                return false; // Prevent form submission
            }
        }

        return true; // Allow form submission
    }

    // Add an event listener to the form for submission
    document.querySelector("form").addEventListener("submit", function(event) {
        // Validate form before submitting
        if (!validateForm()) {
            event.preventDefault(); // Prevent form submission if validation fails
        }
    });
</script>

<script>
    function toggleMasterFields(selectElement) {
        var selectedValue = selectElement.value;
        var mastersFieldsContainer = document.getElementById('mastersFieldsContainer');

        // Get references to individual fields
        var universityNameField = document.getElementById('mastersUniversityNameField');
        var degreeField = document.getElementById('mastersDegreeField');
        var majorField = document.getElementById('mastersMajorField');
        var passingYearField = document.getElementById('mastersPassingYearField');

        if (selectedValue === 'not_pursuing') {
            // Hide individual fields
            universityNameField.style.display = 'none';
            degreeField.style.display = 'none';
            majorField.style.display = 'none';
            passingYearField.style.display = 'none';
        } else {
            // Show individual fields
            universityNameField.style.display = 'block';
            degreeField.style.display = 'block';
            majorField.style.display = 'block';
            passingYearField.style.display = 'block';
        }
    }
</script>



<script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }
</script>
</body>
</html>
    --%>
    
    
    <%-- <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Student Details</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
if ("valid".equals(msg)) {
%>
    <h3 class="alert">Student Details Successfully Updated!</h3>
<%
} else if ("invalid".equals(msg)) {
%>
    <h3 class="alert">Something Went Wrong! Try Again!</h3>
<%
}

try {
    /* String email = (String)session.getAttribute("email"); */
    if (email != null && !email.isEmpty()) {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT user_id FROM user_1 WHERE email='" + email + "'");
        
        if (rs.next()) {
            int userId = rs.getInt("user_id");
            session.setAttribute("userId", userId);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE user_id=?");
            ps.setInt(1, userId);
            ResultSet studentRS = ps.executeQuery();
            
            // Set flag to check if student record exists
            boolean studentExists = studentRS.next();
%>
            <form action="Personal_DetailsAction.jsp" method="post">
                <h3> <a class="flipbutton" href="#">Personal Details > <a class="flipbutton" href="#"></a><a class="flipbutton" href="10th.html">  Educational Details</a></h3>
                <input type="hidden" name="userId" value="<%=userId%>">
                
                <h3>First Name</h3>
                <input class="input-style" type="text" name="firstName" value="<%=studentExists ? studentRS.getString("first_name") : "Enter your first name"%>" required>
                <hr>
                
                
                <h3>Last Name</h3>
                <input class="input-style" type="text" name="lastName" value="<%=studentExists ? studentRS.getString("last_name") : ""%>" required>
                <hr>
                
                <h3>Phone</h3>
                <input class="input-style" type="text" name="phone" value="<%=studentExists ? studentRS.getString("phone") : ""%>" required>
                <hr>
                
                <h3>Address</h3>
                <input class="input-style" type="text" name="address" value="<%=studentExists ? studentRS.getString("address") : ""%>" required>
                <hr>
                
                <h3>Date of Birth</h3>
                <input class="input-style" type="date" name="dateOfBirth" value="<%=studentExists ? studentRS.getString("date_of_birth") : ""%>" required>
                <hr>
                
                <h3>Gender</h3>
                <select class="input-style" name="gender" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
                <hr>
                
                <h3>Nationality</h3>
                <input class="input-style" type="text" name="nationality" value="<%=studentExists ? studentRS.getString("nationality") : ""%>" required>
                <hr>
                
                <button class="button" type="submit"><%= studentExists ? "Update Student Details" : "Add Student" %> <i class='far fa-arrow-alt-circle-right'></i></button>
            </form>
<%
        } else {
            out.println("User not found.");
        }
    } else {
        out.println("User email not provided.");
    }
} catch(Exception e) {
    System.out.println(e);
}
%>
</body>
<br><br><br>
<br>
</html>
  --%>
  
  <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="Navbar.jsp"%>
<%-- <%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %> --%>
<%@include file="footer.jsp" %>
<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/Personal_Detail.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Responsive Regisration Form </title> 
</head>
<body>


    <%
    String msg = request.getParameter("msg");
    if ("valid".equals(msg)) {
    %>
       <script>alert("Student Details Successfully Updated!")</script>
    <%
    } else if ("invalid".equals(msg)) {
    %>
       <script>alert("Something Went Wrong! Try Again!")</script>
    <%
    }
    
    try {
        /* String email = (String)session.getAttribute("email"); */ 
        if (email != null && !email.isEmpty()) {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT user_id FROM user_1 WHERE email='" + email + "'");
            
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                session.setAttribute("userId", userId);
                PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE user_id=?");
                ps.setInt(1, userId);
                ResultSet studentRS = ps.executeQuery();
                
                // Set flag to check if student record exists
                boolean studentExists = studentRS.next();
    %>
    
    
    <div class="container">
        <header>Registration</header>

        <form action="Personal_DetailsAction.jsp" method="post">
            <div class="form first">
                <div class="details personal">
                    <span class="title">Personal Details</span>

                    
                        <div class="fields">
                            <input type="hidden" name="userId" value="<%=userId%>">


                            <div class="input-field">
                                <label>First Name</label>
                                <input type="text" name="firstName" value="<%=studentExists ? studentRS.getString("first_name") : ""%>" placeholder="Enter your first name" required>
                            </div>

    
                            <div class="input-field">
                                <label>Last Name</label>
                                <input type="text" name="lastName" value="<%=studentExists ? studentRS.getString("last_name") : ""%>" placeholder="Enter your last name" required>
                            </div>
    
                            <div class="input-field">
                                <label>Phone</label>
                                <input type="text" name="phone" value="<%=studentExists ? studentRS.getString("phone") : ""%>" placeholder="Enter your phone number" required>
                            </div>
    
                            <%-- <div class="input-field">
                                <label>Address</label>
                                <input type="text" name="address" value="<%=studentExists ? studentRS.getString("address") : ""%>" placeholder="Enter your address" required>
                            </div> --%>
    
                            <div class="input-field">
                                <label>Date of Birth</label>
                                <input type="date" id="dateOfBirth" name="dateOfBirth" value="<%=studentExists ? studentRS.getString("date_of_birth") : ""%>" required onchange="validateForm()">
                            </div>
    
                            <div class="input-field">
                                <label>Gender</label>
                                <select name="gender" required>
                                    <option disabled selected>Select gender</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Others</option>
                                </select>
                            </div>
    
                            <div class="input-field">
                                <label>Nationality</label>
                                <input type="text" name="nationality" value="<%=studentExists ? studentRS.getString("nationality") : ""%>" placeholder="Enter your nationality" required>
                            </div>
    
                           
                    </div>                         

                </div>              

                <div class="details ID">
                    <span class="title">Education Details</span>

                    <div class="fields">

                        <div class="input-field">
                            <label>High School Percentage</label>
                            <input type="text" name="highSchoolPercentage" value="<%=studentExists ? studentRS.getString("high_school_percentage") : ""%>" placeholder="Enter high school percentage" required>
                        </div>

                        <div class="input-field">
                            <label>High School Passing Year</label>
                            <input type="text" name="highSchoolPassingYear" value="<%=studentExists ? studentRS.getString("high_school_passing_year") : ""%>" placeholder="Enter high school passing year" required>
                        </div>

                        <div class="input-field">
                            <label>Intermediate Percentage</label>
                            <input type="text" name="intermediatePercentage" value="<%=studentExists ? studentRS.getString("intermediate_percentage") : ""%>" placeholder="Enter intermediate percentage" required>
                        </div>
                        <div class="input-field">
                            <label>Intermediate Passing Year</label>
                            <input type="text" name="intermediatePassingYear" value="<%=studentExists ? studentRS.getString("intermediate_passing_year") : ""%>" placeholder="Enter intermediate passing year" required>
                        </div>

                        <div class="input-field">
                            <label>Undergraduate University Name</label>
                            <input type="text" name="undergraduateUniversityName" value="<%=studentExists ? studentRS.getString("undergraduate_university_name") : ""%>" placeholder="Enter undergraduate university name" required>
                        </div>

                        <div class="input-field">
                            <label for="undergraduateDegree">Undergraduate Degree</label>
                            <select id="undergraduateDegree" name="undergraduateDegree" required>
                                <option value="" disabled selected>Select your undergraduate degree</option>
                                <option value="Bachelor of Arts">Bachelor of Arts</option>
                                <option value="Bachelor of Science">Bachelor of Science</option>
                                <option value="Bachelor of Engineering">Bachelor of Engineering</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>

                         
                        </div> 
                    <button class="nextBtn">
                        <span class="btnText">Next</span>
                        <i class="uil uil-navigator"></i>
                    </button>
                </div>  <!-- <div class="details ID"> -->
            </div>          <!-- <div class="form first"> -->




                
            <div class="form second">
                <div class="details address">
                    <!-- <span class="title">Address Details</span> -->

                    <div class="fields">
                        

                        <div class="input-field">
                            <label for="undergraduateMajor">Undergraduate Major</label>
                            <select id="undergraduateMajor" name="undergraduateMajor" required>
                                <option value="" disabled selected>Select your undergraduate major</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Electrical Engineering">Electrical Engineering</option>
                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                                <option value="Mathematics">Mathematics</option>
                                <option value="Physics">Physics</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        

                        <div class="input-field">
                            <label>Undergraduate Percentage</label>
                            <input type="text" name="undergraduatePercentage" value="<%=studentExists ? studentRS.getString("undergraduate_percentage") : ""%>" placeholder="Enter undergraduate percentage" required>
                        </div>

                        <div class="input-field">
                            <label>Undergraduate Passing Year</label>
                            <input type="text" name="undergraduatePassingYear" value="<%=studentExists ? studentRS.getString("undergraduate_passing_year") : ""%>" placeholder="Enter undergraduate passing year" required>
                        </div>
                        <div class="input-field">
                            <label for="masters">Masters</label>
                            <select id="masters" name="masters" required onchange="toggleMasterFields(this)">
                                <option value="" disabled selected>Select your master's status</option>
                                <option value="pursuing">Pursuing</option>
                                <option value="not_pursuing">Not Pursuing</option>
                            </select>
                        </div>
                        

                        <div id="mastersUniversityNameField" class="input-field">
                            <label>Masters University Name</label>
                            <input type="text" name="mastersUniversityName" value="<%=studentExists ? studentRS.getString("masters_university_name") : ""%>" placeholder="Enter masters university name" >
                        </div>

                        <div id="mastersDegreeField" class="input-field">
                            <label for="mastersDegree">Masters Degree</label>
                            <select id="mastersDegree" name="mastersDegree" >
                                <option value="" disabled selected>Select your master's degree</option>
                                <option value="Master of Arts">Master of Arts</option>
                                <option value="Master of Science">Master of Science</option>
                                <option value="Master of Engineering">Master of Engineering</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        

                        <div id="mastersMajorField" class="input-field">
                            <label for="mastersMajor">Masters Major</label>
                            <select id="mastersMajor" name="mastersMajor" >
                                <option value="" disabled selected>Select your master's major</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Electrical Engineering">Electrical Engineering</option>
                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                                <option value="Mathematics">Mathematics</option>
                                <option value="Physics">Physics</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        
                        <%-- <div class="input-field">
                            <label>Masters Percentage</label>
                            <input type="text" name="mastersPercentage" value="<%=studentExists ? studentRS.getString("masters_percentage") : ""%>" placeholder="Enter masters percentage" required>
                        </div> --%>

                        <div id="mastersPassingYearField" class="input-field">
                            <label>Masters Passing Year</label>
                            <input type="text" name="mastersPassingYear" value="<%=studentExists ? studentRS.getString("masters_passing_year") : ""%>" placeholder="Enter masters passing year" >
                        </div>
                        <div class="input-field">
                            <label>Resume Link</label>
                            <input type="text" name="resume" value="<%=studentExists ? studentRS.getString("resume") : ""%>" placeholder="Enter resume link	" required>
                        </div>

                    </div>
                </div>

                <div class="details family">
                    <span class="title">Skill Sets</span> 

                    <div class="fields">
                    <div class="input-field">
                    
            <label>Skills</label>
            <textarea name="skills" value="<%=studentExists ? studentRS.getString("skills") : ""%>" placeholder="Enter your skills"></textarea>
        </div>

        <div class="input-field">
            <label>Projects</label>
            <textarea name="projects" value="<%=studentExists ? studentRS.getString("projects") : ""%>" placeholder="Enter your projects"></textarea>
        </div>

        <div class="input-field">
            <label>Work Experience</label>
            <textarea name="workExperience" value="<%=studentExists ? studentRS.getString("work_experience") : ""%>" placeholder="Enter your work experience"></textarea>
        </div>
                        
                    </div>

                    <div class="buttons">
                        <div class="backBtn">
                            <i class="uil uil-navigator"></i>
                            <span class="btnText">Back</span>
                        </div>
                        
                        <button class="sumbit">
                            <span class="btnText">Submit</span>
                            <i class="uil uil-navigator"></i>
                        </button>
                        <!-- <button type="reset" onclick="location.href='home.jsp'" class="sumbit">
                            <span class="btnText">Home</span>
                            <i class="uil uil-home"></i>
                        </button> -->
                    </div>
                </div> 
            </div>
        </form>
    </div>

    <script src="script.js"></script>
    <%
        } else {
            out.println("User not found.");
        }
    } else {
        out.println("User email not provided.");
    }
} catch(Exception e) {
    System.out.println(e);
}
%>


<!-- <script>
    function toggleMasterFields(selectElement) {
        var selectedValue = selectElement.value;
        var mastersFieldsContainer = document.getElementById('mastersFieldsContainer');

        // Get references to individual fields
        var universityNameField = document.getElementById('mastersUniversityNameField');
        var degreeField = document.getElementById('mastersDegreeField');
        var majorField = document.getElementById('mastersMajorField');
        var passingYearField = document.getElementById('mastersPassingYearField');

        if (selectedValue === 'not_pursuing') {
            // Hide individual fields
            universityNameField.style.display = 'none';
            degreeField.style.display = 'none';
            majorField.style.display = 'none';
            passingYearField.style.display = 'none';
        } else {
            // Show individual fields
            universityNameField.style.display = 'block';
            degreeField.style.display = 'block';
            majorField.style.display = 'block';
            passingYearField.style.display = 'block';
        }
    }
</script> -->


<script>
    function toggleMasterFields(selectElement) {
        var selectedValue = selectElement.value;
        
        // Get references to individual fields
        var universityNameField = document.getElementById('mastersUniversityNameField');
        var degreeField = document.getElementById('mastersDegreeField');
        var majorField = document.getElementById('mastersMajorField');
        var passingYearField = document.getElementById('mastersPassingYearField');

        if (selectedValue === 'not_pursuing') {
            // Clear values and hide fields
            universityNameField.value = "";
            degreeField.value = "";
            majorField.value = "";
            passingYearField.value = "";
            universityNameField.style.display = 'none';
            degreeField.style.display = 'none';
            majorField.style.display = 'none';
            passingYearField.style.display = 'none';
        } else {
            // Show fields
            universityNameField.style.display = 'block';
            degreeField.style.display = 'block';
            majorField.style.display = 'block';
            passingYearField.style.display = 'block';
        }
    }
</script>


<script>
    // Function to validate date of birth
    function validateForm() {
        // Validate date of birth
        var dobInput = document.getElementById("dateOfBirth");
        var selectedDate = new Date(dobInput.value);
        var cutoffDate = new Date("2006-01-01"); // January 1, 2006
        
        if (selectedDate >= cutoffDate) {
            alert("Age should be greate than 18");
            dobInput.value = ""; // Clear the input field
            return false; // Prevent form submission
        }

        // Validate percentages
        var percentageFields = ["highSchoolPercentage", "intermediatePercentage", "undergraduatePercentage", "mastersPercentage"];
        for (var i = 0; i < percentageFields.length; i++) {
            var field = document.getElementById(percentageFields[i]);
            var percentage = parseFloat(field.value);
            if (isNaN(percentage) || percentage < 40 || percentage > 100) {
                alert("Percentage must be a number between 40 and 100.");
                field.value = ""; // Clear the input field
                field.focus(); // Set focus on the invalid field
                return false; // Prevent form submission
            }
        }

        // Validate phone number
        var phoneInput = document.getElementById("phone");
        var phoneNumber = phoneInput.value;
        if (phoneNumber.length !== 10 || isNaN(phoneNumber)) {
            alert("Phone number must be a 10-digit number.");
            phoneInput.value = ""; // Clear the input field
            phoneInput.focus(); // Set focus on the invalid field
            return false; // Prevent form submission
        }

        // Validate passing years
        var highSchoolYear = parseInt(document.getElementById("highSchoolPassingYear").value);
        var intermediateYear = parseInt(document.getElementById("intermediatePassingYear").value);
        var undergraduateYear = parseInt(document.getElementById("undergraduatePassingYear").value);
        var mastersYear = parseInt(document.getElementById("mastersPassingYear").value);

        if (highSchoolYear >= intermediateYear || intermediateYear >= undergraduateYear || undergraduateYear >= mastersYear) {
            alert("Passing years must be in increasing order.");
            return false; // Prevent form submission
        }

        // Validate passing years format (4 digits)
        var passingYearFields = ["highSchoolPassingYear", "intermediatePassingYear", "undergraduatePassingYear", "mastersPassingYear"];
        for (var i = 0; i < passingYearFields.length; i++) {
            var field = document.getElementById(passingYearFields[i]);
            var year = parseInt(field.value);
            if (isNaN(year) || field.value.length !== 4) {
                alert("Passing year must be a 4-digit number.");
                field.value = ""; // Clear the input field
                field.focus(); // Set focus on the invalid field
                return false; // Prevent form submission
            }
        }

        return true; // Allow form submission
    }

    // Add an event listener to the form for submission
    document.querySelector("form").addEventListener("submit", function(event) {
        // Validate form before submitting
        if (!validateForm()) {
            event.preventDefault(); // Prevent form submission if validation fails
        }
    });
</script>



<script>
    // Check if the page was loaded by refreshing
    if (performance.navigation.type === 1) {
        // Remove the message parameter from the URL
        history.replaceState({}, document.title, location.pathname);
    }
</script>
</body>
</html>
  
  
    
    