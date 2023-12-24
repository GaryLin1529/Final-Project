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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
    <title>黃金屋書店</title>
    <link rel="stylesheet" href="MainPage.css">
    <style>
        @import url("slideAD.css");
    </style>
    <link rel="stylesheet" href="products.css">
    <link rel="stylesheet" href="AboutUs.css">

    <style> 
        h3 { 
            text-align: center;
        }
    </style>
    <script>
        function showResult(message) {
            document.getElementById("loginResult").innerHTML = message;
        }
    </script>
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
                <a href="#literature">文學書</a>
                <a href="#Educational">工具書</a>
                <button class="btnLogin-popup">登入</button>
        </nav>

        <script src="header.js"></script>
    </header>

<!--Login畫面-->
<link rel="stylesheet" href="Login.css">
<div class="wrapper">
    <span class="icon-close">
        <ion-icon name="close"></ion-icon>
    </span>

    <div class="form-box login">
        <h2>登入</h2> 
        <form action="LoginSQL.jsp" method="post"> <!-- 將資料引導到 LoginSQL.jsp 做回覆 -->
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
        <form action="RegisterSQL.jsp"> <!-- 將資料引導到 RegisterSQL.jsp 做回覆 -->
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

<script src="Login.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>



<!--資訊-->

<div class="home" id="home">
    <div class="home-content">
        <h1>黃金屋書店</h1>
        <h3>書中尋影 屋中尋歸</h3>
        <p>我們希望您能在書店裡找到心之所歸，在書中尋到伊人之影</p>
        <div class="btn-box">
            <a href="#team">了解我們</a>
            <a href="#rating">給予評價</a>
        </div>
    </div>

    <div class="home-sci">
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
    </div>

        <!--滾動式廣告-->
<div class="slideshow-container">
    <div class="singleslide fade">
        <img     
        src="image/new(1).jpg"
        style="width: 100%;"
        />
        <div class="text">新品推出!!! 小王子</div>
    </div>

    <div class="singleslide fade">
        <img
        src="image/new(2).jpg"
        style="width: 100%;"
        />
        <div class="text">新品推出!!! 異鄉人(卡謬版書衣)</div>
    </div>

    <div class="singleslide fade">
        <img
        src="image/new(3).jpg"
        style="width: 100%;"
        />
        <div class="text">新品推出!!! 深夜加油站遇見蘇格拉底</div>
    </div>
    
    <!--響應式按鈕-->
    <button class="prev" onclick="plusSlides(-1)">《</button>
    <button class="next" onclick="plusSlides(1)">》</button>

    <!--javascipt 引入-->
    <script src="slideAD.js"></script>
</div>
</div>

<!--主商品頁-->
<section class="product">
<!--主商品頁(新品)-->
    <h2>-----新品上市!!!-----</h2>
    <p>資訊</p>
    <div class="pro-container">
    <!--商品第一列-->
        <!-- 商品1 -->
        <div class="pro">
            <img src="image/new(1).jpg" alt="">
            <div class="des">
                <h5>小王子</h5>
                <span>Antoine de Saint-Exupery</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$173</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品2 -->
        <div class="pro">
            <img src="image/new(2).jpg" alt="">
            <div class="des">
                <h5>異鄉人</h5>
                <span>Albert Camus</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$173</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品3 -->
        <div class="pro">
            <img src="image/new(3).jpg" alt="">
            <div class="des">
                <h5>深夜加油站遇見蘇格拉底</h5>
                <span>Dan Millman</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$234</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

