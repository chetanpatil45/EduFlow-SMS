<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Study Materials | EduFlow</title>
    <link rel="stylesheet" href="../style/dashboard-style.css?v=1.4">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div class="logo">
                <h2>Edu<span>Flow</span></h2>
            </div>
            <ul class="nav-links">
                <li><a href="teacher-dashboard.jsp"><i class='bx bxs-dashboard'></i> Dashboard</a></li>
                <li><a href="view-announcements.jsp"><i class='bx bxs-megaphone'></i> Announcements</a></li>
                <li><a href="mark-attendance.jsp"><i class='bx bxs-calendar-check'></i> Attendance</a></li>
                <li><a href="manage-marks.jsp"><i class='bx bxs-edit-location'></i> Marks</a></li>
                <li><a href="upload-materials.jsp" class="active"><i class='bx bxs-file-pdf'></i> Materials</a></li>
                <li><a href="teacher-settings.jsp"><i class='bx bxs-cog'></i> Settings</a></li>
                <li class="logout">
                    <a href="<%=request.getContextPath()%>/LogoutServlet">
                        <i class='bx bxs-log-out'></i> Logout
                    </a>
                </li>
            </ul>
        </nav>

        <main class="main-content">
            <header>
                <div class="header-title">
                    <h1>Course Resources</h1>
                    <p>Upload and manage study materials for your students</p>
                </div>
                <button class="btn-add-main" onclick="openUploadModal()">
                    <i class='bx bx-upload'></i> New Upload
                </button>
            </header>

            <section class="table-container">
                <div class="table-header-flex" style="display: flex; justify-content: space-between; margin-bottom: 20px;">
                    <h2>Uploaded Documents</h2>
                    <div class="search-box" style="max-width: 300px;">
                        <i class='bx bx-search'></i> 
                        <input type="text" placeholder="Search files...">
                    </div>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>File Name</th>
                            <th>Course</th>
                            <th>Upload Date</th>
                            <th>Type</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Exam Preparation Tips</td>
                            <td>CS-101</td>
                            <td>28 Dec 2025</td>
                            <td><span class="status-tag holiday">TEXT</span></td>
                            <td>
                                <button class="btn-view" onclick="viewTextMaterial('Exam Preparation Tips', 'Focus on Chapter 3 and 5. Make sure to review the lab experiments from week 2.')">
                                    <i class='bx bx-show'></i>
                                </button>
                                <button class="btn-delete-action"><i class='bx bx-trash'></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>YouTube: Java Collections Deep Dive</td>
                            <td>CS-101</td>
                            <td>28 Dec 2025</td>
                            <td><span class="status-tag exam">LINK</span></td>
                            <td>
                                <a href="https://youtube.com/..." target="_blank" class="btn-view" title="Open Link"> 
                                    <i class='bx bx-link-external'></i>
                                </a>
                                <button class="btn-delete-action" title="Delete"><i class='bx bx-trash'></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>Unit 1 Overview Notes</td>
                            <td>CS-101</td>
                            <td>28 Dec 2025</td>
                            <td><span class="status-tag holiday">TEXT</span></td>
                            <td>
                                <button class="btn-view" onclick="viewTextMaterial('Unit 1 Overview Notes', 'The content of the note goes here...')">
                                    <i class='bx bx-show'></i>
                                </button>
                                <button class="btn-delete-action"><i class='bx bx-trash'></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>Unit 1 - Introduction to Java</td>
                            <td>CS-101</td>
                            <td>24 Dec 2025</td>
                            <td><span class="status-tag holiday">PDF</span></td>
                            <td>
                                <button class="btn-view" title="Download"><i class='bx bx-download'></i></button>
                                <button class="btn-delete-action" title="Delete"><i class='bx bx-trash'></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>

    <div id="uploadModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Add Study Resource</h2>
                <span class="close-btn" onclick="closeUploadModal()">&times;</span>
            </div>
            <form action="UploadMaterialServlet" method="POST" enctype="multipart/form-data">
                <div class="input-group">
                    <label>Resource Title</label> 
                    <input type="text" name="title" placeholder="e.g., Week 4 YouTube Lecture" required>
                </div>

                <div class="form-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                    <div class="input-group">
                        <label>Select Course</label> 
                        <select name="courseID">
                            <option value="CS101">Computer Science (CS-101)</option>
                            <option value="IT202">Information Tech (IT-202)</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label>Resource Type</label> 
                        <select name="resourceType" id="resourceType" onchange="toggleInput()">
                            <option value="file">Physical File (PDF/PPT)</option>
                            <option value="link">Web Link (URL)</option>
                            <option value="text">Short Note / Text</option>
                        </select>
                    </div>
                </div>

                <div id="fileInputSection" class="input-group">
                    <label>Select File</label> 
                    <input type="file" name="file" accept=".pdf,.ppt,.pptx,.doc,.docx">
                </div>

                <div id="linkInputSection" class="input-group" style="display: none;">
                    <label>Paste Link URL</label> 
                    <input type="url" name="linkURL" placeholder="https://youtube.com/...">
                </div>

                <div id="textInputSection" class="input-group" style="display: none;">
                    <label>Write Note</label>
                    <textarea name="shortNote" rows="4" placeholder="Enter your instructions or notes here..."></textarea>
                </div>

                <button type="submit" class="btn-submit">Start Upload</button>
            </form>
        </div>
    </div>

    <div id="viewTextModal" class="modal">
        <div class="modal-content" style="max-width: 500px;">
            <div class="modal-header">
                <h2 id="modalTitle">Material Content</h2>
                <span class="close-btn" onclick="closeViewModal()">&times;</span>
            </div>
            <div class="modal-body" style="padding: 20px 0;">
                <p id="modalBodyText" style="white-space: pre-wrap; line-height: 1.6; color: #475569;"></p>
            </div>
            <button class="btn-submit" onclick="closeViewModal()">Close</button>
        </div>
    </div>

    <script>
        // Toggle Upload Form Fields based on selection
        function toggleInput() {
            const type = document.getElementById('resourceType').value;
            document.getElementById('fileInputSection').style.display = (type === 'file') ? 'block' : 'none';
            document.getElementById('linkInputSection').style.display = (type === 'link') ? 'block' : 'none';
            document.getElementById('textInputSection').style.display = (type === 'text') ? 'block' : 'none';
        }

        // Upload Modal Controls
        function openUploadModal() {
            document.getElementById("uploadModal").style.display = "block";
        }
        function closeUploadModal() {
            document.getElementById("uploadModal").style.display = "none";
        }

        // View Text Modal Controls
        function viewTextMaterial(title, content) {
            document.getElementById("modalTitle").innerText = title;
            document.getElementById("modalBodyText").innerText = content;
            document.getElementById("viewTextModal").style.display = "block";
        }
        function closeViewModal() {
            document.getElementById("viewTextModal").style.display = "none";
        }

        // Global Window Click to close modals
        window.onclick = function(event) {
            let viewModal = document.getElementById("viewTextModal");
            let uploadModal = document.getElementById("uploadModal");
            if (event.target == viewModal) viewModal.style.display = "none";
            if (event.target == uploadModal) uploadModal.style.display = "none";
        }
    </script>
</body>
</html>