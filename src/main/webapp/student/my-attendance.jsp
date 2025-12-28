<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Attendance | EduFlow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css?v=1.6">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="student-dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="my-attendance.jsp" class="active"><i class='bx bxs-calendar-check'></i> My Attendance</a></li>
                <li><a href="my-results.jsp"><i class='bx bxs-graduation'></i> My Results</a></li>
                <li><a href="study-resources.jsp"><i class='bx bxs-cloud-download'></i> Resources</a></li>
                <li><a href="student-settings.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Attendance Report</h1>
                    <p>Track your presence across all registered subjects</p>
                </div>
                <div class="header-actions">
                    <div class="status-tag holiday" style="font-size: 1rem; padding: 10px 20px;">
                        Overall: 82.5%
                    </div>
                </div>
            </header>

            <section class="stats-grid">
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>18/20</h3>
                        <p>Data Structures</p>
                    </div>
                    <span class="status-tag active">90%</span>
                </div>
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>14/20</h3>
                        <p>Operating Systems</p>
                    </div>
                    <span class="status-tag exam">70%</span> </div>
            </section>

            <section class="table-container">
                <div class="table-header-flex" style="display: flex; justify-content: space-between; margin-bottom: 20px;">
                    <h2>Recent Attendance History</h2>
                    <div class="search-box" style="max-width: 250px;">
                        <i class='bx bx-filter'></i>
                        <select id="courseFilter" style="border:none; background:transparent; outline:none;">
                            <option value="all">All Subjects</option>
                            <option value="ds">Data Structures</option>
                            <option value="os">Operating Systems</option>
                        </select>
                    </div>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Subject</th>
                            <th>Status</th>
                            <th>Faculty</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>28 Dec 2025</td>
                            <td>Data Structures</td>
                            <td><span class="status-tag active">Present</span></td>
                            <td>Prof. Anderson</td>
                        </tr>
                        <tr>
                            <td>27 Dec 2025</td>
                            <td>Operating Systems</td>
                            <td><span class="status-tag urgent" style="background: #fee2e2; color: #ef4444;">Absent</span></td>
                            <td>Prof. Sarah</td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>
</body>
</html>