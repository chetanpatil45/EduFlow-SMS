<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Directory | EduFlow</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style/dashboard-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
            <div class="logo">
                <h2>Edu<span>Flow</span></h2>
            </div>
            <ul class="nav-links">
                <li><a href="<%=request.getContextPath() %>/admin/dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/manage-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/students.jsp"><i class='bx bxs-user-detail'></i> Students</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/teachers.jsp" class="active"><i class='bx bxs-user-detail'></i> Teachers</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/courses.jsp"><i class='bx bxs-book-content'></i> Courses</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="<%=request.getContextPath() %>/admin/setting.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Teacher Directory</h1>
                    <p>Manage faculty members and their assignments</p>
                </div>
                <div class="header-actions">
                    <a href="ExportTeacherPDFServlet" class="btn-export">
                        <i class='bx bxs-file-pdf'></i> Export List
                    </a>
                </div>
            </header>

            <section class="search-action-container">
                <div class="search-box">
                    <i class='bx bx-search'></i>
                    <input type="text" id="teacherSearch" placeholder="Search by name, Dept or ID..." onkeyup="searchTeachers()">
                </div>
                <a href="<%=request.getContextPath() %>/admin/add-teachers.jsp" class="btn-add-main">
                    <i class='bx bx-user-plus'></i> Add Teacher
                </a>
            </section>

            <section class="table-container">
                <table id="teacherTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Department</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#T-501</td>
                            <td>Prof. Anderson</td>
                            <td>Computer Science</td>
                            <td>anderson@eduflow.com</td>
                            <td>
                                <button class="btn-view" onclick="openTeacherModal('Prof. Anderson', '#T-501', 'Computer Science', 'anderson@eduflow.com', 'Lab 4, Tech Block', 'PhD CS')">
                                    <i class='bx bx-show'></i>
                                </button>
                                <button class="btn-edit-action" onclick="openEditTeacherModal('#T-501', 'Prof. Anderson', 'anderson@eduflow.com', 'Computer Science')">
                                    <i class='bx bx-edit-alt'></i>
                                </button>
                                <button class="btn-delete-action" onclick="confirmDeleteTeacher('#T-501')">
                                    <i class='bx bx-trash'></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>

    <div id="viewModal" class="modal">
        <div class="modal-content student-profile-modal">
            <div class="modal-header">
                <h2>Teacher Profile</h2>
                <span class="close-btn" onclick="closeModal()">&times;</span>
            </div>
            <div class="profile-body">
                <div class="profile-header-info">
                    <img id="modalImg" src="https://ui-avatars.com/api/?name=Teacher&background=4f46e5&color=fff" alt="Avatar">
                    <h2 id="modalName">Teacher Name</h2>
                    <p id="modalID">#ID-000</p>
                </div>
                <div class="profile-details-grid">
                    <div class="detail-item"><strong>Department:</strong> <span id="modalDept">N/A</span></div>
                    <div class="detail-item"><strong>Email:</strong> <span id="modalEmail">N/A</span></div>
                    <div class="detail-item"><strong>Office/Cabin:</strong> <span id="modalOffice">N/A</span></div>
                    <div class="detail-item"><strong>Qualification:</strong> <span id="modalQual">N/A</span></div>
                </div>
            </div>
        </div>
    </div>

    <div id="editModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Update Teacher Details</h2>
                <span class="close-btn" onclick="closeEditModal()">&times;</span>
            </div>
            <form action="UpdateTeacherServlet" method="post">
                <input type="hidden" name="teacherID" id="editID">
                <div class="input-group">
                    <label>Full Name</label>
                    <input type="text" name="name" id="editName" required>
                </div>
                <div class="input-group">
                    <label>Email Address</label>
                    <input type="email" name="email" id="editEmail" required>
                </div>
                <div class="input-group">
                    <label>Department</label>
                    <select name="department" id="editDept">
                        <option value="Computer Science">Computer Science</option>
                        <option value="Information Technology">Information Technology</option>
                        <option value="Mechanical Engineering">Mechanical Engineering</option>
                        <option value="Electronics">Electronics</option>
                    </select>
                </div>
                <button type="submit" class="btn-submit">Save Changes</button>
            </form>
        </div>
    </div>

    <script>
        function openTeacherModal(name, id, dept, email, office, qual) {
            document.getElementById("modalName").innerText = name;
            document.getElementById("modalID").innerText = id;
            document.getElementById("modalDept").innerText = dept;
            document.getElementById("modalEmail").innerText = email;
            document.getElementById("modalOffice").innerText = office;
            document.getElementById("modalQual").innerText = qual;
            document.getElementById("viewModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("viewModal").style.display = "none";
        }

        function openEditTeacherModal(id, name, email, dept) {
            document.getElementById("editID").value = id;
            document.getElementById("editName").value = name;
            document.getElementById("editEmail").value = email;
            document.getElementById("editDept").value = dept;
            document.getElementById("editModal").style.display = "block";
        }

        function closeEditModal() {
            document.getElementById("editModal").style.display = "none";
        }

        function searchTeachers() {
            let input = document.getElementById('teacherSearch').value.toLowerCase();
            let table = document.getElementById('teacherTable');
            let tr = table.getElementsByTagName('tr');

            for (let i = 1; i < tr.length; i++) {
                let text = tr[i].textContent.toLowerCase();
                tr[i].style.display = text.includes(input) ? "" : "none";
            }
        }

        function confirmDeleteTeacher(id) {
            if (confirm("Are you sure you want to remove Teacher " + id + "?")) {
                window.location.href = "DeleteTeacherServlet?id=" + id;
            }
        }

        // Close modals if clicked outside
        window.onclick = function(event) {
            if (event.target == document.getElementById("viewModal")) closeModal();
            if (event.target == document.getElementById("editModal")) closeEditModal();
        }
    </script>
</body>
</html>