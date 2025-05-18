<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String currentPage = request.getRequestURI();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HRMS</title>
    <link rel="stylesheet" href="css/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<div class="sidebar">
    <div style="text-align: center; margin-bottom: 25px;">
    <img src="images/logo.png" alt="HRMS Logo" style="max-width: 150px; height: auto;">
</div>
    <a href="dashboard.jsp" class="<%= currentPage.contains("dashboard.jsp") ? "active" : "" %>"><i class="fas fa-home"></i> Dashboard</a>
    <a href="viewEmployees.jsp" class="<%= currentPage.contains("viewEmployees.jsp") ? "active" : "" %>"><i class="fas fa-users"></i> View Employees</a>
    <a href="attendance.jsp" class="<%= currentPage.contains("attendance.jsp") ? "active" : "" %>"><i class="fas fa-calendar-check"></i> Attendance</a>
    <a href="leaveRequest.jsp" class="<%= currentPage.contains("leaveRequest.jsp") ? "active" : "" %>"><i class="fas fa-calendar-plus"></i> Leave Requests</a>
    <a href="payroll.jsp" class="<%= currentPage.contains("payroll.jsp") ? "active" : "" %>"><i class="fas fa-money-check-alt"></i> Payroll</a>
    <a href="tTrackerServlet" class="<%= currentPage.contains("tTracker.jsp") ? "active" : "" %>"><i class="fas fa-bullseye"></i> Target Tracker</a>


    <div class="logout-link">
        <a href="logout.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</div>

</body>
</html>
