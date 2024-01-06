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
        <a href="MainPage.jsp" class="logo"><img class="header-logo" src="image/logo.png"/></a>
        
        <!--搜尋欄-->
        <div class="SearchBar_container">
            <form action="MainPage Logged In/BookDetails(Logged In)/Search.jsp" class="SearchBar">
                <input type="text" placeholder="搜尋..." name="question">
                <button type="submit"><img src="image/search.png"></button>
            </form>
        </div>

        <nav class="navbar">
                <a href="MainPage.jsp" class="active"\>主頁面</a>
                <a href="javascript:alert('🔔 請登入會員後再行購買！🔔')">購物車</a>
                
        <div class="dropdown">
            <button class="dropbtn">
                書籍
            </button>
            <div class="dropdown_content">
                    <a href="#literature">文學書</a>
                    <a href="#Educational">工具書</a>
            </div>
        </div>
                <!-- 原初登入按紐 -->
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

        <!-- 登入流程 -->
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String LoginMessage = null;
            boolean isInLoggedIn = false; // 確認登入成功與否狀態
            

            if (email != null && password != null && !email.trim().isEmpty() && !password.trim().isEmpty()) {
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/transactionthing";
                    String dbUsername = "root";
                    String dbPassword = "8970";

                    conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                    String sql = "SELECT * FROM membership WHERE MemberAccount = ? AND MemberPassword = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, email);
                    pstmt.setString(2, password);

                    rs = pstmt.executeQuery();
                    

                    if (rs.next()) {

                        isInLoggedIn = true;

                        String memberName = rs.getString("MemberName");
                        session.setAttribute("username", rs.getString("MemberName"));
                        LoginMessage = "登入成功 歡迎：" + memberName;
                        response.sendRedirect("MainPage Logged In/MainPageLogged.jsp");
                        return;
                    } else {
                        LoginMessage = "帳號或密碼錯誤，請重新輸入！";
                        
                    }
                } catch (Exception e) {
                    LoginMessage = "資料庫連接失敗：" + e.getMessage();
                } finally {
                    if (rs != null) try { rs.close(); } catch(SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
                    if (conn != null) try { conn.close(); } catch(SQLException e) {}
                }
            }
