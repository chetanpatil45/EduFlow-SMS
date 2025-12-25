<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Management | EduFlow</title>
    
    <link rel="stylesheet" href="../style/dashboard-style.css?v=1.2">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="teacher-dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="teacher-attendance.jsp" class="active"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="manage-marks.jsp"><i class='bx bxs-edit-location'></i> Manage Marks</a></li>
                <li class="logout"><a href="#"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Attendance Management</h1>
                    <p>Mark daily presence or review historical data</p>
                </div>
            </header>

            <section class="search-action-container">
                <div class="form-grid" style="display: grid; grid-template-columns: 1fr 1fr 1fr auto; width: 100%; align-items: flex-end; gap: 15px;">
                    <div class="input-group">
                        <label>Select Course</label>
                        <select id="courseSelect" name="courseID">
                            <option value="CS101">Computer Science (CS-101)</option>
                            <option value="IT202">Information Tech (IT-202)</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label>Date</label>
                        <input type="date" id="attDate" name="attendanceDate" value="2025-12-26">
                    </div>
                    <div class="input-group">
                        <label>Action Type</label>
                        <select id="modeSelect">
                            <option value="mark">Mark New Attendance</option>
                            <option value="view">View History</option>
                        </select>
                    </div>
                    <button type="button" class="btn-add-main" style="width: 80px; height: 45px;">Go</button>
                </div>
            </section>

            <section class="table-container">
                <div class="table-header-flex" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h2>Student List: CS-101</h2>
                    <div class="quick-stats" style="display: flex; gap: 10px;">
                        <span class="status-tag holiday">Total Students: 45</span>
                        <span class="status-tag exam" id="presentCountDisplay">Present: 0</span>
                    </div>
                </div>

                <form action="SaveAttendanceServlet" method="POST">
                    <table>
                        <thead>
                            <tr>
                                <th>Roll No</th>
                                <th>Student Name</th>
                                <th style="text-align: center;">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#STU-101</td>
                                <td>John Doe</td>
                                <td style="display: flex; justify-content: center;">
                                    <div class="attendance-toggle">
                                        <label class="radio-btn present">
                                            <input type="radio" name="att_101" value="P" checked onchange="updateCount()"> 
                                            <span>Present</span>
                                        </label>
                                        <label class="radio-btn absent">
                                            <input type="radio" name="att_101" value="A" onchange="updateCount()"> 
                                            <span>Absent</span>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="form-actions" style="margin-top: 30px; display: flex; justify-content: flex-end;">
                        <button type="submit" class="btn-submit">Save Attendance</button>
                    </div>        
                </form>
            </section>
        </main>
    </div>

    <script>
        // Function to update the Present count dynamically
        function updateCount() {
            const presents = document.querySelectorAll('input[type="radio"][value="P"]:checked').length;
            document.getElementById('presentCountDisplay').innerText = "Present: " + presents;
        }

        // Run once on page load to set initial count
        window.onload = updateCount;
    </script>
</body>
</html>