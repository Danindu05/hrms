<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="model.User" %>

<%@ page import="java.sql.*" %>

<%@ page import="model.User" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    int leaveRequestsToday = 0;
    double totalWorkedHours = 319; 
    String fixedDate = "2025-04-22";

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
            leaveRequestsToday = rs2.getInt(1);
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
    <style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #e0eafc, #cfdef3);
    color: #333;
}


.content {
    margin-left: 240px;
    padding: 30px;
    display: flex;
    flex-direction: column;
    gap: 40px;
}

.cards-container, .dashboard-sections {
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
    justify-content: center;
}

.card, .chart-container, .big-chart-container, .calendar-container, .top-performers {
    background: rgba(255, 255, 255, 0.7);
    backdrop-filter: blur(8px);
    padding: 20px;
    border-radius: 20px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover, .chart-container:hover, .big-chart-container:hover, .calendar-container:hover, .top-performers:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 25px rgba(0,0,0,0.2);
}

.card {
    flex: 1 1 200px;
    min-width: 220px;
    text-align: center;
}

.card.present { border-top: 5px solid #2ecc71; }
.card.absent { border-top: 5px solid #e74c3c; }
.card.leave { border-top: 5px solid #f39c12; }
.card.worked { border-top: 5px solid #3498db; }

.card h4 {
    margin-bottom: 10px;
    color: #2c3e50;
}

.card p {
    font-size: 24px;
    font-weight: bold;
}

.calendar-container, .top-performers {
    width: 350px;
}

.big-chart-container {
    width: 600px;
}



#calendar {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 6px;
            margin-top: 10px;
            width: 100%;
        }
        
#calendar div {
    padding: 10px;
    border-radius: 12px;
    background: #ecf0f1;
    font-weight: bold;
    transition: 0.3s;
    text-align: center;
}
#calendar div.today {
    background-color: #1abc9c;
    color: white;
}
#calendar div:hover {
    background-color: #bdc3c7;
}

footer {
    text-align: center;
    margin-top: 40px;
    padding: 20px;
    font-size: 14px;
    color: #666;
}

.top-performers {
    width: 350px;
    background: rgba(255, 255, 255, 0.8);
    backdrop-filter: blur(8px);
    padding: 20px;
    border-radius: 20px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    text-align: center;
}

.top-performers h3 {
    margin-bottom: 20px;
    font-size: 22px;
    color: #2c3e50;
}

.top-performers ul {
    list-style: none;
    padding: 0;
}

.top-performers ul li {
    background: rgba(26, 188, 156, 0.2);
    margin-bottom: 12px;
    padding: 10px;
    border-radius: 12px;
    font-weight: 600;
    color: #34495e;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    transition: 0.3s;
}

.top-performers ul li:hover {
    background: rgba(26, 188, 156, 0.4);
    transform: translateY(-3px);
}


</style>

</head>
<body>

<div class="content">
    <h2>Welcome, <%= user.getUsername() %>!</h2>

    <div class="cards-container">
        <div class="card present"><h4>Employees Present</h4><p><%= presentCount %></p></div>
        <div class="card absent"><h4>Employees Absent</h4><p><%= absentCount %></p></div>
        <div class="card leave"><h4>Leave Requests</h4><p><%= leaveRequestsToday %></p></div>
        <div class="card worked"><h4>Total Week Worked Hours</h4><p><%= totalWorkedHours %>h</p></div>
    </div>

    <div class="dashboard-sections">
        <!-- Row 1 -->
        <div class="chart-container">
            <h3>Today's Attendance</h3>
            <canvas id="attendanceChart"></canvas>
        </div>
        
          <div class="calendar-container" style="margin-top: 40px;">
            <h3>Calendar</h3>
            <div id="calendar"></div>
        </div>
        
          <div class="top-performers">
            <h3>Top Performers of the Week</h3>
            <ul>
                <li>🥇 Dananjaya Senanayake - 37h</li>
                <li>🥈 Sachini Dissanayake - 34h</li>
                <li>🥉 Chathura Weerasinghe - 31h</li>
                <li>   Kalani Abeysekara     - 29h</li>
                <li>   Nuwan Ratnayake - 28h</li>
            </ul>
        </div>

        <div class="big-chart-container">
            <h3>Weekly Attendance Overview</h3>
            <canvas id="weeklyAttendanceChart"></canvas>
        </div>

        <!-- Row 2 -->
        <div class="big-chart-container">
            <h3>Weekly Worked Hours</h3>
            <canvas id="workedHoursChart"></canvas>
        </div>

      

        <!-- Row 3 -->
      
    </div>

    <footer>
        © 2025 HR Management System. All rights reserved.
    </footer>
</div>
<script>
const ctx = document.getElementById('attendanceChart').getContext('2d');
new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['Present', 'Absent'],
        datasets: [{
            data: [<%= presentCount %>, <%= absentCount %>],
            backgroundColor: ['#2ecc71', '#e74c3c'],
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
const today = new Date(2025, 4, 22);
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
