<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard | EduFlow</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style/dashboard-style.css?v=1.6">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="student-dashboard.jsp" class="active"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="my-attendance.jsp"><i class='bx bxs-calendar-check'></i> My Attendance</a></li>
                <li><a href="my-results.jsp"><i class='bx bxs-graduation'></i> My Results</a></li>
                <li><a href="study-resources.jsp"><i class='bx bxs-cloud-download'></i> Resources</a></li>
                <li><a href="student-settings.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Welcome, John Doe</h1>
                    <p>Roll No: #STU-101 | Course: B.Tech CS</p>
                </div>
            </header>

            <section class="stats-grid">
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>82%</h3>
                        <p>Total Attendance</p>
                    </div>
                    <i class='bx bxs-user-check'></i>
                </div>
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>B+</h3>
                        <p>Latest Grade</p>
                    </div>
                    <i class='bx bxs-certification'></i>
                </div>
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>05</h3>
                        <p>Unread Resources</p>
                    </div>
                    <i class='bx bxs-file-blank'></i>
                </div>
            </section>

            <div class="dashboard-flex-grid" style="display: grid; grid-template-columns: 2fr 1fr; gap: 20px;">
                <section class="table-container">
                    <h2>Latest Notices</h2>
                    <div class="mini-notice-list" style="margin-top: 15px;">
                        <div class="notice-item" style="padding: 15px; background: #f8fafc; border-radius: 10px; margin-bottom: 10px; border-left: 4px solid #4f46e5;">
                            <strong>Final Exam Schedule Published</strong>
                            <p style="font-size: 0.85rem; color: #64748b; margin-top: 5px;">Check the resources section for the PDF schedule.</p>
                        </div>
                    </div>
                </section>

                <section class="table-container">
                    <h2>Current Semester</h2>
                    <ul class="course-list" style="list-style: none; margin-top: 15px;">
                        <li style="padding: 10px 0; border-bottom: 1px solid #e2e8f0; font-size: 0.9rem;">
                            <i class='bx bx-book-content' style="color: #4f46e5;"></i> Data Structures
                        </li>
                        <li style="padding: 10px 0; border-bottom: 1px solid #e2e8f0; font-size: 0.9rem;">
                            <i class='bx bx-book-content' style="color: #4f46e5;"></i> Operating Systems
                        </li>
                    </ul>
                </section>
            </div>
        </main>
    </div>
</body>
</html>