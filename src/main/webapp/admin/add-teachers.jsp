<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Record</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style/dashboard-style.css"> <link rel="stylesheet" href="../style/form-style.css"> <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

<%
	String error = (String) request.getAttribute("error");
	String success = (String) request.getAttribute("sucess");
	if(error != null){
		%>
		<script type="text/javascript">
			alert("<%= error %>");
		</script>
		<%
	}
	else if(success!= null){
		%>
		<script type="text/javascript">
			alert("<%= success %>");
		</script>
		<%
	}
%>

    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo"><h2>EduFlow Admin</h2></div>
            <ul class="nav-links">
                <li><a href="dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="manage-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="students.jsp"><i class='bx bxs-user-detail'></i> Students</a></li>
                <li><a href="teachers.jsp" class="active"><i class='bx bxs-user-detail'></i> Teachers</a></li>
                <li><a href="courses.jsp"><i class='bx bxs-book-content'></i> Courses</a></li>
                <li><a href="attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="setting.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <h1>Registration Portal</h1>
                <a href="teachers.jsp" class="btn-back"><i class='bx bx-arrow-back'></i> Back</a>
            </header>

            <section class="form-container">
                <div class="form-card">
                    <h2>Enter Details</h2>
                    <form action="AddUserServlet" method="post">
                        <div class="form-grid">
                            <div class="input-group">
                                <label>Full Name</label>
                                <input type="text" name="fullName" placeholder="John Doe" required>
                            </div>
                            <div class="input-group">
                                <label>Email Address</label>
                                <input type="email" name="email" placeholder="john@example.com" required>
                            </div>
                            <div class="input-group">
                                <label>Department / Course</label>
                                <select name="department">
                                    <option value="cs">Computer Science</option>
                                    <option value="it">Information Technology</option>
                                    <option value="math">Mathematics</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <label>Phone Number</label>
                                <input type="text" name="phone" placeholder="+1 234 567 890">
                            </div>
                        </div>
                        
                        <div class="input-group full-width">
                            <label>Home Address</label>
                            <textarea name="address" rows="3"></textarea>
                        </div>

                        <button type="submit" class="btn-submit">Save Record</button>
                    </form>
                </div>
            </section>
        </main>
    </div>
</body>
</html>