<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
    <title>黃金屋書店</title>
    <link rel="stylesheet" href="CSS/MainPage.css">
    <style>
        @import url("CSS/slideAD.css");
    </style>
    <link rel="stylesheet" href="CSS/products.css">
    <link rel="stylesheet" href="CSS/AboutUs.css">
</head>
<body>
    <!--前導主頁-->
    <header class="header">
        <!--按Logo回主頁-->
        <a href="MainPage.html" class="logo"><img class="header-logo" src="image/logo.png"/></a>
        
        <!--搜尋欄-->
        <div class="SearchBar_container">
            <form action="" class="SearchBar">
                <input type="text" placeholder="搜尋..." name="question">
                <button type="submit"><img src="image/search.png"></button>
            </form>
        </div>

        <nav class="navbar">
            <a href="#home" class="active">主頁面</a>
            <a href="Shopping Interface/ShoppingInterface.html">購物車</a>
            <div class="dropdown">
                <button class="dropbtn">書籍</button>
                <div class="dropdown_content">
                    <a href="#literature">文學書</a>
                    <a href="#Educational">工具書</a>
                </div>
            </div>
            <button class="btnLogin-popup">登入</button>
        </nav>

        <script src="JavaScript/header.js"></script>
    </header>

    <!--Login畫面-->
    <link rel="stylesheet" href="CSS/Login.css">
    <div class="wrapper">
        <span class="icon-close">
            <ion-icon name="close"></ion-icon>
        </span>

        <div class="form-box login">
            <h2>登入</h2>
            <form action="LoginSQL.jsp" method="post">
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail"></ion-icon></span>
                    <input type="email" id="email" name="email" onfocus="this.style.color='#ffff'" required>
                    <label>帳號(email)</label>
                </div> 
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" id="password" name="password" onfocus="this.style.color='#ffff'" required>
                    <label>密碼</label>
                </div>  
                <div class="remeber-forget">
                    <label><input type="checkbox">記住我的帳密</label>
                    <a href="#">忘記密碼</a>
                </div>
                <button type="submit" class="btn">登入</button>
                <div class="login-register">
                    <p>沒有帳號?&nbsp;<a href="#" class="register-link">註冊</a></p>
                </div>
            </form>
        </div>

        <div class="form-box register">
            <h2>註冊</h2>
            <form action="RegisterSQL.jsp">
                <div class="input-box">
                    <span class="icon"><ion-icon name="username"></ion-icon></span>
                    <input type="text" id="username" name="username" onfocus="this.style.color='#ffff'" required>
                    <label>使用者名稱</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="email"></ion-icon></span>
                    <input type="email" id="email" name="email" onfocus="this.style.color='#ffff'" required>
                    <label>帳號(Email)</label>
                </div> 
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" id="password" name="password" onfocus="this.style.color='#ffff'" required>
                    <label>密碼</label>
                </div>  
                <div class="input-box">
                    <span class="icon"><ion-icon name="phoneNumber"></ion-icon></span>
                    <input type="text" id="phoneNumber" name="phoneNumber" onfocus="this.style.color='#ffff'" required>
                    <label>手機號碼</label>
                </div> 
                <div class="remeber-forget">
                    <label><input type="checkbox">我同意隱私條款</label>
                </div>
                <button type="submit" class="btn">註冊</button>
                <div class="login-register">
                    <p>已經擁有帳號了?&nbsp;<a href="#" class="login-link">登入</a></p>
                </div>
            </form>
        </div>
    </div>

    <script src="JavaScript/Login.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <!-- 主頁面內容 (這裡可以插入HTML版本的主頁面內容) -->
    <!-- ... 略 ... -->

    <!-- 訪客計數器 (JSP代碼) -->
    <div class="people">
        <%
            int counter;
            if (application.getAttribute("counter") == null) {
                application.setAttribute("counter", "1000");
            }
            String strNo = (String)application.getAttribute("counter");
            try {
                counter = Integer.parseInt(strNo);
            } catch (NumberFormatException e) {
                counter = 0;
            }
            if (session != null && session.isNew()) {
                counter++;
            }
            strNo = String.valueOf(counter);
            application.setAttribute("counter", strNo);
        %>
        <h3 class="center-text">您是第 <%= counter %> 位訪客</h3>
    </div>

    <!-- 頁腳 (HTML代碼) -->
    <!-- ... 略 ... -->

    <!-- 頁面的JavaScript (如有需要) -->
    <script src="JavaScript/header.js"></script>
    <script src="JavaScript/product.js"></script>
</body>
</html>
