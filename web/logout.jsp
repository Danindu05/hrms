<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logged Out - HRMS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .logout-container {
            background: white;
            padding: 40px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 320px;
            text-align: center;
        }
        .logout-container h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .logout-container p {
            color: #666;
            margin-bottom: 30px;
        }
        .logout-container a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s ease;
        }
        .logout-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="logout-container">
    <h2>You have been logged out</h2>
    <p>Thank you for using HRMS.</p>
    <a href="login.jsp">Login Again</a>
</div>

</body>
</html>
