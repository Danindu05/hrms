<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Attendance" %>
<%@ page import="dao.AttendanceDAO" %>

<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="css/attendance.css">
</head>
<body>

<%
    String selectedDate = request.getParameter("selectedDate");
    String statusFilter = request.getParameter("statusFilter");

    AttendanceDAO attendanceDAO = new AttendanceDAO();
    List<Attendance> attendanceList = null;

    int presentCount = 0;
    int absentCount = 0;
    int leaveCount = 0;

    if ((selectedDate != null && !selectedDate.isEmpty()) || (statusFilter != null && !statusFilter.isEmpty())) {
        attendanceList = attendanceDAO.getAttendance(selectedDate, statusFilter);

        for (Attendance a : attendanceList) {
            if ("Present".equalsIgnoreCase(a.getStatus())) presentCount++;
            else if ("Absent".equalsIgnoreCase(a.getStatus())) absentCount++;
            else if ("Leave".equalsIgnoreCase(a.getStatus())) leaveCount++;
        }
    }
%>

<div class="main-content">

    <h1 class="page-title"><i class="fas fa-user-check"></i> Attendance Records</h1>

    <div class="filter-box">
        <form method="get" action="attendance.jsp" style="display: flex; flex-wrap: wrap; gap: 15px; width: 100%;">
            <input type="date" name="selectedDate" value="<%= selectedDate != null ? selectedDate : "" %>">
            <select name="statusFilter">
                <option value="">All Status</option>
                <option value="Present" <%= "Present".equals(statusFilter) ? "selected" : "" %>>Present</option>
                <option value="Absent" <%= "Absent".equals(statusFilter) ? "selected" : "" %>>Absent</option>
                <option value="Leave" <%= "Leave".equals(statusFilter) ? "selected" : "" %>>Leave</option>
            </select>
            <input type="submit" value="Filter">
        </form>
    </div>

    <% if (attendanceList != null && !attendanceList.isEmpty()) { %>
        <p class="record-info">
            Showing <strong><%= attendanceList.size() %></strong> 
            <%= (statusFilter != null && !statusFilter.isEmpty()) ? statusFilter : "records" %> 
            <%= (selectedDate != null && !selectedDate.isEmpty()) ? "on " + selectedDate : "" %>.
        </p>

        <table>
            <tr>
                <th>Employee Name</th>
                <th>Date</th>
                <th>Status</th>
            </tr>

            <% for (Attendance a : attendanceList) { %>
                <tr class="<%= 
                    ("Present".equalsIgnoreCase(a.getStatus()) ? "present-row" :
                    "Absent".equalsIgnoreCase(a.getStatus()) ? "absent-row" :
                    "Leave".equalsIgnoreCase(a.getStatus()) ? "leave-row" :
                    "default-row")
                %>">
                    <td><%= a.getEmployeeName() %></td>
                    <td><%= a.getDate() %></td>
                    <td><%= a.getStatus() %></td>
                </tr>
            <% } %>
        </table>

    <% } else if (selectedDate != null || statusFilter != null) { %>
        <p class="record-info">No attendance records found.</p>
    <% } else { %>
        <p class="record-info">Please select a date or status in April to view attendance.</p>
    <% } %>

</div>

</body>
</html>