<!--主商品頁(文學書籍)-->
<section class="product">
    <h2 id="literature">-----文學類書籍-----</h2>
    <p>資訊</p>
    <div class="pro-container">
    <!--商品第一列-->
        <!-- 商品1 -->
        <div class="pro">
            <img src="image/literature books(1).jpg" alt="">
            <div class="des">
                <h5>52赫茲的鯨魚們</h5>
                <span>町田苑香</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$300</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品2 -->
        <div class="pro">
            <img src="image/literature books(2).jpg" alt="">
            <div class="des">
                <h5>海風酒店</h5>
                <span>吳明益</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$420</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品3 -->
        <div class="pro">
            <img src="image/literature books(3).jpg" alt="">
            <div class="des">
                <h5>那些少女沒有抵達</h5>
                <span>吳曉樂</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$355</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品4 -->
        <div class="pro">
            <img src="image/literature books(4).jpg" alt="">
            <div class="des">
                <h5>秘密</h5>
                <span>東野圭吾</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$355</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

    <!--商品第二列-->
        <!-- 商品5 -->
        <div class="pro">
            <img src="image/literature books(5).jpg" alt="">
            <div class="des">
                <h5>歪笑小說</h5>
                <span>東野圭吾</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$237</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品6 -->
        <div class="pro">
            <img src="image/literature books(6).jpg" alt="">
            <div class="des">
                <h5>我的文青時代</h5>
                <span>蔣勳</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$300</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品7 -->
        <div class="pro">
            <img src="image/literature books(7).jpg" alt="">
            <div class="des">
                <h5>冬泳</h5>
                <span>班宇</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$316</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品8 -->
        <div class="pro">
            <img src="image/literature books(8).jpg" alt="">
            <div class="des">
                <h5>春日遲</h5>
                <span>凜之</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$180</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>
    </div>
</div>
</section>

<!--主商品頁(工具類書籍)-->
<section class="product">
    <h2 id="Educational">-----工具類書籍-----</h2>
    <p>資訊</p>
    <div class="pro-container">
    <!--商品第一列-->
        <!-- 商品1 -->
        <div class="pro">
            <img src="image/Educational Books(1).jpg" alt="">
            <div class="des">
                <h5>HTML&CSS網站設計建置優化之道</h5>
                <span>Jon Duckett</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$458</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品2 -->
        <div class="pro">
            <img src="image/Educational Books(2).jpg" alt="">
            <div class="des">
                <h5>網頁美編的救星！零基礎也能看得懂的 HTML & CSS 網頁設計</h5>
                <span>Mana</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$434</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品3 -->
        <div class="pro">
            <img src="image/Educational Books(3).jpg" alt="">
            <div class="des">
                <h5>小水豚教你做網站!輕鬆學好HTML/CSS網頁設計</h5>
                <span> Capybara Design,竹内直人,竹内瑠美</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$458</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品4 -->
        <div class="pro">
            <img src="image/Educational Books(4).jpg" alt="">
            <div class="des">
                <h5>Servlet&JSP技術手冊:邁向Spring Boot(第二版)</h5>
                <span>adidas</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$489</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

    <!--商品第二列-->
        <!-- 商品5 -->
        <div class="pro">
            <img src="image/Educational Books(5).jpg" alt="">
            <div class="des">
                <h5>JSP 2.3動態網頁技術（第六版</h5>
                <span>榮欽科技,呂文達</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$325</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品6 -->
        <div class="pro">
            <img src="image/Educational Books(6).jpg" alt="">
            <div class="des">
                <h5>JSP程式設計領航寶典</h5>
                <span>普悠瑪數位科技</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$371</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品7 -->
        <div class="pro">
            <img src="image/Educational Books(7).jpg" alt="">
            <div class="des">
                <h5>你所不知道的必學前端Debug技巧:即學即用!讓你Debug不求人</h5>
                <span>楊楚玄</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$489</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>

        <!-- 商品8 -->
        <div class="pro">
            <img src="image/Educational Books(8).jpg" alt="">
            <div class="des">
                <h5>瘋狂前端開發講義:jQuery+AngularJS+Bootstrap前端開發實戰</h5>
                <span>李剛</span>
                <div class="star">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <h4>$474</h4>
            </div>
            <a href="#"><i class="fas fa-shopping-cart cart"></i></a>
        </div>
    </div>
</div>
</section>