%>

    <% if (!isInLoggedIn) { %>
            <div class="form-box login">
                <h2>登入</h2>
                <form method="post"> <!-- 使用POST方法提交到當前頁面 -->
                    <div class="input-box">
                        <span class="icon"><ion-icon name="mail"></ion-icon></span>
                        <input type="email" name="email" onfocus="this.style.color='#ffff'" required>
                        <label>帳號(email)</label>
                    </div> 
                    <div class="input-box">
                        <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                        <input type="password" name="password" onfocus="this.style.color='#ffff'" required>
                        <label>密碼</label>
                    </div>  
                    <div class="remeber-forget">
                        <label><input type="checkbox">記住我的帳密</label>
                        <a href="#">忘記密碼</a>
                    </div>
                    <input class="btn" type="submit" value="登入">
                    <div class="login-register">
                        <p>沒有帳號?&nbsp;<a href="#" class="register-link">註冊</a></p>
                    </div>
                </form>
            </div>
    <% } %>

    <% if (LoginMessage != null && !LoginMessage.isEmpty() && isInLoggedIn == true) { %>
        <script type="text/javascript">
            alert('<%= LoginMessage %>'); // 顯示訊息
        </script>
    <% } %>


    <!-- 註冊流程 -->
    <%
    String RegisterUsername = request.getParameter("username");
    String RegisterEmail = request.getParameter("email");
    String RegisterPassword = request.getParameter("password");
    //String RegisterPhoneNumber = request.getParameter("phoneNumber"); // 先保留註冊手機用的code，保未來可用到
    String RegisterMessage = "";
    boolean isInRegister = false; 

    if (RegisterUsername != null && RegisterEmail != null && RegisterPassword != null ) { //&& RegisterPhoneNumber != null
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmtSelect = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/transactionthing";
            String dbUsername = "root";
            String dbPassword = "8970";

            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            String sql = "INSERT INTO membership (MemberName, MemberAccount, MemberPassword) VALUES (?, ?, ?)"; // , MemberPhone
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, RegisterUsername);
            pstmt.setString(2, RegisterEmail);
            pstmt.setString(3, RegisterPassword);
            //pstmt.setString(4, RegisterPhoneNumber);

            int rowsAffected = pstmt.executeUpdate();

            isInRegister = true;

            if (rowsAffected > 0) {
                RegisterMessage = "註冊成功，歡迎 " + RegisterUsername + "!" + "請重新登入";
            } else {
                RegisterMessage = "註冊失敗，請檢查資料是否正確！";
            }
        } catch (Exception e) {
            RegisterMessage = "Error: " + e.getMessage();
        } finally {
            if (pstmt != null) pstmt.close();
            if (pstmtSelect != null) pstmtSelect.close();
            if (rs != null) rs.close();
            if (conn != null) conn.close();
        }
    }
    %>

    <div class="form-box register">
        <h2>註冊</h2>
        <form action="MainPage.jsp">
            <div class="input-box">
                <span class="icon"><ion-icon name="person"></ion-icon></span>
                <input type="text" id="username" name="username" onfocus="this.style.color='#ffff'" required>
                <label>使用者名稱</label>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="mail"></ion-icon></span>
                <input type="email" id="email" name="email" onfocus="this.style.color='#ffff'" required>
                <label>帳號(Email)</label>
            </div> 
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <input type="password" id="password" name="password" onfocus="this.style.color='#ffff'" required>
                <label>密碼</label>
            </div>
            <!--
            <div class="input-box">
                <span class="icon"><ion-icon name="phoneNumber"></ion-icon></span>
                <input type="text" id="phoneNumber" name="phoneNumber" onfocus="this.style.color='#ffff'" required>
                <label>手機號碼</label>
            </div> 
            -->   
            <div class="remeber-forget">
                <label><input type="checkbox">我同意隱私條款</label>
            </div>
            <button type="submit" class="btn">註冊</button>
            <div class="login-register">
                <p>已經擁有帳號了?&nbsp;<a href="#" class="login-link">登入</a></p>
            </div>
        </form>
        <% if (RegisterMessage != null && !RegisterMessage.isEmpty() && isInRegister == true) { %>
        <p><script type="text/javascript">
                alert('<%= RegisterMessage %>'); // 在頁面加載時顯示彈出消息
            </script>
        </p>
        <% } %>
    </div>
</div>

<script src="JavaScript/Login.js"></script>
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
            <a href="rating history/rating.html">給予評價</a>
        </div>
    </div>

    <!-- 滾動式廣告 - 新品推出 -->
    <div class="slideshow-container">
        <div class="singleslide fade">
            <a href="#" onclick="showLoginAlert()" > <!-- 如可以點擊，則顯示登入後再購買訊息 -->
                <img src="image/new(1).jpg">
            </a>
                <div class="text">新品推出!!! 小王子</div>
        </div>

        <div class="singleslide fade">
            <a href="#" onclick="showLoginAlert()" > <!-- 如可以點擊，則顯示登入後再購買訊息 -->
                <img src="image/new(2).jpg">
            </a>
            <div class="text">新品推出!!! 異鄉人(卡謬版書衣)</div> 
        </div>

        <div class="singleslide fade">

            <a href="#" onclick="showLoginAlert()" > <!-- 如可以點擊，則顯示登入後再購買訊息 -->
                <img src="image/new(3).jpg">
            </a>
            <div class="text">新品推出!!! 深夜加油站遇見蘇格拉底</div> 
        </div>
    
        <!--響應式按鈕-->
        <button class="prev" onclick="plusSlides(-1)">《</button>
        <button class="next" onclick="plusSlides(1)">》</button>

        <!--javascipt 引入-->
        <script src="JavaScript/slideAD.js"></script>

        
        <script>
            function showLoginAlert() {
                // 顯示提示信息，告知用戶需要登入
                alert('🔔 請登入會員後再行購買！🔔');
            }
        </script>
    </div>
    </div>

