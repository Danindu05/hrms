<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Employee</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/addemployee.css">

   
</head>
<body>

<div class="form-container">
    <h1><i class="fa-solid fa-user-plus"></i> Add New Employee</h1>

    <form action="insertEmployee" method="post">
        <input type="text" name="name" placeholder="Name" required>
        <input type="text" name="job_role" placeholder="Job Role" required>
        <input type="text" name="department" placeholder="Department" required>
        <input type="text" name="address" placeholder="Address" required>
        <input type="text" name="contact_number" placeholder="Contact Number" required>
        <input type="text" name="nic" placeholder="NIC" required>
        <input type="text" name="home_contact_number" placeholder="Home Contact Number" required>

        <select name="img" required>
            <option value="" disabled selected>Select Image</option>
            <option value="boy.png">Boy</option>
            <option value="girl.png">Girl</option>
        </select>

        <input type="submit" value="Save Employee">
    </form>
</div>

</body>
</html>
