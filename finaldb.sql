CREATE TABLE user_1 (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    role ENUM('admin', 'student'),
    status ENUM('active', 'inactive') DEFAULT 'active',
    security_question VARCHAR(100),
    answer VARCHAR(100),
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Last_modified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(12),
    date_of_birth DATE,
    gender ENUM('male', 'female', 'other'),
    nationality VARCHAR(50),
    high_school_percentage DECIMAL(5,2),
    high_school_passing_year INT,
    intermediate_percentage DECIMAL(5,2),
    intermediate_passing_year INT,
    undergraduate_university_name VARCHAR(100),
    undergraduate_degree ENUM('Bachelor of Arts', 'Bachelor of Science', 'Bachelor of Engineering', 'Other') NOT NULL,
    undergraduate_major ENUM('Computer Science', 'Electrical Engineering', 'Mechanical Engineering', 'Mathematics', 'Physics', 'Other') NOT NULL,
    undergraduate_percentage DECIMAL(5,2),
    undergraduate_passing_year INT,
    Masters ENUM('pursuing', 'not_pursuing') DEFAULT 'not_pursuing',
    masters_university_name VARCHAR(100),
    masters_degree ENUM('Master of Arts', 'Master of Science', 'Master of Engineering', 'Other'),
    masters_major ENUM('Computer Science', 'Electrical Engineering', 'Mechanical Engineering', 'Mathematics', 'Physics', 'Other'),
    placement_status ENUM('placed', 'unplaced') DEFAULT 'unplaced',
    placement_date_time DATETIME,
    status ENUM('active','inactive') DEFAULT 'inactive',
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Last_modified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    masters_passing_year INT,
    skills TEXT,
    work_experience TEXT,
    projects TEXT,
    resume TEXT,
    FOREIGN KEY (user_id) REFERENCES user_1(user_id)
);

CREATE TABLE Company_master (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(50) COLLATE utf8_general_ci UNIQUE,
    description TEXT,
    location VARCHAR(100),
    status ENUM('active','inactive') DEFAULT 'active',
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Last_modified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    admin_user_id INT,
    FOREIGN KEY (admin_user_id) REFERENCES user_1(user_id)
);

CREATE TABLE Placement_drive (
    drive_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    drive_date DATE,
    job_role VARCHAR(100),
    form_opening DATE,
    form_closing DATE,
    degree_name ENUM('Bachelor of Arts', 'Bachelor of Science', 'Bachelor of Engineering', 'Master of Arts', 'Master of Science', 'Master of Engineering', 'Other') NOT NULL,
    major_name ENUM('Computer Science', 'Electrical Engineering', 'Mechanical Engineering', 'Mathematics', 'Physics', 'Other') NOT NULL,
    minimum_percentage INT DEFAULT 0,
    status ENUM('active','inactive') DEFAULT 'active',
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Last_modified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    admin_user_id INT,
    package_rupees DECIMAL(10,2),
    job_openings INT,
    FOREIGN KEY (company_id) REFERENCES Company_master(company_id),
    FOREIGN KEY (admin_user_id) REFERENCES user_1(user_id)
);

CREATE TABLE application (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    drive_id INT,
    application_date DATE,
    status ENUM('pending', 'accepted', 'rejected') DEFAULT 'pending',
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Last_modified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (drive_id) REFERENCES Placement_drive(drive_id),
    FOREIGN KEY (user_id) REFERENCES student(user_id) ON DELETE CASCADE
);

CREATE TABLE message (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    subject VARCHAR(200),
    body VARCHAR(1000),
    created_date DATE,
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Last_modified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE selection_process (
    process_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    process_name ENUM('Application', 'Resume screening', 'Screening call', 'Assessment test', 'In-person interviewing', 'Background checks', 'Reference checks', 'Decision and job offer') DEFAULT 'Application',
    process_description TEXT,
    status ENUM('active','inactive') DEFAULT 'active',
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Last_modified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    admin_user_id INT,
    FOREIGN KEY (application_id) REFERENCES application(application_id),
    FOREIGN KEY (admin_user_id) REFERENCES user_1(user_id)
);

CREATE TABLE placement_history (
    placement_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    status ENUM('active', 'inactive') DEFAULT 'active',
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Last_modified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES application(application_id)
);
