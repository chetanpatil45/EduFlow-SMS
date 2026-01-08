<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Settings | EduFlow</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style/dashboard-style.css?v=1.7">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="teacher-dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="view-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="mark-attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="manage-marks.jsp" ><i class='bx bxs-edit-location'></i> Marks</a></li>
                <li><a href="upload-materials.jsp"><i class='bx bxs-file-pdf'></i> Materials</a></li>
                <li><a href="teacher-settings.jsp" class="active"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Account Settings</h1>
                    <p>Manage your profile and security preferences</p>
                </div>
            </header>

            <div class="form-container">
                <div class="form-card" style="background: #fff; padding: 30px; border-radius: 15px; box-shadow: 0 4px 20px rgba(0,0,0,0.05);">
                    
                    <section class="settings-section">
                        <h2 style="margin-bottom: 20px; color: #1e293b;"><i class='bx bx-user-circle'></i> Personal Information</h2>
                        <form action="UpdateTeacherProfileServlet" method="POST">
                            <div class="form-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                                <div class="input-group">
                                    <label>Full Name</label>
                                    <input type="text" name="name" value="Prof. Anderson" readonly style="background: #f1f5f9; cursor: not-allowed;">
                                </div>
                                <div class="input-group">
                                    <label>Email Address</label>
                                    <input type="email" name="email" value="anderson@eduflow.com">
                                </div>
                                <div class="input-group">
                                    <label>Phone Number</label>
                                    <input type="text" name="phone" placeholder="+1 234 567 890">
                                </div>
                                <div class="input-group">
                                    <label>Office / Cabin No.</label>
                                    <input type="text" name="office" value="Lab 04, Tech Block">
                                </div>
                            </div>
                            <button type="submit" class="btn-submit" style="margin-top: 20px;">Update Profile</button>
                        </form>
                    </section>

                    <hr style="margin: 40px 0; border: 0; border-top: 1px solid #e2e8f0;">

                    <section class="settings-section">
                        <h2 style="margin-bottom: 20px; color: #1e293b;"><i class='bx bx-shield-quarter'></i> Security & Password</h2>
                        <form action="ChangeTeacherPasswordServlet" method="POST">
                            <div class="input-group" style="max-width: 500px; margin-bottom: 20px;">
                                <label>Current Password</label>
                                <input type="password" name="currentPass" placeholder="••••••••" required>
                            </div>
                            <div class="form-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; max-width: 500px;">
                                <div class="input-group">
                                    <label>New Password</label>
                                    <input type="password" name="newPass" placeholder="New Password" required>
                                </div>
                                <div class="input-group">
                                    <label>Confirm New Password</label>
                                    <input type="password" name="confirmPass" placeholder="Confirm Password" required>
                                </div>
                            </div>
                            <button type="submit" class="btn-submit" style="margin-top: 20px; background: #ef4444;">Change Password</button>
                        </form>
                    </section>
                </div>
            </div>
        </main>
    </div>
</body>
</html>