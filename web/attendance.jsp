<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Attendance" %>
<%@ page import="dao.AttendanceDAO" %>

<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #e0eafc, #cfdef3);
    margin: 0;
}
.main-content {
    margin-left: 240px;
    padding: 30px;
}
.page-title {
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 25px;
    color: #2c3e50;
}
.filter-form {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    align-items: center;
    margin-bottom: 20px;
}
.filter-form input[type="date"], 
.filter-form select {
    padding: 10px;
    border-radius: 10px;
    border: 1px solid #ccc;
    min-width: 180px;
    font-size: 15px;
}
.filter-form input[type="submit"] {
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-size: 15px;
    transition: background-color 0.3s;
}
.filter-form input[type="submit"]:hover {
    background-color: #2980b9;
}
.record-info {
    margin-top: 10px;
    font-size: 15px;
    color: #555;
}
.record-info strong {
    color: #000;
}
table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    border-radius: 12px;
    overflow: hidden;
    margin-top: 20px;
}
th, td {
    padding: 12px 15px;
    text-align: left;
}
th {
    background-color: #3498db;
    color: white;
}
/* Default even-row color */
.default-row:nth-child(even) {
    background-color: #f2f2f2;
}
.default-row:hover {
    background-color: #ecf0f1;
}
/* Color-coded rows */
.present-row {
    background-color: #d4edda; /* Green */
}
.absent-row {
    background-color: #f8d7da; /* Red */
}
.leave-row {
    background-color: #fff3cd; /* Yellow */
}
    </style>
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

    <h1 class="page-title">Attendance Records</h1>

    <form method="get" action="attendance.jsp" class="filter-form">
        <input type="date" name="selectedDate" value="<%= selectedDate != null ? selectedDate : "" %>">
        <select name="statusFilter">
            <option value="">All Status</option>
            <option value="Present" <%= "Present".equals(statusFilter) ? "selected" : "" %>>Present</option>
            <option value="Absent" <%= "Absent".equals(statusFilter) ? "selected" : "" %>>Absent</option>
            <option value="Leave" <%= "Leave".equals(statusFilter) ? "selected" : "" %>>Leave</option>
        </select>
        <input type="submit" value="Filter">
    </form>

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
        <p>No attendance records found.</p>
    <% } else { %>
        <p>Please select a date or status to view attendance.</p>
    <% } %>

</div>

</body>
</html>
