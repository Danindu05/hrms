<%-- 
    Document   : tTracker
    Created on : May 6, 2025, 5:46:59?PM
    Author     : Irushi Weerasinghe
--%>
<%@ page import="model.tTracker" %>
<%
    tTracker tracker = (tTracker) request.getAttribute("tracker");
%>
<html>
<head>
    <title>Employee Tracker</title>
</head>
<body>
    <h2>Employee Productivity Report</h2>
    <p><strong>ID:</strong> <%= tracker.getid() %></p>
    <p><strong>Name:</strong> <%= tracker.getname() %></p>
    <p><strong>Attendance Days:</strong> <%= tracker.getAttendanceDays() %></p>
    <p><strong>Leave Days:</strong> <%= tracker.getLeaveDays() %></p>
    <p><strong>Performance Score:</strong> <%= tracker.getPerformanceScore() %></p>
    <p><strong>Tasks Completed:</strong> <%= tracker.getTasksCompleted() %></p>
    <p><strong>Total Hours Worked:</strong> <%= tracker.getHoursWorked() %></p>
    <script>
        </script>
</body>
</html>