<!--主商品頁-->
<div class="pro_content">
    <section class="product">
    <!--主商品頁(新品)-->
        <h2>-----新品上市!!!-----</h2>
        <p>資訊</p>
        <div class="pro_container">
            <!-- 商品列表從資料庫動態生成 -->
            <%
                Connection NewProductConn = null;
                PreparedStatement NewProductPstmt = null;
                ResultSet NewProductRs = null;
                int imgNewProductNum = 1; // 初始化新品項目之圖片標號
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/transactionthing";
                    String dbUsername = "root";
                    String dbPassword = "8970";
                    NewProductConn = DriverManager.getConnection(url, dbUsername, dbPassword);
                    // Update the SQL to select books where the Category is 'New'
                    String sql = "SELECT ProductID, ProductName, BookAuthor, BookCategory, Price FROM inventoryquantity WHERE BookCategory='新品'";
                    NewProductPstmt = NewProductConn.prepareStatement(sql);
                    NewProductRs = NewProductPstmt.executeQuery();

                    while(NewProductRs.next()) {
                        int productId = NewProductRs.getInt("ProductID");
                        String productName = NewProductRs.getString("ProductName");
                        String author = NewProductRs.getString("BookAuthor");
                        int price = NewProductRs.getInt("Price");
            %>
            <!-- 商品 新品 - 列印出產品結果 -->
                <div class="pro">
                    <img src="image/new(<%= imgNewProductNum %>).jpg" alt="">
                    <div class="des">
                        <h5><%= productName %></h5>
                        <span><%= author %></span>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <h4>$<%= price %></h4>
                    </div>

                    <!-- 購物車登入按鈕 -->

                    <a href="#" onclick="showLoginAlert()" ><i class="fas fa-shopping-cart cart"></i></a>
                    
                </div>
                
            <%
                        imgNewProductNum++; // 在while執行完一次一個產品印出後，增加圖片編號+1
                    }
                } catch(Exception e) {
                    out.println("<p>資料庫連接失敗：" + e.getMessage() + "</p>");
                } finally {
                    if (NewProductRs != null) try { NewProductRs.close(); } catch (SQLException e) { }
                    if (NewProductPstmt != null) try { NewProductPstmt.close(); } catch (SQLException e) { }
                    if (NewProductConn != null) try { NewProductConn.close(); } catch (SQLException e) { }
                }
            %>

            <script>
                function showLoginAlert() {
                // 顯示提示信息，告知用戶需要登入
                alert('🔔 請登入會員後再行購買！🔔');
                }
            </script>

        </div>

        <!--主商品頁(文學書籍)-->
        <h2 id="literature">-----文學類書籍-----</h2>
        <p>資訊</p>

        <div class="pro_container">
            <%
                Connection LiteraturetConn = null;
                PreparedStatement LiteraturetPstmt = null;
                ResultSet LiteratureRs = null;
                int imgLiteratureNum = 1; // 初始化文學項目之圖片標號
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/transactionthing";
                    String dbUsername = "root";
                    String dbPassword = "8970";
                    LiteraturetConn = DriverManager.getConnection(url, dbUsername, dbPassword);
                    // Update the SQL to select books where the Category is 'New'
                    String sql = "SELECT ProductID, ProductName, BookAuthor, BookCategory, Price FROM inventoryquantity WHERE BookCategory='文學'";
                    LiteraturetPstmt = LiteraturetConn.prepareStatement(sql);
                    LiteratureRs = LiteraturetPstmt.executeQuery();

                    while(LiteratureRs.next()) {
                        int productId = LiteratureRs.getInt("ProductID");
                        String productName = LiteratureRs.getString("ProductName");
                        String author = LiteratureRs.getString("BookAuthor");
                        int price = LiteratureRs.getInt("Price");
            %>

            <div class="pro">
                <img src="image/literature books(<%= imgLiteratureNum %>).jpg" alt="">
                <div class="des">
                    <h5><%= productName %></h5>
                    <span><%= author %></span>
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h4>$<%= price %></h4>
                </div>
                <a href="#" onclick="showLoginAlert()" ><i class="fas fa-shopping-cart cart"></i></a>
            </div>

            <%
                        imgLiteratureNum++; 
                    }
                } catch(Exception e) {
                    out.println("<p>資料庫連接失敗：" + e.getMessage() + "</p>");
                } finally {
                    if (LiteratureRs != null) try { LiteratureRs.close(); } catch (SQLException e) { }
                    if (LiteraturetPstmt != null) try { LiteraturetPstmt.close(); } catch (SQLException e) { }
                    if (LiteraturetConn != null) try { LiteraturetConn.close(); } catch (SQLException e) { }
                }
            %>

            <script>
                function showLoginAlert() {
                // 顯示提示信息，告知用戶需要登入
                alert('🔔 請登入會員後再行購買！🔔 ');
                }
            </script>

        </div>    

        


    <!--主商品頁(工具類書籍)-->

        <h2 id="Educational">-----教育類書籍-----</h2>
        <p>資訊</p>

        <div class="pro_container">
            <%
                Connection EduConn = null;
                PreparedStatement EduPstmt = null;
                ResultSet EduRs = null;
                int imgEduNum = 1; // 初始化教育工具書項目之圖片標號
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/transactionthing";
                    String dbUsername = "root";
                    String dbPassword = "8970";
                    EduConn = DriverManager.getConnection(url, dbUsername, dbPassword);
                    // Update the SQL to select books where the Category is 'New'
                    String sql = "SELECT ProductID, ProductName, BookAuthor, BookCategory, Price FROM inventoryquantity WHERE BookCategory='教育'";
                    EduPstmt = EduConn.prepareStatement(sql);
                    EduRs = EduPstmt.executeQuery();

                    while(EduRs.next()) {
                        int productId = EduRs.getInt("ProductID");
                        String productName = EduRs.getString("ProductName");
                        String author = EduRs.getString("BookAuthor");
                        int price = EduRs.getInt("Price");
            %>

            <div class="pro">
                <img src="image/Educational Books(<%= imgEduNum %>).jpg" alt="">
                <div class="des">
                    <h5><%= productName %></h5>
                    <span><%= author %></span>
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h4>$<%= price %></h4>
                </div>
                <a href="#" onclick="showLoginAlert()" ><i class="fas fa-shopping-cart cart"></i></a>
            </div>

            <%
                        imgEduNum++; 
                    }
                } catch(Exception e) {
                    out.println("<p>資料庫連接失敗：" + e.getMessage() + "</p>");
                } finally {
                    if (EduRs != null) try { EduRs.close(); } catch (SQLException e) { }
                    if (EduPstmt != null) try { EduPstmt.close(); } catch (SQLException e) { }
                    if (EduConn != null) try { EduConn.close(); } catch (SQLException e) { }
                }
            %>
        </div>
    </section>
</div>
    <script src="JavaScript/product.js"></script>
    <script>
                function showLoginAlert() {
                // 顯示提示信息，告知用戶需要登入
                alert('🔔 請登入會員後再行購買！🔔 ');
                }
    </script>


<footer>
    <!-- 團隊介紹與心得區 -->

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
                        是可以從中學到很多東西的，還有網路中的大神或者生活裡的細節也都會給我設計網頁帶來很多新想法跟靈感，總之這次的專案我寫的蠻開心的。</p>
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
            <img src="image/Lulu.jpg" height="100px" alt="">
            <div class="name">吳宗儒</div>
            <div class="design">11144144</div>
            <div class="card_back">
                <div class="back_content">
                    <img src="image/Lulu.jpg" alt="">
                    <h2>心得</h2>
                    <p>藉由這次的專題製作讓我學到很多東西，因為有些東西我是從網路上學到的，讓我發現很多東西其實網路上有更好的做法。
                        還有一點是要善用AI，出現問題無法解決時去問問ChatGpt，他會有很大的機率可以知道你的錯誤在那裡，這算是我覺得可以快速Debug的方式之一。</p>
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