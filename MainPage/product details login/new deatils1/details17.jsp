<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>書籍簡介</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/details.css">
</head>
<body>
    <link rel="stylesheet" href="css/MainPage.css">
    <header class="header">
        <!--按Logo回主頁-->
        <a href="../../MainPage.html" class="logo"><img class="header-logo" src="img/logo.png"/></a>
        
        <!--搜尋欄-->
        <div class="SearchBar_container">
            <form action="" class="SearchBar">
                <input type="text" placeholder="搜尋..." name="question">
                <button type="submit"><img src="img/search.png"></button>
            </form>
        </div>

        <nav class="navbar">
            <a href="../../MainPage.html">主頁面</a>
            <a href="../../Shopping Interface/ShoppingInterface.html">購物車</a>
            <button class="btnLogin-popup">登入</button>
        </nav>

        <script src="js/header.js"></script>
    </header>

<!--Login畫面-->
<link rel="stylesheet" href="css/Login.css">
<div class="wrapper1">
    <span class="icon-close">
        <ion-icon name="close"></ion-icon>
    </span>

    <div class="form-box login">
        <h2>登入</h2>
        <form action="#">
            <div class="input-box">
                <span class="icon"><ion-icon name="mail"></ion-icon></span>
                <input type="email" onfocus="this.style.color='#ffff'" required>
                <label>帳號(email)</label>
            </div> 
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <input type="password" onfocus="this.style.color='#ffff'" required>
                <label>密碼</label>
            </div>  
            <div class="remeber-forget">
                <label><input type="checkbox">記住我的帳密</label>
                <a href="#">忘記密碼</a>
            </div>
            <input class="btn" type="submit"  value="登入" onclick="location.href='../../../MainPage Logged in/MainPage.html'"></button>
            <div class="login-register">
                <p>沒有帳號?&nbsp;<a href="#" class="register-link">註冊</a></p>
            </div>
        </form>
    </div>

    <div class="form-box register">
        <h2>註冊</h2>
        <form action="#">
            <div class="input-box">
                <span class="icon"><ion-icon name="person"></ion-icon></span>
                <input type="text" onfocus="this.style.color='#ffff'" required>
                <label>使用者名稱</label>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="mail"></ion-icon></span>
                <input type="email" onfocus="this.style.color='#ffff'" required>
                <label>帳號(Email)</label>
            </div> 
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <input type="password" onfocus="this.style.color='#ffff'" required>
                <label>密碼</label>
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

<script src="js/Login.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <!--商品頁面-->
<section id="prodetails" class="section-p1">
    <div class="single-pro-image">
        <img src="img/Le Petit Prince.jpg" width="100%" id="MainImg" style="border-radius: 10px;" alt="">
    </div>

    <div class="single-pro-details">
        <h2>小王子</h2>
        <h3>$173</h3>
        <input type="number" min="0" value="1"> 
        <button class="normal" onclick="alert('已加入購物車')">加入購物車</button>
        <h5>庫存量 :</h5>
        <h4>產品詳情 </h4>
        <span>
            作者:<br>
            譯者:<br>
             
            語言:中文<br>
             
             供應商(出版社):<br>
        </span>
    </div>
</section>

<div class="wrapper">
    <h3>請留下您寶貴的評論</h3>
    <form action="#" id="commentForm">
        <div class="rating" id="starRating">
            <input type="number" name="rating" hidden>
            <i class='bx bx-star star' style="--i: 0;"></i>
            <i class='bx bx-star star' style="--i: 1;"></i>
            <i class='bx bx-star star' style="--i: 2;"></i>
            <i class='bx bx-star star' style="--i: 3;"></i>
            <i class='bx bx-star star' style="--i: 4;"></i>
        </div>
        <textarea name="name" id="userName" cols="30" rows="1" placeholder="使用者名稱"></textarea>
        <textarea name="opinion" id="userOpinion" cols="30" rows="7" placeholder="輸入您的意見"></textarea>
        <div class="btn-group">
            <button type="button" class="btn submit" onclick="submitComment()">送出</button>
        </div>
    </form>
</div>
<div class="wrapper">
<h3>歷史評論</h3>
<div class="history" id="commentHistory">
    <!-- 歷史紀錄將顯示在這裡 -->
</div>
</div>
</div>
     <script src="js/details.js"></script>
     <script src="js/history.js"></script>
</body>
</html>