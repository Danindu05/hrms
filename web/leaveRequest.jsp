<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.LeaveRequest" %>
<%@ page import="dao.LeaveRequestDAO" %>

<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Leave Requests</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="css/leaverequest.css">
</head>
<body>

<%
    LeaveRequestDAO leaveRequestDAO = new LeaveRequestDAO();
    List<LeaveRequest> leaveList = leaveRequestDAO.getAllLeaveRequests();
%>

<div class="main-content">
    <h1 class="page-title"><i class="fas fa-calendar-check"></i> Leave Requests</h1>

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
                            <button type="submit" class="approve-btn"><i class="fas fa-check"></i> Approve</button>
                        </form>
                        <form method="post" action="UpdateLeaveStatusServlet">
                            <input type="hidden" name="leaveId" value="<%= l.getId() %>">
                            <input type="hidden" name="newStatus" value="Rejected">
                            <button type="submit" class="reject-btn"><i class="fas fa-times"></i> Reject</button>
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
        <div class="no-data">
            <i class="fas fa-info-circle"></i> No leave requests found.
        </div>
    <% } %>
</div>

</body>
</html>
