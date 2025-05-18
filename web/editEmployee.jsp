<%@page import="model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Employee employee = (Employee) request.getAttribute("employee");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="css/editemployee.css">
     
</head>
<body>

<div class="edit-form-container">
    <h1><i class="fa-solid fa-user-pen"></i> Edit Employee</h1>

    <form action="updateEmployee" method="post">
        <input type="hidden" name="id" value="<%= employee.getId() %>">
        <input type="text" name="name" value="<%= employee.getName() %>" placeholder="Name" required>
        <input type="text" name="job_role" value="<%= employee.getJobRole() %>" placeholder="Job Role" required>
        <input type="text" name="department" value="<%= employee.getDepartment() %>" placeholder="Department" required>
        <input type="text" name="address" value="<%= employee.getAddress() %>" placeholder="Address" required>
        <input type="text" name="contact_number" value="<%= employee.getContactNumber() %>" placeholder="Contact Number" required>
        <input type="text" name="nic" value="<%= employee.getNic() %>" placeholder="NIC" required>
        <input type="text" name="home_contact_number" value="<%= employee.getHomeContactNumber() %>" placeholder="Home Contact Number" required>

        <select name="img" required>
            <option value="" disabled selected>Select Image</option>
            <option value="boy.png" <%= "boy.png".equals(employee.getImg()) ? "selected" : "" %>>Boy</option>
            <option value="girl.png" <%= "girl.png".equals(employee.getImg()) ? "selected" : "" %>>Girl</option>
        </select>

        <input type="submit" value="Update Employee">
    </form>
</div>

</body>
</html>
