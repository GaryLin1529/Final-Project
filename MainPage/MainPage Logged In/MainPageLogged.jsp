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
        <a href="MainPageLogged.jsp" class="logo"><img class="header-logo" src="image/logo.png"/></a>
        
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
                <button class="dropbtn">
                    書籍
                </button>
                <div class="dropdown_content">
                    <a href="#literature">文學書</a>
                    <a href="#Educational">工具書</a>
                </div>
            </div>
            <!--
            <input class="btnLogin-popup" type="button"  value="帳戶" onclick="location.href='username/username.html'"></button>
            -->

            <%
                String username = (String) session.getAttribute("username");
                if (username != null && !username.isEmpty()) {
                // 如果用戶已經登入，顯示歡迎信息和用戶名
            %>
                <input class="btnLogin-popup" type="button" value="歡迎, <%= username %>" onclick="location.href='username/username.html'"></button>
            <%
                } else {
                // 如果用戶未登入，顯示默認的按鈕文本
            %>
                <input class="btnLogin-popup" type="button" value="帳戶" onclick="location.href='login.html'"></button>
            <%
                }
            %>
        </nav>

        <script src="JS/header.js"></script>
    </header>
<!--資訊-->

<div class="home" id="home">
    <div class="home-content">
        <h1>黃金屋書店</h1>
        <h3>書中尋影 屋中尋歸</h3>
        <p>我們希望您能在書店裡找到心之所歸，在書中尋到伊人之影</p>
        <div class="btn-box">
            <a href="#team">了解我們</a>
            <a href="rating history/rating.html">給予評價</a>
        </div>
    </div>


    <!--滾動式廣告-->
    <div class="slideshow-container">
        <div class="singleslide fade">
            <a href="product details (logged in)/new details1/details17.html">
                <img src="image/new(1).jpg">
            </a>
                <div class="text">新品推出!!! 小王子</div>
        </div>

        <div class="singleslide fade">
            <a href="product details (logged in)/new details2/details18.html">
                <img src="image/new(2).jpg">
            </a>
            <div class="text">新品推出!!! 異鄉人(卡謬版書衣)</div>
        </div>

        <div class="singleslide fade">
            <a href="product details (logged in)/new detail3/details19.html">
                <img src="image/new(3).jpg">
            </a>
            <div class="text">新品推出!!! 深夜加油站遇見蘇格拉底</div>
        </div>
    
        <!--響應式按鈕-->
        <button class="prev" onclick="plusSlides(-1)">《</button>
        <button class="next" onclick="plusSlides(1)">》</button>

        <!--javascipt 引入-->
        <script src="JS/slideAD.js"></script>
    </div>
    </div>

<!--主商品頁-->
<div class="pro_content">
    <section class="product">
    <!--主商品頁(新品)-->
        <h2>-----新品上市!!!-----</h2>
        <p>資訊</p>
        <div class="pro_container">
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
                <a href="product details (logged in)/new details1/details17.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/new details2/details18.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/new detail3/details19.html"><i class="fas fa-shopping-cart cart"></i></a>
            </div>
        </div>

    <!--主商品頁(文學書籍)-->
    
        <h2 id="literature">-----文學類書籍-----</h2>
        <p>資訊</p>
        <div class="pro_container">
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
                <a href="product details (logged in)/literature details1/details7.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/literature details2/details8.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/literature details3/details9.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/literature details4/details10.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/literature details5/details11.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/literature details6/details12.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/literature details7/details15.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/literature details8/details16.html"><i class="fas fa-shopping-cart cart"></i></a>
            </div>
        </div>


    <!--主商品頁(工具類書籍)-->

        <h2 id="Educational">-----工具類書籍-----</h2>
        <p>資訊</p>
        <div class="pro_container">
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
                <a href="product details (logged in)/Educational details1/details1.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/Educational details2/details2.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/Educational details3/details3.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/Educational details4/details4.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/Educational details5/details5.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/Educational details6/details6.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/Educational details7/details13.html"><i class="fas fa-shopping-cart cart"></i></a>
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
                <a href="product details (logged in)/Educational details8/details14.html"><i class="fas fa-shopping-cart cart"></i></a>
            </div>
        </div>
    </section>
