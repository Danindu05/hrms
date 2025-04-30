<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        /* Sidebar Styling */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 220px;
            height: 100%;
            background-color: #2c3e50;
            padding: 20px 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            z-index: 100;
        }

        .sidebar h2 {
            color: #ecf0f1;
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
        }

        .sidebar a {
            display: block;
            color: #bdc3c7;
            padding: 12px 25px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
            color: #ffffff;
        }

        .sidebar a.active {
            background-color: #1abc9c;
            color: white;
            font-weight: bold;
        }

        .sidebar a i {
            margin-right: 10px;
        }

        /* Main page adjustment */
        .main-content {
            margin-left: 240px; /* Width of sidebar + padding */
            padding: 20px;
        }
    </style>

    <!-- You can optionally add FontAwesome icons if you want better icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<div class="sidebar">
    <h2>HRMS</h2>
    <a href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
    <a href="viewEmployees.jsp"><i class="fas fa-users"></i> View Employees</a>
    <a href="attendance.jsp"><i class="fas fa-calendar-check"></i> Attendance</a>
    <a href="leaveRequest.jsp"><i class="fas fa-calendar-plus"></i> Leave Requests</a>
    <a href="payroll.jsp"><i class="fas fa-money-check-alt"></i> Payroll</a>  
    <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

</body>
</html>
