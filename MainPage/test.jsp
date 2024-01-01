<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="CSS/Login.css">
    <script src="https://kit.fontawesome.com/your-fontawesome-kit-code.js" crossorigin="anonymous"></script>
    <!-- 添加更多的 CSS 和 JavaScript 如有需要 -->
</head>
<body>
    <!-- 第一個登入按鈕 -->
    <button onclick="location.href='#loginForm'" class="btnLogin-popup">登入</button>

    <!-- 第二個購物車登入按鈕 -->
    <a href="#loginForm" id="cartLoginBtn"><i class="fas fa-shopping-cart cart"></i></a>

    <!-- 其他頁面內容 -->

    <!-- 登入表單區域 -->
    <div id="loginForm">
        <div class="wrapper">
            <span class="icon-close">
                <ion-icon name="close"></ion-icon>
            </span>

            <%-- 登入表單和伺服器端代碼 --%>
            <form method="post"> <!-- 假設處理登入的後端邏輯 -->
                <h2>登入</h2>
                <div class="input-box">
                    <input type="email" name="email" required>
                    <label>帳號(email)</label>
                </div>
                <div class="input-box">
                    <input type="password" name="password" required>
                    <label>密碼</label>
                </div>
                <input type="submit" value="登入">
            </form>
        </div>
    </div>

    <!-- 更多頁面內容 -->

</body>
</html>
