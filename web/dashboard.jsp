<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="java.sql.*" %>
<jsp:include page="sidebar.jsp" />

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String url = "jdbc:mysql://localhost:3307/hrmsdb";
    String dbUser = "root";
    String dbPassword = "";

    int presentCount = 0;
    int absentCount = 0;
    int leaveCount = 0;
    double totalWorkedHours = 297;
    String fixedDate = "2025-04-08";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

        PreparedStatement ps1 = con.prepareStatement(
            "SELECT status, COUNT(*) as count FROM attendance WHERE date = ? GROUP BY status"
        );
        ps1.setString(1, fixedDate);
        ResultSet rs1 = ps1.executeQuery();
        while (rs1.next()) {
            if ("Present".equalsIgnoreCase(rs1.getString("status"))) {
                presentCount = rs1.getInt("count");
            } else if ("Absent".equalsIgnoreCase(rs1.getString("status"))) {
                absentCount = rs1.getInt("count");
            }
        }

        PreparedStatement ps2 = con.prepareStatement(
            "SELECT COUNT(*) FROM leave_request WHERE start_date <= ? AND end_date >= ?"
        );
        ps2.setString(1, fixedDate);
        ps2.setString(2, fixedDate);
        ResultSet rs2 = ps2.executeQuery();
        if (rs2.next()) {
            leaveCount = rs2.getInt(1);
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - HR Management System</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

<div class="content">
    <div class="dashboard-header">
        <div class="header-left">
            <h2>Welcome back, Admin!</h2>
        </div>
        <div class="header-right">
            <span><i class="fas fa-calendar-alt"></i> 2025-04-08</span>
            <span><i class="fas fa-users"></i> 30 Employees</span>
        </div>
    </div>

    <section class="dashboard-metrics">
        <div class="stat-card">
            <i class="fas fa-user-check"></i>
            <div class="stat-details">
                <h4>Present Today</h4>
                <p><%= presentCount %></p>
            </div>
        </div>
        <div class="stat-card">
            <i class="fas fa-user-times"></i>
            <div class="stat-details">
                <h4>Absent Today</h4>
                <p><%= absentCount %></p>
            </div>
        </div>
        <div class="stat-card">
            <i class="fas fa-user-minus"></i>
            <div class="stat-details">
                <h4>On Leave Today</h4>
                <p><%= leaveCount %></p>
            </div>
        </div>
        <div class="stat-card">
            <i class="fas fa-clock"></i>
            <div class="stat-details">
                <h4>Total Worked Hours</h4>
                <p><%= totalWorkedHours %> h</p>
            </div>
        </div>
    </section>

    <section class="info-strip">
        <div class="info-box">
            <h3><i class="fa-solid fa-chart-pie"></i> Today's Attendance</h3>
            <canvas id="attendanceChart" class="chart-pie"></canvas>
        </div>

        <div class="info-box calendar-box">
            <h3><i class="fa-solid fa-calendar-days"></i> Calendar</h3>
            <div id="calendar"></div>
        </div>

        <div class="info-box">
            <h3><i class="fa-solid fa-trophy"></i> Top Performers of the Week</h3>
            <ul class="top-performers-list">
                <li><span>🥇 Dananjaya Senanayake</span><span>32h</span></li>
                <li><span>🥈 Sachini Dissanayake</span><span>31h</span></li>
                <li><span>🥉 Chathura Weerasinghe</span><span>30h</span></li>
                <li><span>Kalani Abeysekara</span><span>29h</span></li>
                <li><span>Nuwan Ratnayake</span><span>28h</span></li>
            </ul>
        </div>
    </section>

    <div class="insight-row">
        <div class="insight-card">
            <h3><i class="fas fa-chart-bar"></i> Weekly Attendance Overview</h3>
            <div class="chart-wrapper">
                <canvas id="weeklyAttendanceChart"></canvas>
            </div>
        </div>

        <div class="insight-card">
            <h3><i class="fas fa-clock"></i> Weekly Worked Hours</h3>
            <div class="chart-wrapper">
                <canvas id="workedHoursChart"></canvas>
            </div>
        </div>
    </div>
</div>

<script>
const ctx = document.getElementById('attendanceChart').getContext('2d');
new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['Present', 'Absent', 'Leave'],
        datasets: [{
            data: [<%= presentCount %>, <%= absentCount %>, <%= leaveCount %>],
            backgroundColor: ['#2ecc71', '#e74c3c', '#f1c40f'],
            borderColor: '#ffffff',
            borderWidth: 2
        }]
    },
    options: {
        animation: { duration: 2000, easing: 'easeOutBounce' },
        plugins: { legend: { position: 'bottom' } }
    }
});

const weeklyCtx = document.getElementById('weeklyAttendanceChart').getContext('2d');
new Chart(weeklyCtx, {
    type: 'bar',
    data: {
        labels: ['2025-04-15', '2025-04-16', '2025-04-17', '2025-04-18', '2025-04-19', '2025-04-20', '2025-04-21'],
        datasets: [
            { label: 'Present', backgroundColor: '#3498db', data: [28,30,30,27,29,25,30] },
            { label: 'Absent', backgroundColor: '#e67e22', data: [2,0,0,3,1,5,0] }
        ]
    },
    options: {
        animation: { duration: 2000 },
        plugins: { legend: { position: 'bottom' } },
        scales: { y: { beginAtZero: true, title: { display: true, text: 'Number of Employees' } } }
    }
});

const workedHoursCtx = document.getElementById('workedHoursChart').getContext('2d');
new Chart(workedHoursCtx, {
    type: 'bar',
    data: {
        labels: ['2025-04-15', '2025-04-16', '2025-04-17', '2025-04-18', '2025-04-19', '2025-04-20', '2025-04-21'],
        datasets: [{
            label: 'Worked Hours',
            backgroundColor: '#1abc9c',
            data: [74, 77, 82, 71, 72, 70, 79]
        }]
    },
    options: {
        animation: { duration: 2000 },
        plugins: { legend: { position: 'bottom' } },
        scales: { y: { beginAtZero: true, title: { display: true, text: 'Hours' } } }
    }
});

const calendar = document.getElementById('calendar');
const today = new Date(2025, 4, 8);
const year = today.getFullYear();
const month = today.getMonth();
const dateToday = today.getDate();
const firstDay = new Date(year, month, 1).getDay();
const daysInMonth = new Date(year, month + 1, 0).getDate();
const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

daysOfWeek.forEach(day => {
    const div = document.createElement('div');
    div.innerText = day;
    div.style.fontWeight = 'bold';
    div.style.background = '#bdc3c7';
    calendar.appendChild(div);
});

for (let i = 0; i < firstDay; i++) {
    const emptyDiv = document.createElement('div');
    calendar.appendChild(emptyDiv);
}

for (let i = 1; i <= daysInMonth; i++) {
    const dayDiv = document.createElement('div');
    dayDiv.innerText = i;
    if (i === dateToday) {
        dayDiv.classList.add('today');
    }
    calendar.appendChild(dayDiv);
}
</script>
</body>
</html>
