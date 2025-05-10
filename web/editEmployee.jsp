<%@page import="model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Employee employee = (Employee) request.getAttribute("employee");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f6f8; }
        form { width: 500px; background: white; padding: 30px; border-radius: 8px; }
        input[type="text"], select, input[type="submit"] {
            width: 100%; padding: 10px; margin-top: 10px;
            border: 1px solid #ccc; border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #3498db; color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<h1>Edit Employee</h1>

<form action="updateEmployee" method="post">
    <input type="hidden" name="id" value="<%= employee.getId() %>">
    <input type="text" name="name" value="<%= employee.getName() %>" required>
    <input type="text" name="job_role" value="<%= employee.getJobRole() %>" required>
    <input type="text" name="department" value="<%= employee.getDepartment() %>" required>
    <input type="text" name="address" value="<%= employee.getAddress() %>" required>
    <input type="text" name="contact_number" value="<%= employee.getContactNumber() %>" required>
    <input type="text" name="nic" value="<%= employee.getNic() %>" required>
    <input type="text" name="home_contact_number" value="<%= employee.getHomeContactNumber() %>" required>

    <!-- New: Image Selection -->
    <select name="img" required>
        <option value="">Select Image</option>
        <option value="boy.png" <%= "boy.png".equals(employee.getImg()) ? "selected" : "" %>>Boy</option>
        <option value="girl.png" <%= "girl.png".equals(employee.getImg()) ? "selected" : "" %>>Girl</option>
    </select>

    <input type="submit" value="Update Employee">
</form>

</body>
</html>
