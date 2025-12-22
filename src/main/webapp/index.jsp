<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome | EduFlow</title>
    <link rel="stylesheet" href="./style/landing-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <header class="hero">
        <nav class="navbar">
            <div class="logo">Edu<span>Flow</span></div>
            <div class="nav-links">
                <a href="about.jsp">About</a>
                <a href="#portals" class="btn-nav">Get Started</a>
            </div>
        </nav>

        <div class="hero-content" id="about">
            <h1>Empowering Education Through <span>Better Management</span></h1>
            <p>A comprehensive platform for administrators to manage records, teachers to track attendance, and students to monitor their academic journey.</p>
            <a href="#portals" class="btn-hero">Explore Portals</a>
        </div>
    </header>

    <section class="portals" id="portals">
        <div class="section-header">
            <h2>Select Your Portal</h2>
            <p>Please choose your role to log in to the system</p>
        </div>

        <div class="portal-grid">
            <div class="portal-card">
                <div class="icon-box admin-icon"><i class='bx bxs-user-badge'></i></div>
                <h3>Administrator</h3>
                <p>Manage users, departments, and system-wide configurations.</p>
                <div class="action-links">
                    <a href="./admin/login.jsp" class="btn-portal">Login</a>
                    <a href="./admin/signup.jsp" class="link-secondary">Register Admin</a>
                </div>
            </div>

            <div class="portal-card">
                <div class="icon-box teacher-icon"><i class='bx bxs-group'></i></div>
                <h3>Teacher</h3>
                <p>Mark attendance, manage courses, and track student performance.</p>
                <a href="./teacher/teacher-login.jsp" class="btn-portal">Teacher Login</a>
            </div>

            <div class="portal-card">
                <div class="icon-box student-icon"><i class='bx bxs-graduation'></i></div>
                <h3>Student</h3>
                <p>View your profile, track attendance, and check academic results.</p>
                <a href="./student/student-login.jsp" class="btn-portal">Student Login</a>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 Student Management System. Built for excellence.</p>
    </footer>

</body>
</html>