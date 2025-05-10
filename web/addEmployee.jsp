<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Employee</title>
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

<h1>Add New Employee</h1>

<form action="insertEmployee" method="post">
    <input type="text" name="name" placeholder="Name" required>
    <input type="text" name="job_role" placeholder="Job Role" required>
    <input type="text" name="department" placeholder="Department" required>
    <input type="text" name="address" placeholder="Address" required>
    <input type="text" name="contact_number" placeholder="Contact Number" required>
    <input type="text" name="nic" placeholder="NIC" required>
    <input type="text" name="home_contact_number" placeholder="Home Contact Number" required>

    <!-- New Image Selection -->
    <select name="img" required>
        <option value="">Select Image</option>
        <option value="boy.png">Boy</option>
        <option value="girl.png">Girl</option>
    </select>

    <input type="submit" value="Save Employee">
</form>

</body>
</html>
