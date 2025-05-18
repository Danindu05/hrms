<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.tTracker" %>

<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Target Tracker</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/ttracker.css">
</head>
<body>
<div class="main-content">
    <h2><i class="fas fa-bullseye"></i> Target Tracker Summary</h2>

    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search by name..." onkeyup="filterTable()">
    </div>

    <table id="trackerTable">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Productivity</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<tTracker> list = (List<tTracker>) request.getAttribute("trackerList");
            if (list != null) {
                int index = 0;
                for (tTracker t : list) {
                    int productivity = (t.getTasksAssigned() > 0)
                        ? (int)(((double)t.getTasksCompleted() / t.getTasksAssigned()) * 100) : 0;

                    String rawImg = t.getImagePath();
                    String imgPath = (rawImg != null && !rawImg.isEmpty()) ? rawImg : "default.png";
                    if (!imgPath.startsWith("images/")) {
                        imgPath = "images/" + imgPath;
                    }

                    String progressGradient = "linear-gradient(to right, #f12711, #f5af19)"; 
                    if (productivity > 70) progressGradient = "linear-gradient(to right, #56ab2f, #a8e063)";
                    else if (productivity > 30) progressGradient = "linear-gradient(to right, #f39c12, #f1c40f)";
        %>
        <tr>
            <td><%= t.getEmployeeId() %></td>
            <td><%= t.getEmployeeName() %></td>
            <td>
                <div class="progress-container">
                    <div class="progress-bar" style="width: <%= productivity %>%; background: <%= progressGradient %>;">
                        <%= productivity %>%
                    </div>
                </div>
            </td>
            <td>
                <i class="fas fa-chevron-up popup-icon" onclick="openModal(<%= index %>)"></i>
                <div class="modal" id="modal-<%= index %>">
                    <div class="modal-content">
                        <span class="close" onclick="closeModal(<%= index %>)">&times;</span>

                        <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; margin-bottom: 20px;">
                            <img src="<%= request.getContextPath() + '/' + imgPath %>" class="emp-img" />
                            <div class="info-card">
                                <p><b>Employee ID:</b> <%= t.getEmployeeId() %></p>
                                <p><b>Name:</b> <%= t.getEmployeeName() %></p>
                                <p><b>Department:</b> <%= t.getDepartment() %></p>
                            </div>
                        </div>

                        <div class="analyzer-label"><i class="fa-solid fa-chart-column"></i> Productivity Analyzer</div>
                        <div class="progress-container">
                            <div class="progress-bar" style="width: <%= productivity %>%; background: <%= progressGradient %>;">
                                <%= productivity %>%
                            </div>
                        </div>

                        <div class="info-grid">
                            <div class="info-box"><b>Attendance</b><br><%= t.getAttendanceDays() %> days</div>
                            <div class="info-box"><b>Leave</b><br><%= t.getLeaveDays() %></div>
                            <div class="info-box"><b>Late</b><br><%= t.getLateDays() %></div>
                            <div class="info-box"><b>Tasks</b><br><%= t.getTasksCompleted() %>/<%= t.getTasksAssigned() %></div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <%
                    index++;
                }
            } else {
        %>
        <tr><td colspan="4">No data available or error in loading tracker data.</td></tr>
        <% } %>
        </tbody>
    </table>
</div>

<script>
    function openModal(index) {
        document.getElementById('modal-' + index).style.display = 'block';
    }
    function closeModal(index) {
        document.getElementById('modal-' + index).style.display = 'none';
    }

    function filterTable() {
        const input = document.getElementById("searchInput").value.toLowerCase();
        const rows = document.querySelectorAll("#trackerTable tbody tr");
        rows.forEach(row => {
            const name = row.cells[1].textContent.toLowerCase();
            row.style.display = name.includes(input) ? "" : "none";
        });
    }
</script>
</body>
</html>
