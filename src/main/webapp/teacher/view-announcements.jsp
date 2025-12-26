<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcements | EduFlow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css?v=1.5">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="teacher-dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="view-announcements.jsp" class="active"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="mark-attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="manage-marks.jsp"><i class='bx bxs-edit-location'></i> Marks</a></li>
                <li><a href="upload-materials.jsp"><i class='bx bxs-file-pdf'></i> Materials</a></li>
                <li><a href="teacher-settings.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Notice Board</h1>
                    <p>Stay updated with the latest news from the administration</p>
                </div>
            </header>

            <section class="announcement-container">
                <div class="notice-card urgent">
                    <div class="notice-badge">Urgent</div>
                    <div class="notice-header">
                        <h3>Semester Final Exam Schedule Released</h3>
                        <span><i class='bx bx-calendar'></i> 26 Dec 2025</span>
                    </div>
                    <p>The final exam schedule for the Winter 2025 semester has been officially published. Please review the dates and ensure all internal marks are submitted by the 30th.</p>
                </div>

                <div class="notice-card general">
                    <div class="notice-badge">General</div>
                    <div class="notice-header">
                        <h3>New Library Hours</h3>
                        <span><i class='bx bx-calendar'></i> 24 Dec 2025</span>
                    </div>
                    <p>Starting next week, the central library will be open until 10:00 PM to assist students with exam preparation.</p>
                </div>
            </section>
        </main>
    </div>
</body>
</html>