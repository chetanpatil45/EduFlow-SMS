<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Marks | EduFlow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css?v=1.2">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="teacher-dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="teacher-attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="manage-marks.jsp" class="active"><i class='bx bxs-edit-location'></i> Manage Marks</a></li>
                <li class="logout"><a href="${pageContext.request.contextPath}/index.jsp"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Student Grading</h1>
                    <p>Enter and update marks for assigned courses</p>
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
                        <label>Exam Type</label>
                        <select id="examType" name="examType">
                            <option value="internal">Internal Assessment</option>
                            <option value="midterm">Mid-Term Exam</option>
                            <option value="final">Final Theory</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label>Max Marks</label>
                        <input type="number" id="maxMarks" value="100" readonly>
                    </div>
                    <button type="button" class="btn-add-main" style="width: 80px; height: 45px;">Go</button>
                </div>
            </section>

            <section class="table-container">
                <div class="table-header-flex" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h2>Grade Entry: CS-101 (Mid-Term)</h2>
                    <div class="quick-stats">
                        <span class="status-tag exam">Awaiting Submission</span>
                    </div>
                </div>

                <form action="SaveMarksServlet" method="POST">
                    <table>
                        <thead>
                            <tr>
                                <th>Roll No</th>
                                <th>Student Name</th>
                                <th style="width: 150px;">Obtained Marks</th>
                                <th>Remarks</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#STU-101</td>
                                <td>John Doe</td>
                                <td>
                                    <input type="number" name="marks_101" class="marks-input" min="0" max="100" placeholder="00">
                                </td>
                                <td>
                                    <input type="text" name="remarks_101" class="remarks-input" placeholder="Good progress">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="form-actions" style="margin-top: 30px; display: flex; justify-content: flex-end;">
                        <button type="submit" class="btn-submit">Publish Results</button>
                    </div>        
                </form>
            </section>
        </main>
    </div>
</body>
</html>