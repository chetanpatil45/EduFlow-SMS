<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Study Resources | EduFlow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css?v=1.6">
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
                <li><a href="study-resources.jsp" class="active"><i class='bx bxs-cloud-download'></i> Resources</a></li>
                <li><a href="student-settings.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout"><a href="<%=request.getContextPath()%>/LogoutServlet"><i class='bx bxs-log-out'></i> Logout</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Learning Resources</h1>
                    <p>Access notes, videos, and guides uploaded by your teachers</p>
                </div>
            </header>

            <section class="table-container">
                <div class="table-header-flex" style="display: flex; justify-content: space-between; margin-bottom: 20px;">
                    <h2>Course Materials</h2>
                    <div class="search-box" style="max-width: 300px;">
                        <i class='bx bx-search'></i> 
                        <input type="text" placeholder="Search by topic or course...">
                    </div>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Resource Title</th>
                            <th>Course</th>
                            <th>Type</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Unit 1: Introduction to Java PDF</td>
                            <td>CS-101</td>
                            <td><span class="status-tag holiday">FILE</span></td>
                            <td>
                                <a href="DownloadServlet?fileId=101" class="btn-view" title="Download">
                                    <i class='bx bx-download'></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>Java Collections YouTube Lecture</td>
                            <td>CS-101</td>
                            <td><span class="status-tag exam">LINK</span></td>
                            <td>
                                <a href="https://youtube.com/..." target="_blank" class="btn-view" title="Open Link">
                                    <i class='bx bx-link-external'></i>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>Unit 1 Summary & Tips</td>
                            <td>CS-101</td>
                            <td><span class="status-tag holiday">TEXT</span></td>
                            <td>
                                <button class="btn-view" onclick="viewTextMaterial('Unit 1 Summary', 'Focus on JVM architecture and memory management for the quiz.')">
                                    <i class='bx bx-show'></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>

    <div id="viewTextModal" class="modal">
        <div class="modal-content" style="max-width: 500px;">
            <div class="modal-header">
                <h2 id="modalTitle">Resource Content</h2>
                <span class="close-btn" onclick="closeViewModal()">&times;</span>
            </div>
            <div class="modal-body" style="padding: 20px 0;">
                <p id="modalBodyText" style="white-space: pre-wrap; line-height: 1.6; color: #475569;"></p>
            </div>
            <button class="btn-submit" onclick="closeViewModal()">Close</button>
        </div>
    </div>

    <script>
        function viewTextMaterial(title, content) {
            document.getElementById("modalTitle").innerText = title;
            document.getElementById("modalBodyText").innerText = content;
            document.getElementById("viewTextModal").style.display = "block";
        }
        function closeViewModal() {
            document.getElementById("viewTextModal").style.display = "none";
        }
        window.onclick = function(event) {
            let modal = document.getElementById("viewTextModal");
            if (event.target == modal) modal.style.display = "none";
        }
    </script>
</body>
</html>s