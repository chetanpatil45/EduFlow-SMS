<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Dashboard | EduFlow</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style/dashboard-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="teacher-dashboard.jsp" class="active"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="view-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="mark-attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="manage-marks.jsp" ><i class='bx bxs-edit-location'></i> Marks</a></li>
                <li><a href="upload-materials.jsp"><i class='bx bxs-file-pdf'></i> Materials</a></li>
                <li><a href="teacher-settings.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Welcome, Prof. Anderson</h1>
                    <p>Friday, 26 December 2025</p>
                </div>
            </header>

            <section class="stats-grid">
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>03</h3>
                        <p>Classes Today</p>
                    </div>
                    <i class='bx bxs-book-open'></i>
                </div>
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>142</h3>
                        <p>Total Students</p>
                    </div>
                    <i class='bx bxs-group'></i>
                </div>
            </section>

            <section class="table-container">
                <h2>Today's Timetable</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Time</th>
                            <th>Course</th>
                            <th>Room</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>09:00 AM</td>
                            <td>Computer Science (CS-101)</td>
                            <td>Lab 02</td>
                            <td><span class="status-tag holiday">Upcoming</span></td>
                            <td><a href="mark-attendance.html" class="btn-view">Mark Attendance</a></td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>
</body>
</html>