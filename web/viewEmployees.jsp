<%@page import="java.util.List"%>
<%@page import="model.Employee"%>
<%@page import="dao.EmployeeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="css/viewemployees.css">

    <script>
        function filterTable() {
            const input = document.getElementById("search").value.toLowerCase();
            const rows = document.querySelectorAll("table tbody tr");

            rows.forEach(row => {
                const name = row.querySelector("td[data-label='Name']");
                if (name && name.textContent.toLowerCase().includes(input)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }
    </script>
</head>
<body>
<div class="main-content">
    <div class="header-bar">
        <h1><i class="fas fa-users"></i> Employee List</h1>
        <a href="addEmployee.jsp" class="add-button"><i class="fas fa-user-plus"></i> Add Employee</a>
    </div>

    <div class="search-box">
        <input type="text" id="search" onkeyup="filterTable()" placeholder="Search by name...">
    </div>

    <table>
        <thead>
        <tr>
            <th>Image</th>
            <th>ID</th>
            <th>Name</th>
            <th>Job Role</th>
            <th>Department</th>
            <th>Address</th>
            <th>Contact</th>
            <th>NIC</th>
            <th>Home Contact</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            EmployeeDAO employeeDAO = new EmployeeDAO();
            List<Employee> employees = employeeDAO.getAllEmployees();
            for (Employee emp : employees) {
                String imgFile = (emp.getImg() != null && !emp.getImg().isEmpty()) ? emp.getImg() : "default.png";
        %>
        <tr>
            <td data-label="Image">
                <img src="images/<%= imgFile %>" alt="Profile" class="employee-img" title="<%= emp.getName() %>">
            </td>
            <td data-label="ID"><%= emp.getId() %></td>
            <td data-label="Name"><%= emp.getName() %></td>
            <td data-label="Job Role"><%= emp.getJobRole() %></td>
            <td data-label="Department"><%= emp.getDepartment() %></td>
            <td data-label="Address" title="<%= emp.getAddress() %>"><%= emp.getAddress() %></td>
            <td data-label="Contact"><%= emp.getContactNumber() %></td>
            <td data-label="NIC"><%= emp.getNic() %></td>
            <td data-label="Home Contact"><%= emp.getHomeContactNumber() %></td>
            <td data-label="Actions">
                <div class="action-buttons">
                    <a class="edit-button" href="editEmployee?id=<%= emp.getId() %>">
                        <i class="fas fa-edit"></i> Edit
                    </a>
                    <a class="delete-button" href="deleteEmployee?id=<%= emp.getId() %>"
                       onclick="return confirm('Are you sure you want to delete this employee?');">
                        <i class="fas fa-trash"></i> Delete
                    </a>
                </div>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
