<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Courses</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style/dashboard-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo">
                <h2>EduFlow Admin</h2>
            </div>
            <ul class="nav-links">
                <li><a href="dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="manage-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="students.jsp"><i class='bx bxs-user-detail'></i> Students</a></li>
                <li><a href="teachers.jsp"><i class='bx bxs-user-detail'></i> Teachers</a></li>
                <li><a href="courses.jsp" class="active"><i class='bx bxs-book-content'></i> Courses</a></li>
                <li><a href="attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="setting.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Courses Management</h1>
                    <p>View and manage all academic programs</p>
                </div>
                <button class="btn-add-course" onclick="openModal()">
                    <i class='bx bx-plus'></i> Add New Course
                </button>
            </header>

            <section class="course-grid">
                <div class="course-card">
                    <div class="course-icon"><i class='bx bx-code-alt'></i></div>
                    <div class="course-info">
                        <h3>Computer Science</h3>
                        <p><strong>Code:</strong> CS-101</p>
                        <p><strong>Duration:</strong> 4 Years</p>
                        <div class="course-stats">
                            <span><i class='bx bxs-user'></i> 120 Students</span>
                        </div>
                    </div>
                    <div class="course-actions">
                        <button class="btn-edit">Edit</button>
                        <button class="btn-delete">Delete</button>
                    </div>
                </div>

                <div class="course-card">
                    <div class="course-icon" style="background: #fef3c7; color: #d97706;"><i class='bx bx-data'></i>
                    </div>
                    <div class="course-info">
                        <h3>Information Tech</h3>
                        <p><strong>Code:</strong> IT-202</p>
                        <p><strong>Duration:</strong> 3 Years</p>
                        <div class="course-stats">
                            <span><i class='bx bxs-user'></i> 85 Students</span>
                        </div>
                    </div>
                    <div class="course-actions">
                        <button class="btn-edit">Edit</button>
                        <button class="btn-delete">Delete</button>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <div id="courseModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Add New Course</h2>
                <span class="close-btn" onclick="closeModal()">&times;</span>
            </div>
            <form action="AddCourseServlet" method="post">
                <div class="input-group">
                    <label>Course Name</label>
                    <input type="text" name="courseName" placeholder="e.g. Mechanical Engineering" required>
                </div>
                <div class="input-group">
                    <label>Course Code</label>
                    <input type="text" name="courseCode" placeholder="e.g. ME-101" required>
                </div>
                <div class="form-grid">
                    <div class="input-group">
                        <label>Duration (Years)</label>
                        <input type="number" name="duration" min="1" max="5" value="4">
                    </div>
                    <div class="input-group">
                        <label>Department</label>
                        <select name="dept">
                            <option value="Engineering">Engineering</option>
                            <option value="Science">Science</option>
                            <option value="Arts">Arts</option>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn-submit">Create Course</button>
            </form>
        </div>
    </div>

    <script>
        // Get the modal
        var modal = document.getElementById("courseModal");

        // Function to open the modal
        function openModal() {
            modal.style.display = "block";
        }

        // Function to close the modal
        function closeModal() {
            modal.style.display = "none";
        }

        // Close if user clicks anywhere outside the box
        window.onclick = function (event) {
            if (event.target == modal) {
                closeModal();
            }
        }
    </script>
</body>

</html>