</div>
    <script src="JS/product.js"></script>

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
        <img src="image/Gary.jpg" height="100px" alt="">
        <div class="name">林彥儒</div>
        <div class="design">11144157</div>

        <div class="card_back">
            <div class="back_content">
                <img src="image/Gary.jpg" alt="">
                <h2>心得</h2>
                <p>網程我覺得算是我學過的語言裡最有心得的，因為可以馬上看到成果如何，而且很多動畫成功研究出來後看到它真的成功在動會很感動。
                    我能在其中找到樂趣還有一個原因要感謝前端的組員們，我們的分工模式跟定時一起上DC討論的時間讓我們的工作可以算是有條不紊地在進行，
                    研究出新功能的時候大家也都很開心，在其中我也學到了要善用各種資源，我以前覺得用ChatGPT會讓我太依賴它，但在這次專案中我卻發現善加利用
                    是可以從中學到很多東西的，還有網路中的大神或者生活裡的細節也都會給我設計網頁帶來很多新想法跟靈感，總之這次的專案我寫的蠻開心的。
                </p>
                <div class="social_media">
                    <a href="https://www.facebook.com/gary.lin.0925/?locale=zh_TW"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com/yr._.1529/"><i class="fab fa-instagram"></i></a>
                    <a href="https://github.com/GaryLin1529"><i class="fab fa-github"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!--吳宗儒-->

    <div class="teams">
        <img src="image/lulu.jpg" height="100px" alt="">
        <div class="name">吳宗儒</div>
        <div class="design">11144144</div>
        <div class="card_back">
            <div class="back_content">
                <img src="image/lulu.jpg" alt="">
                <h2>心得</h2>
                <p>藉由這次的專題製作讓我學到很多東西，因為有些東西我是從網路上學到的，讓我發現很多東西其實網路上有更好的做法。
                    還有一點是要善用AI，出現問題無法解決時去問問cahtgpt，他會有很大的機率可以知道你的錯誤在那裡，這算是我覺得可以快速Debug的方式之一。</p>
                <div class="social_media">
                    <a href="https://www.facebook.com/profile.php?id=100010789622587&locale=zh_TW"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com/rem_lulu0202/"><i class="fab fa-instagram"></i></a>
                    <a href="https://github.com/luluremwu"><i class="fab fa-github"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!--林孟威-->
    <div class="teams">
        <img src="image/william.jpg" height="100px" alt="">
        <div class="name">林孟威</div>
        <div class="design">11144175</div>

        <div class="card_back">
            <div class="back_content">
                <img src="image/william.jpg" alt="">
                <h2>心得</h2>
                <p>雖然我在前端群組裡面是唯一的外籍生，我覺得我們組合作得非常好。
                    其實我在線上開會中我沒有講很多話，我們還能一起解決問題，面對困難, 並每個人都完成了自己的工作。我對這次群組非常滿意。</p>
                <div class="social_media">
                    <a href="https://www.facebook.com/profile.php?id=100073395692358"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com/williamnthn/"><i class="fab fa-instagram"></i></a>
                    <a href="https://github.com/wewey20"><i class="fab fa-github"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!--陳昕妤-->
    <div class="teams">
        <img src="image/Mina.jpg" height="100px" alt="">
        <div class="name">陳昕妤</div>
        <div class="design"> 11144239</div>

        <div class="card_back">
            <div class="back_content">
                <img src="image/Mina.jpg" alt="">
                <h2>心得</h2>
                <p>這堂課對我來說是一堂很值得紀念的課程，因為除了吸收老師教的知識外也要有辦法實際上手操作，這對我來說非常不簡單，在和組員溝通的過程中發現，學習的領域不一樣在構通和合作上也會有理解落差。
                    和大家一起克服困難是一件很有成就感的事情，團隊的大家也變得對彼此更加熟悉，對專案的流程有了深刻的了解，意外的是我挺喜歡這種合作氛圍，或許我會繼續朝這個方向前進。</p>
                <div class="social_media">
                    <a href="https://www.facebook.com/profile.php?id=100043167039166&mibextid=ZbWKwL"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com/mina0127my?igsh=MTBsNjYwdnJrZ3d2MQ=="><i class="fab fa-instagram"></i></a>
                    <a href="https://github.com/miku0520925"><i class="fab fa-github"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!--潘秀玉-->
    <div class="teams">
        <img src="image/Nathania.jpg" height="100px" alt="">
        <div class="name">潘秀玉</div>
        <div class="design">11144275</div>

        <div class="card_back">
            <div class="back_content">
                <img src="image/Nathania.jpg" alt="">
                <h2>心得</h2>
                <p>這是我第一次做合作專案。我認為這確實是一個很大的挑戰，但儘管如此，我從這個專案中學到了很多東西，尤其是團隊合作。
                    我希望透過這次合作，我們能夠吸收經驗，在未來做得更好。 可以看看我們的網站喔！</p>
                <div class="social_media">
                    <a href="https://www.instagram.com/v.nathaniaindira_?igsh=ajdsdnkxdXRwOXp1"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.facebook.com/profile.php?id=100009703032840&mibextid=ZbWKwL"><i class="fab fa-instagram"></i></a>
                    <a href="https://github.com/nnatt0218"><i class="fab fa-github"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!--潘驄杰-->
    <div class="teams">
        <img src="image/Jay.png" height="100px" alt="">
        <div class="name">潘驄杰</div>
        <div class="design">11144209</div>

        <div class="card_back">
            <div class="back_content">
                <img src="image/Jay.png" alt="">
                <h2>心得</h2>
                <p>網程專案是對我們而言是一個挑戰，因為要完成一個專案，除了專業能力之外，更要進行團隊管理、專案進度管理、前後端協作方法等等的難題。
                    而我相信，我們藉由走完這些刻苦的路之後，會更有專案製作、協作經驗，進而後續可以挑戰更大的項目，或者成為後續的養分！使專案製作不再成為百般困難的難事，可以成為一種喜歡的工作！</p>
                <div class="social_media">
                    <a href="https://www.facebook.com/profile.php?id=100010854546067"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com/jaypan1206/"><i class="fab fa-instagram"></i></a>
                    <a href="https://github.com/Pan8732965"><i class="fab fa-github"></i></a>
                </div>
            </div>
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
</body>
</html> 