<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcements | EduFlow</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style/dashboard-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="<%=request.getContextPath() %>/admin/dashboard.jsp" ><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/manage-announcements.jsp" class="active"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/students.jsp"><i class='bx bxs-user-detail'></i> Students</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/teachers.jsp"><i class='bx bxs-user-detail'></i> Teachers</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/courses.jsp"><i class='bx bxs-book-content'></i> Courses</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/setting.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Notice Board Management</h1>
                    <p>Create and manage official announcements for the institution</p>
                </div>
                <button class="btn-add-course" onclick="openModal()">
                    <i class='bx bx-plus'></i> Post New Notice
                </button>
            </header>

            <section class="stats-grid">
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>08</h3>
                        <p>Active Notices</p>
                    </div>
                    <i class='bx bx-check-double'></i>
                </div>
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>03</h3>
                        <p>Scheduled</p>
                    </div>
                    <i class='bx bx-calendar-event'></i>
                </div>
            </section>

            <section class="table-container">
                <h2>Existing Announcements</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Date Posted</th>
                            <th>Title</th>
                            <th>Audience</th>
                            <th>Category</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>22 Dec 2025</td>
                            <td>Winter Vacation Schedule</td>
                            <td>All</td>
                            <td><span class="status-tag holiday">Holiday</span></td>
                            <td>
                                <button class="btn-edit"><i class='bx bx-edit-alt'></i></button>
                                <button class="btn-delete"><i class='bx bx-trash'></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>20 Dec 2025</td>
                            <td>Final Exam Guidelines</td>
                            <td>Students</td>
                            <td><span class="status-tag exam">Exam</span></td>
                            <td>
                                <button class="btn-edit"><i class='bx bx-edit-alt'></i></button>
                                <button class="btn-delete"><i class='bx bx-trash'></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>

    <div id="noticeModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Create Announcement</h2>
                <span class="close-btn" onclick="closeModal()">&times;</span>
            </div>
            <form action="AddNoticeServlet" method="post">
                <div class="input-group">
                    <label>Notice Title</label>
                    <input type="text" name="title" placeholder="e.g. End of Semester Party" required>
                </div>
                <div class="form-grid">
                    <div class="input-group">
                        <label>Target Audience</label>
                        <select name="audience">
                            <option value="all">All Users</option>
                            <option value="teachers">Teachers Only</option>
                            <option value="students">Students Only</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label>Category</label>
                        <select name="category">
                            <option value="General">General</option>
                            <option value="Holiday">Holiday</option>
                            <option value="Exam">Exam</option>
                            <option value="Urgent">Urgent</option>
                        </select>
                    </div>
                </div>
                <div class="input-group">
                    <label>Description</label>
                    <textarea name="description" rows="4" placeholder="Type your message here..."></textarea>
                </div>
                <button type="submit" class="btn-submit">Publish Announcement</button>
            </form>
        </div>
    </div>

    <script>
        var modal = document.getElementById("noticeModal");
        function openModal() { modal.style.display = "block"; }
        function closeModal() { modal.style.display = "none"; }
        window.onclick = function(event) { if (event.target == modal) closeModal(); }
    </script>
</body>
</html>     