<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings | EduFlow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css">
    <link rel="stylesheet" href="../style/form-style.css"> <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="manage-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="students.jsp"><i class='bx bxs-user-detail'></i> Students</a></li>
                <li><a href="teachers.jsp"><i class='bx bxs-user-detail'></i> Teachers</a></li>
                <li><a href="courses.jsp"><i class='bx bxs-book-content'></i> Courses</a></li>
                <li><a href="attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="setting.jsp" class="active"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>System Settings</h1>
                    <p>Configure EduFlow to match your institution's needs</p>
                </div>
            </header>

            <div class="form-container">
                <div class="form-card">
                    <section class="settings-section">
                        <h2><i class='bx bx-user-circle'></i> Admin Profile</h2>
                        <form action="UpdateProfileServlet" method="post">
                            <div class="form-grid">
                                <div class="input-group">
                                    <label>Admin Name</label>
                                    <input type="text" name="adminName" value="System Administrator">
                                </div>
                                <div class="input-group">
                                    <label>Email Address</label>
                                    <input type="email" name="adminEmail" value="admin@eduflow.com">
                                </div>
                            </div>
                            <button type="submit" class="btn-save-settings">Update Profile</button>
                        </form>
                    </section>

                    <hr class="settings-divider">

                    <section class="settings-section">
                        <h2><i class='bx bx-building-house'></i> Institutional Details</h2>
                        <form action="UpdateSystemServlet" method="post">
                            <div class="form-grid">
                                <div class="input-group">
                                    <label>Institution Name</label>
                                    <input type="text" name="instName" value="EduFlow Academy">
                                </div>
                                <div class="input-group">
                                    <label>Current Semester</label>
                                    <select name="semester">
                                        <option value="Fall 2025">Fall 2025</option>
                                        <option value="Spring 2026">Spring 2026</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn-save-settings">Save System Changes</button>
                        </form>
                    </section>

                    <hr class="settings-divider">

                    <section class="settings-section">
                        <h2><i class='bx bx-shield-quarter'></i> Security & Password</h2>
                        <form action="ChangePasswordServlet" method="post">
                            <div class="input-group">
                                <label>Current Password</label>
                                <input type="password" name="oldPass" placeholder="••••••••">
                            </div>
                            <div class="form-grid">
                                <div class="input-group">
                                    <label>New Password</label>
                                    <input type="password" name="newPass" placeholder="Enter new password">
                                </div>
                                <div class="input-group">
                                    <label>Confirm Password</label>
                                    <input type="password" name="confirmPass" placeholder="Confirm new password">
                                </div>
                            </div>
                            <button type="submit" class="btn-save-settings danger">Change Password</button>
                        </form>
                    </section>
                </div>
            </div>
        </main>
    </div>
</body>
</html>