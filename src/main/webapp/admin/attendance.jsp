<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance | EduFLow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo">
                <h2>EduFlow Admin</h2>
            </div>
            <ul class="nav-links">
                <li><a href="dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="manage-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="students.jsp"><i class='bx bxs-user-detail'></i> Students</a></li>
                <li><a href="teachers.jsp"><i class='bx bxs-user-detail'></i> Teachers</a></li>
                <li><a href="courses.jsp"><i class='bx bxs-book-content'></i> Courses</a></li>
                <li><a href="attendance.jsp" class="active"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="setting.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="#"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Attendance Analytics</h1>
                    <p>Monitoring attendance trends across all departments</p>
                </div>
            </header>

            <section class="stats-grid">
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>88%</h3>
                        <p>Average Attendance</p>
                    </div>
                    <i class='bx bxs-pie-chart-alt-2'></i>
                </div>
                <div class="stat-card warning">
                    <div class="stat-info">
                        <h3>12</h3>
                        <p>Low Attendance Alerts</p>
                    </div>
                    <i class='bx bxs-error-circle'></i>
                </div>
            </section>

            <section class="table-container">
                <h2>Department Performance</h2>
                <div class="attendance-bars">
                    <div class="bar-item">
                        <div class="bar-info">
                            <span>Computer Science</span>
                            <span>92%</span>
                        </div>
                        <div class="progress-line"><span style="width: 92%;"></span></div>
                    </div>
                    <div class="bar-item">
                        <div class="bar-info">
                            <span>Information Tech</span>
                            <span>78%</span>
                        </div>
                        <div class="progress-line"><span style="width: 78%; background: #f59e0b;"></span></div>
                    </div>
                    <div class="bar-item">
                        <div class="bar-info">
                            <span>Mechanical Engineering</span>
                            <span>65%</span>
                        </div>
                        <div class="progress-line"><span style="width: 65%; background: #ef4444;"></span></div>
                    </div>
                </div>
            </section>

            <section class="table-container" style="margin-top: 25px;">
                <h2>Students Below 75% Threshold</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Course</th>
                            <th>Attendance %</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Alice Johnson</td>
                            <td>Mechanical</td>
                            <td class="text-danger">64%</td>
                            <td><button class="btn-edit">Send Warning</button></td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>
</body>

</html>