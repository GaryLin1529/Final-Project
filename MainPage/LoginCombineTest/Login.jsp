<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function showResult(message) {
            document.getElementById("loginResult").innerHTML = message;
        }
    </script>
</head>
<body>

<div class="login-container">
    <h2>Login</h2>
    <form id="loginForm" onsubmit="return login()">
        <div class="form-group">
            <label for="email">帳號(email):</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">密碼:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">登入</button>
    </form>
    <div id="loginResult"></div>
</div>

<script>
    function login() {
        var form = document.getElementById("loginForm");
        var email = form.email.value;
        var password = form.password.value;

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                showResult(xhr.responseText);
            }
        };

        xhr.open("POST", "LoginSQL.jsp", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("email=" + email + "&password=" + password);

        return false; // 防止表單提交
    }
</script>

</body>
</html>
