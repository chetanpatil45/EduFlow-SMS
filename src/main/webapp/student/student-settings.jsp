<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Settings | EduFlow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css?v=1.7">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>Edu<span>Flow</span></h2></div>
            <ul class="nav-links">
                <li><a href="student-dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="my-attendance.jsp"><i class='bx bxs-calendar-check'></i> My Attendance</a></li>
                <li><a href="my-results.jsp"><i class='bx bxs-graduation'></i> My Results</a></li>
                <li><a href="study-resources.jsp"><i class='bx bxs-cloud-download'></i> Resources</a></li>
                <li><a href="student-settings.jsp" class="active"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Profile Settings</h1>
                    <p>Update your personal information and account security</p>
                </div>
            </header>

            <div class="form-container">
                <div class="form-card" style="background: #fff; padding: 30px; border-radius: 15px; box-shadow: 0 4px 20px rgba(0,0,0,0.05);">
                    
                    <section class="settings-section">
                        <h2 style="margin-bottom: 20px; color: #1e293b; display: flex; align-items: center; gap: 10px;">
                            <i class='bx bx-user-circle' style="color: #4f46e5;"></i> Personal Details
                        </h2>
                        <form action="UpdateStudentProfileServlet" method="POST">
                            <div class="form-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                                <div class="input-group">
                                    <label>Full Name</label>
                                    <input type="text" value="John Doe" readonly style="background: #f1f5f9; cursor: not-allowed;">
                                </div>
                                <div class="input-group">
                                    <label>Roll Number</label>
                                    <input type="text" value="#STU-101" readonly style="background: #f1f5f9; cursor: not-allowed;">
                                </div>
                                <div class="input-group">
                                    <label>Email Address</label>
                                    <input type="email" name="email" value="john.doe@student.com" required>
                                </div>
                                <div class="input-group">
                                    <label>Phone Number</label>
                                    <input type="text" name="phone" placeholder="+1 987 654 3210">
                                </div>
                            </div>
                            <button type="submit" class="btn-submit" style="margin-top: 20px;">Save Profile Changes</button>
                        </form>
                    </section>

                    <hr style="margin: 40px 0; border: 0; border-top: 1px solid #e2e8f0;">

                    <section class="settings-section">
                        <h2 style="margin-bottom: 20px; color: #1e293b; display: flex; align-items: center; gap: 10px;">
                            <i class='bx bx-lock-alt' style="color: #ef4444;"></i> Change Password
                        </h2>
                        <form action="ChangeStudentPasswordServlet" method="POST">
                            <div class="input-group" style="max-width: 450px; margin-bottom: 20px;">
                                <label>Current Password</label>
                                <input type="password" name="oldPassword" placeholder="Enter current password" required>
                            </div>
                            <div class="form-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; max-width: 600px;">
                                <div class="input-group">
                                    <label>New Password</label>
                                    <input type="password" name="newPassword" placeholder="Minimum 8 characters" required>
                                </div>
                                <div class="input-group">
                                    <label>Confirm Password</label>
                                    <input type="password" name="confirmPassword" placeholder="Repeat new password" required>
                                </div>
                            </div>
                            <button type="submit" class="btn-submit" style="margin-top: 20px; background: #ef4444;">Update Password</button>
                        </form>
                    </section>
                </div>
            </div>
        </main>
    </div>
</body>
</html>