<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.LeaveRequest" %>
<%@ page import="dao.LeaveRequestDAO" %>

<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Leave Requests</title>
    <style>
body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    background: linear-gradient(135deg, #e0eafc, #cfdef3);
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
table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    margin-top: 20px;
}
th, td {
    padding: 16px 20px;
    text-align: left;
    vertical-align: middle;
}
th {
    background-color: #3498db;
    color: white;
    font-size: 16px;
}
tr:nth-child(even) {
    background-color: #f4f6f8;
}
tr:hover {
    background-color: #ecf0f1;
}

/* Color-coded rows */
.approved-row {
    background-color: #e0f8e0; /* light green */
}
.pending-row {
    background-color: #fff9db; /* light yellow */
}
.rejected-row {
    background-color: #fde0e0; /* light red */
}

/* Buttons */
.action-buttons {
    display: flex;
    gap: 10px;
}
.action-buttons form {
    margin: 0;
}
.action-buttons button {
    padding: 8px 14px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
    font-size: 14px;
}
.approve-btn {
    background-color: #27ae60;
    color: white;
}
.reject-btn {
    background-color: #e74c3c;
    color: white;
}
.approve-btn:hover {
    background-color: #219150;
}
.reject-btn:hover {
    background-color: #c0392b;
}

/* N/A Badge */
.na-badge {
    display: inline-block;
    padding: 6px 12px;
    background-color: #bdc3c7;
    color: white;
    font-size: 14px;
    font-weight: bold;
    border-radius: 20px;
    text-align: center;
}
    </style>
</head>
<body>

<%
    LeaveRequestDAO leaveRequestDAO = new LeaveRequestDAO();
    List<LeaveRequest> leaveList = leaveRequestDAO.getAllLeaveRequests();
%>

<div class="main-content">
    <h1 class="page-title">Leave Requests</h1>

    <% if (leaveList != null && !leaveList.isEmpty()) { %>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Employee ID</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (LeaveRequest l : leaveList) { %>
            <tr class="<%= 
                ("Approved".equalsIgnoreCase(l.getStatus()) ? "approved-row" :
                "Pending".equalsIgnoreCase(l.getStatus()) ? "pending-row" :
                "Rejected".equalsIgnoreCase(l.getStatus()) ? "rejected-row" :
                "default-row")
            %>">
                <td><%= l.getId() %></td>
                <td><%= l.getEmployeeId() %></td>
                <td><%= l.getStartDate() %></td>
                <td><%= l.getEndDate() %></td>
                <td><%= l.getReason() %></td>
                <td><%= l.getStatus() %></td>
                <td class="action-buttons">
                    <% if ("Pending".equalsIgnoreCase(l.getStatus())) { %>
                        <form method="post" action="UpdateLeaveStatusServlet">
                            <input type="hidden" name="leaveId" value="<%= l.getId() %>">
                            <input type="hidden" name="newStatus" value="Approved">
                            <button type="submit" class="approve-btn">Approve</button>
                        </form>
                        <form method="post" action="UpdateLeaveStatusServlet">
                            <input type="hidden" name="leaveId" value="<%= l.getId() %>">
                            <input type="hidden" name="newStatus" value="Rejected">
                            <button type="submit" class="reject-btn">Reject</button>
                        </form>
                    <% } else { %>
                        <span class="na-badge">N/A</span>
                    <% } %>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <% } else { %>
        <p>No leave requests found.</p>
    <% } %>

</div>

</body>
</html>