<footer>
    <!--團隊介紹-->
    
    <div class="Us_container">
        <div class="Us_header">
            <h1 id="team">我們的團隊</h1>
        </div>
    </div>
    <div class="sub_container">
        <!--林彥儒-->
        <div class="teams">
            <img src="image/test.png" height="100px" alt="">
            <div class="name">Esmay Stace</div>
            <div class="design">Developer</div>
            <div class="about">Lorem ipsum dolor sit amet.</div>

            <div class="card-back">
                <div class="back-content">
                    <h2>背面標題</h2>
                    <p>在這裡寫下你想說的內容。</p>
                </div>
            </div>
            
            <div class="social_media">
                <a href="https://www.facebook.com/gary.lin.0925/?locale=zh_TW"><i class="fab fa-facebook"></i></a>
                <a href="https://www.instagram.com/yr._.1529/"><i class="fab fa-instagram"></i></a>
                <a href="https://github.com/GaryLin1529"><i class="fab fa-github"></i></a>
            </div>
        </div>

        <!---->

        <div class="teams">
            <img src="image/test.png" height="100px" alt="">
            <div class="name">Esmay Stace</div>
            <div class="design">Developer</div>
            <div class="about">Lorem ipsum dolor sit amet.</div>
            
            <div class="social_media">
                <a href="https://www.facebook.com/gary.lin.0925/?locale=zh_TW"><i class="fab fa-facebook"></i></a>
                <a href="https://www.instagram.com/yr._.1529/"><i class="fab fa-instagram"></i></a>
                <a href="https://github.com/GaryLin1529"><i class="fab fa-github"></i></a>
            </div>
        </div>

        <div class="teams">
            <img src="image/test.png" height="100px" alt="">
            <div class="name">Esmay Stace</div>
            <div class="design">Developer</div>
            <div class="about">Lorem ipsum dolor sit amet.</div>
            
            <div class="social_media">
                <a href="https://www.facebook.com/gary.lin.0925/?locale=zh_TW"><i class="fab fa-facebook"></i></a>
                <a href="https://www.instagram.com/yr._.1529/"><i class="fab fa-instagram"></i></a>
                <a href="https://github.com/GaryLin1529"><i class="fab fa-github"></i></a>
            </div>
        </div>
    </div>
</footer>

<!-- 訪客人數計算 --> 
<div class="people"> 

    <%
        int counter;

        // Check whether counter exists. If not, initialize to 1000
        if (application.getAttribute("counter") == null) {
            application.setAttribute("counter", "1000");
        }

        String strNo = (String)application.getAttribute("counter");

        // Exception Event  
        try {
            counter = Integer.parseInt(strNo); // Transfer string to int
        } catch (NumberFormatException e) {
            // The condition of the first time visit or other condition happened to initialize
            counter = 0;
        }

        //Check if the session existed and is new or not.
        if (session != null && session.isNew()) { 
            counter++;
        }

        strNo = String.valueOf(counter); // Transfer int to string
        application.setAttribute("counter", strNo); // sent back the counter value to the first code
    %>
        <h3 class="center-text">您是第 <%= counter %> 位訪客</h3>
        
</div>

<!-- 資料庫連結 - 會員部分 -->

<!--
<%
    try {
        // 載入資料庫驅動程式
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 資料庫連接URL
        String url = "jdbc:mysql://localhost:3306/transactionthing";
        String username = "root";
        String password = "8970";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            // 建立Statement對象
            try (Statement stmt = conn.createStatement()) {
                // 執行SQL查詢
                String sql = "SELECT * FROM membership";
                try (ResultSet rs = stmt.executeQuery(sql)) {

                    // 列印查詢結果
                    out.println("<h2>Book List:</h2>");
                    out.println("<table border='1'>");
                    out.println("<tr><th>ID</th><th>Title</th><th>Author</th><th>Price</th></tr>");

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("id") + "</td>");
                        out.println("<td>" + rs.getString("title") + "</td>");
                        out.println("<td>" + rs.getString("author") + "</td>");
                        out.println("<td>" + rs.getDouble("price") + "</td>");
                        out.println("</tr>");
                    }

                    out.println("</table>");
                }
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    } catch (ClassNotFoundException e) {
        out.println("class錯誤" + e.toString());
    }
%>
-->

</body>
</html> 