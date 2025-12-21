<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List | EduFlow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo">
                <h2>Edu<span>Flow</span></h2>
            </div>
            <ul class="nav-links">
                <li><a href="dashboard.jsp" ><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="manage-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="students.jsp" class="active"><i class='bx bxs-user-detail'></i> Students</a></li>
                <li><a href="teachers.jsp"><i class='bx bxs-user-detail'></i> Teachers</a></li>
                <li><a href="courses.jsp"><i class='bx bxs-book-content'></i> Courses</a></li>
                <li><a href="attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="setting.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="#"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Student Directory</h1>
                    <p>Manage and view detailed student information</p>
                </div>
                <div class="header-actions">
                    <a href="ExportPDFServlet" class="btn-export">
                        <i class='bx bxs-file-pdf'></i> Export List
                    </a>
                </div>
            </header>

            <section class="search-action-container">
                <div class="search-box">
                    <i class='bx bx-search'></i>
                    <input type="text" id="studentSearch" placeholder="Search by name, ID or email..."
                        onkeyup="searchStudents()">
                </div>

                <a href="add-students.jsp" class="btn-add-main">
                    <i class='bx bx-user-plus'></i> Add Student
                </a>
            </section>

            <section class="table-container">
                <table id="studentTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Course</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#STU-101</td>
                            <td>John Doe</td>
                            <td>Computer Science</td>
                            <td>john@example.com</td>
                            <td><span class="status-tag holiday">Active</span></td>
                            <td>
                            <td>
                                <button class="btn-view" title="View"
                                    onclick="openViewModal('John Doe', '#STU-101', 'Computer Science', 'john@example.com', 'New York, USA', '2022')">
                                    <i class='bx bx-show'></i>
                                </button>
                                <button class="btn-edit-action" title="Edit"
                                    onclick="openEditModal('#STU-101', 'John Doe', 'john@example.com', 'Computer Science')">
                                    <i class='bx bx-edit-alt'></i>
                                </button>
                                <button class="btn-delete-action" title="Delete" onclick="confirmDelete('#STU-101')">
                                    <i class='bx bx-trash'></i>
                                </button>
                            </td>
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
                <h2>Student Profile</h2>
                <span class="close-btn" onclick="closeModal()">&times;</span>
            </div>
            <div class="profile-body">
                <div class="profile-header-info">
                    <img id="modalImg" src="https://ui-avatars.com/api/?name=John&background=4f46e5&color=fff"
                        alt="Avatar">
                    <h2 id="modalName">Student Name</h2>
                    <p id="modalID">#ID-000</p>
                </div>
                <div class="profile-details-grid">
                    <div class="detail-item"><strong>Course:</strong> <span id="modalCourse">N/A</span></div>
                    <div class="detail-item"><strong>Email:</strong> <span id="modalEmail">N/A</span></div>
                    <div class="detail-item"><strong>Address:</strong> <span id="modalAddress">N/A</span></div>
                    <div class="detail-item"><strong>Admission Year:</strong> <span id="modalYear">N/A</span></div>
                </div>
            </div>
        </div>
    </div>

    <div id="editModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Update Student Details</h2>
                <span class="close-btn" onclick="closeEditModal()">&times;</span>
            </div>
            <form action="UpdateStudentServlet" method="post">
                <input type="hidden" name="studentID" id="editID">
                <div class="input-group">
                    <label>Full Name</label>
                    <input type="text" name="name" id="editName" required>
                </div>
                <div class="input-group">
                    <label>Email Address</label>
                    <input type="email" name="email" id="editEmail" required>
                </div>
                <div class="input-group">
                    <label>Course</label>
                    <select name="course" id="editCourse">
                        <option value="Computer Science">Computer Science</option>
                        <option value="Information Technology">Information Technology</option>
                        <option value="Mechanical Engineering">Mechanical Engineering</option>
                    </select>
                </div>
                <button type="submit" class="btn-submit">Save Changes</button>
            </form>
        </div>
    </div>

    <script>
        function openViewModal(name, id, course, email, address, year) {
            document.getElementById("modalName").innerText = name;
            document.getElementById("modalID").innerText = id;
            document.getElementById("modalCourse").innerText = course;
            document.getElementById("modalEmail").innerText = email;
            document.getElementById("modalAddress").innerText = address;
            document.getElementById("modalYear").innerText = year;
            document.getElementById("viewModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("viewModal").style.display = "none";
        }

        function searchStudents() {
            let input = document.getElementById('studentSearch').value.toLowerCase();
            let table = document.getElementById('studentTable');
            let tr = table.getElementsByTagName('tr');

            for (let i = 1; i < tr.length; i++) {
                let text = tr[i].textContent.toLowerCase();
                tr[i].style.display = text.includes(input) ? "" : "none";
            }
        }

        // Open Edit Modal and fill it with current data
        function openEditModal(id, name, email, course) {
            document.getElementById("editID").value = id;
            document.getElementById("editName").value = name;
            document.getElementById("editEmail").value = email;
            document.getElementById("editCourse").value = course;
            document.getElementById("editModal").style.display = "block";
        }

        function closeEditModal() {
            document.getElementById("editModal").style.display = "none";
        }

        // Simple Delete Confirmation
        function confirmDelete(studentID) {
            if (confirm("Are you sure you want to delete student " + studentID + "? This action cannot be undone.")) {
                // Redirect to your DeleteServlet with the ID
                window.location.href = "DeleteStudentServlet?id=" + encodeURIComponent(studentID);
            }
        }
    </script>
</body>

</html>