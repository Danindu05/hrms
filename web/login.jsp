<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HRMS - Login</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('images/lbg.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

       

        .login-container {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 50px 40px;
            width: 400px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
            border: 1px solid #e0e0e0;
        }

        .login-container h2 {
            margin-bottom: 25px;
            color: #333;
            font-size: 26px;
            font-weight: 600;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 14px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            font-size: 15px;
            color: #333;
        }

        .login-container input::placeholder {
            color: #999;
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: #2196f3;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container input[type="submit"]:hover {
            background-color: #1976d2;
        }

        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #666;
        }

        @media screen and (max-width: 450px) {
            .login-container {
                width: 90%;
                padding: 35px 25px;
            }
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Login</h2>
    <form action="login" method="post">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="submit" value="Login">
    </form>
    <div class="footer">
        &copy; 2025 HRMS
    </div>
</div>

</body>
</html>
