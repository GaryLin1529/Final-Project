<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>黃金屋-書籍簡介</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/details17.css">
</head>
<body>
    <!--前導主頁-->
    <header class="header">
        <!--按Logo回主頁-->
        <a href="../../MainPage Logged In/MainPageLogged.jsp" class="logo"><img class="header-logo" src="img/logo.png"/></a>
        <!--
        <a href="/MainPage/MainPage Logged In/MainPageLogged.jsp" class="logo"><img class="header-logo" src="img/logo.png"/></a>
        -->

        <!--搜尋欄-->
        <div class="SearchBar_container">
            <form action="" class="SearchBar">
                <input type="text" placeholder="搜尋..." name="question">
                <button type="submit"><img src="img/search.png"></button>
            </form>
        </div>

        <nav class="navbar">
                <a href="../../MainPage Logged In/MainPageLogged.jsp">主頁面</a>
                <a href="Shopping Interface/ShoppingInterface.jsp" >購物車</a>
                <%
                    String username = (String) session.getAttribute("username");
                    if (username != null && !username.isEmpty()) {
                    // 如果用戶已經登入，顯示歡迎信息和用戶名
                %>
                    <input class="btnLogin-popup" type="button" value="歡迎, <%= username %>" onclick="location.href='../MemberDetail/MemberDetail.html'"></button>
                <%
                    } else {
                    // 如果用戶未登入，顯示默認的按鈕文本
                %>
                    <input class="btnLogin-popup" type="button" value="帳戶" onclick="location.href=''"></button>
                <%
                    }
                %>
        </nav>
    </header>
    <section id="prodetails" class="section-p1">

        <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String productID = request.getParameter("ProductID");
                if(productID != null && !productID.trim().isEmpty()) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/transactionthing";
                        String dbUsername = "root";
                        String dbPassword = "8970";

                        conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                        String sql = "SELECT ProductName, BookAuthor, Translator, BookLanguage, Quantity, SupplierName, Price FROM inventoryquantity WHERE ProductID = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, Integer.parseInt(productID));
                        rs = pstmt.executeQuery();

                        if(rs.next()) {
                            String displayProductName = rs.getString("ProductName");
                            String displayAuthor = rs.getString("BookAuthor");
                            String displayTranslator = rs.getString("Translator");
                            String displayLanguage = rs.getString("BookLanguage");
                            String displaySupplier = rs.getString("SupplierName");
                            int displayQuantity = rs.getInt("Quantity");
                            int displayPrice = rs.getInt("Price");
            %>

        <div class="single-pro-image">
            <img src="bookImg/<%= productID %>.jpg" width="100%" id="MainImg" style="border-radius: 10px;">
        </div>
        <div class="single-pro-details">
                            <h2><%= displayProductName %></h2>
                            <h3> $<%= displayPrice %> </h3> 
                            <!-- <input type="number" min="0" max= <%= displayQuantity %> value="1"> --> 
                            <form method="post" action="Shopping Interface/ShoppingInterface.jsp">
                                <input type="hidden" name="productID" value="<%= productID %>" />
                                <input type="number" name="quantity" min="0" max="<%= displayQuantity %>" value="1" />
                                <button type="submit" class="normal" oneclick="alert('已加入購物車')"> 加入購物車 </button>
                            </form>
                            <h5>庫存量: <%= displayQuantity %></h5>
                            <h4>產品詳情</h4>
                            <span>
                                作者: <%= displayAuthor %><br>
                                譯者: <%= displayTranslator %><br>
                                語言: <%= displayLanguage %><br>
                                供應商(出版社): <%= displaySupplier %> <!-- 這裡您可能需要進一步處理以顯示供應商名稱而不是ID -->
                            </span>
                            
            <%
                        } else {
            %>
                            <p>找不到指定的書籍資料。</p>
            <%
                        }
                    } catch(Exception e) {
                        out.println("<p>資料庫連接失敗：" + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { }
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { }
                    }
                }
            %>
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
             <textarea name="name" id="userName" cols="30" rows="1" placeholder="使用者名字"></textarea>
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
<script src="js/details17.js"></script>
<script src="js/history.js"></script>
<script src="js/header.js"></script>
</body>
</html>