<%@page import="model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	session = request.getSession(false);
	Admin admin = (Admin) session.getAttribute("admin");
	
	if(session == null || admin == null){
		response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
	}

%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - EduFlow </title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style/dashboard-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo">
                <h2>EduFlow</h2>
            </div>
            <ul class="nav-links">
                <li><a href="dashboard.jsp" class="active"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="manage-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="students.jsp"><i class='bx bxs-user-detail'></i> Students</a></li>
                <li><a href="teachers.jsp"><i class='bx bxs-user-detail'></i> Teachers</a></li>
                <li><a href="courses.jsp"><i class='bx bxs-book-content'></i> Courses</a></li>
                <li><a href="attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="setting.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <h1>Welcome back, Admin!</h1>
                <div class="user-profile">
                    <span><%=admin.getName() %></span>
                    <img src="https://ui-avatars.com/api/?name=<%=admin.getName() %>&background=4f46e5&color=fff" alt="profile" style="width: 40px; height: 40px; border-radius: 50%;">
                </div>
            </header>

            <section class="stats-grid">
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>1,250</h3>
                        <p>Total Students</p>
                    </div>
                    <i class='bx bxs-group'></i>
                </div>
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>45</h3>
                        <p>Active Courses</p>
                    </div>
                    <i class='bx bxs-book'></i>
                </div>
                <div class="stat-card">
                    <div class="stat-info">
                        <h3>92%</h3>
                        <p>Attendance</p>
                    </div>
                    <i class='bx bxs-bar-chart-alt-2'></i>
                </div>
            </section>

            <section class="table-container">
                <h2>Recent Student Registrations</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Course</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#1001</td>
                            <td>John Doe</td>
                            <td>john@example.com</td>
                            <td>Computer Science</td>
                            <td><span class="status active">Active</span></td>
                        </tr>
                        <tr>
                            <td>#1002</td>
                            <td>Jane Smith</td>
                            <td>jane@example.com</td>
                            <td>Information Tech</td>
                            <td><span class="status active">Active</span></td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>
</body>

</html>