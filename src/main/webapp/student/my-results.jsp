<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Results | EduFlow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css?v=1.6">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="student-dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="my-attendance.jsp"><i class='bx bxs-calendar-check'></i> My Attendance</a></li>
                <li><a href="my-results.jsp" class="active"><i class='bx bxs-graduation'></i> My Results</a></li>
                <li><a href="study-resources.jsp"><i class='bx bxs-cloud-download'></i> Resources</a></li>
                <li><a href="student-settings.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Academic Performance</h1>
                    <p>View your marks and grades for the current semester</p>
                </div>
            </header>

            <section class="table-container">
                <div class="table-header-flex" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h2>Semester Results: Winter 2025</h2>
                    <button class="btn-export" onclick="window.print()">
                        <i class='bx bxs-file-pdf'></i> Print Marksheet
                    </button>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Subject Name</th>
                            <th style="text-align: center;">Internal (20)</th>
                            <th style="text-align: center;">Mid-Term (30)</th>
                            <th style="text-align: center;">Final Exam (50)</th>
                            <th style="text-align: center;">Total (100)</th>
                            <th style="text-align: center;">Grade</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><strong>Data Structures</strong></td>
                            <td style="text-align: center;">18</td>
                            <td style="text-align: center;">26</td>
                            <td style="text-align: center;">42</td>
                            <td style="text-align: center;"><span class="status-tag holiday">86</span></td>
                            <td style="text-align: center;"><strong>A</strong></td>
                        </tr>
                        <tr>
                            <td><strong>Operating Systems</strong></td>
                            <td style="text-align: center;">15</td>
                            <td style="text-align: center;">22</td>
                            <td style="text-align: center;">35</td>
                            <td style="text-align: center;"><span class="status-tag exam">72</span></td>
                            <td style="text-align: center;"><strong>B+</strong></td>
                        </tr>
                    </tbody>
                </table>
            </section>

            <section class="stats-grid" style="margin-top: 30px;">
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>3.65</h3>
                        <p>SGPA (Current)</p>
                    </div>
                    <i class='bx bxs-bar-chart-alt-2'></i>
                </div>
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>00</h3>
                        <p>Pending Backlogs</p>
                    </div>
                    <i class='bx bxs-check-shield'></i>
                </div>
            </section>
        </main>
    </div>
</body>
</html>