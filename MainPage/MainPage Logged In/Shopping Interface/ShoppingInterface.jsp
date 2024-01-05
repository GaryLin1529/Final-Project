<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>黃金屋-購物車</title>
    <link rel="stylesheet" href="css/ShoppingInterface.css">
    <link rel="stylesheet" href="js/ShoppingInterface.js">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="js/header.js">
</head>
<body>
    <!--前導主頁-->
    <header class="header">
        <!--按Logo回主頁-->
        <a href="../MainPageLogged.jsp" class="logo"><img class="header-logo" src="image/logo.png"/></a>
        
        <!--搜尋欄-->
        <div class="SearchBar_container">
            <form action="" class="SearchBar">
                <input type="text" placeholder="搜尋..." name="question">
                <button type="submit"><img src="image/search.png"></button>
            </form>
        </div>

        <nav class="navbar">
                <a href="../MainPage.html">主頁面</a>
                <a href="../history/history.html">歷史資料查詢</a>
                <input class="btnLogin-popup" type="button"  value="帳戶" onclick="location.href='../username/username.html'"></button>
        </nav>

        <script src="js/header.js"></script>
    </header>



<!--購物車&結帳頁面-->
<div class="contanier">
    <div class="checkoutLayout">
        <div class="returnCart">
            <h1>我的購物車</h1>
            <div class="list">

                <!-- 商品1 -->
                <div class="item">
                    <img src="image/new(1).jpg" alt="">
                    <div class="info">
                        <div class="name">小王子</div>
                        <div class="price">$173/1</div>
                    </div>
                    <div class="quantity">1</div>
                    <div class="returnPrice">$173</div>
                </div>

                <!-- 商品2 -->
                <div class="item">
                    <img src="image/new(2).jpg" alt="">
                    <div class="info">
                        <div class="name">異鄉人</div>
                        <div class="price">$173/1</div>
                    </div>
                    <div class="quantity">1</div>
                    <div class="returnPrice">$173</div>
                </div>

                <!-- 商品3 -->
                <div class="item">
                    <img src="image/new(3).jpg" alt="">
                    <div class="info">
                        <div class="name">深夜加油站遇見蘇格拉底</div>
                        <div class="price">$234/1</div>
                    </div>
                    <div class="quantity">1</div>
                    <div class="returnPrice">$234</div>
                </div>
            
            </div>
        </div>

        <div class="right">
            <h1>結帳</h1>
            <div class="form">
                <div class="group">
                    <label for="">姓名</label>
                    <input type="text" name="" id="">
                </div>
                <div class="group">
                    <label for="">手機號碼</label>
                    <input type="text" name="" id="">
                </div>
                <div class="group">
                    <label for="">地址</label>
                    <input type="text" name="" id="">
                </div>
                <div class="group">
                    <label for="">國家</label>
                    <select type="text" name="" id="">
                        <option value="">選擇...</option>
                        <option value="london">台灣</option>
                        <option value="london">USA</option>
                    </select>
                </div>
                <div class="group">
                    <label for="">城市</label>
                    <select type="text" name="" id="">
                        <option value="">選擇...</option>
                        <option value="london">台北</option>
                        <option value="london">london</option>
                    </select>
                </div>
            </div>
            <div class="return">
                <div class="row">
                    <div>總數量 :</div>
                    <div class="totalQuanlity">1</div>
                </div>
                <div class="row">
                    <div>總金額 :</div>
                    <div class="totalPrice">$173</div>
                </div>
            </div>
            <button class="buttonCheckout">
                確認結帳
            </button>
        </div>
    </div>
</div>

</body>
</html>