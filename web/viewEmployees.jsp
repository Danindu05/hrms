<%@page import="java.util.List"%>
<%@page import="model.Employee"%>
<%@page import="dao.EmployeeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 40px;
        background-color: #f4f6f8;
    }
    h1 {
        color: #333;
    }
    .button-container {
        margin-bottom: 20px;
    }
    .add-button {
        padding: 10px 20px;
        background-color: #2ecc71;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 16px;
    }
    .add-button:hover {
        background-color: #27ae60;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
        background-color: white;
    }
    th, td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: left;
        vertical-align: middle;
    }
    th {
        background-color: #3498db;
        color: white;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .edit-button {
        padding: 6px 12px;
        background-color: #2ecc71;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        margin-right: 5px;
        font-size: 14px;
    }
    .edit-button:hover {
        background-color: #27ae60;
    }
    .delete-button {
        padding: 6px 12px;
        background-color: #e74c3c;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        font-size: 14px;
    }
    .delete-button:hover {
        background-color: #c0392b;
    }
    .employee-img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        object-fit: cover;
    }
</style>
</head>
<body>
<div class="main-content">
<h1>Employee List</h1>

<div class="button-container">
    <a href="addEmployee.jsp" class="add-button">➕ Add New Employee</a>
</div>

<table>
    <tr>
        <th>Image</th> <!-- New column before ID -->
        <th>ID</th>
        <th>Name</th>
        <th>Job Role</th>
        <th>Department</th>
        <th>Address</th>
        <th>Contact Number</th>
        <th>NIC</th>
        <th>Home Contact Number</th>
        <th>Actions</th>
    </tr>
    <%
        EmployeeDAO employeeDAO = new EmployeeDAO();
        List<Employee> employees = employeeDAO.getAllEmployees();
        for (Employee emp : employees) {
            String imgFile = (emp.getImg() != null && !emp.getImg().isEmpty()) ? emp.getImg() : "default.png";
    %>
    <tr>
        <td><img src="images/<%= imgFile %>" alt="Profile" class="employee-img"></td> <!-- Show Image -->
        <td><%= emp.getId() %></td>
        <td><%= emp.getName() %></td>
        <td><%= emp.getJobRole() %></td>
        <td><%= emp.getDepartment() %></td>
        <td><%= emp.getAddress() %></td>
        <td><%= emp.getContactNumber() %></td>
        <td><%= emp.getNic() %></td>
        <td><%= emp.getHomeContactNumber() %></td>
        <td>
            <a class="edit-button" href="editEmployee?id=<%= emp.getId() %>">Edit</a>
            <a class="delete-button" href="deleteEmployee?id=<%= emp.getId() %>" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
        </td>
    </tr>
    <% } %>
</table>
</div>
</body>
</html>
