<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>個人資料</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
    <header class="header">
        <!--按Logo回主頁-->
        <a href="../MainPage.html" class="logo"><img class="header-logo" src="image/logo.png"/></a>

        <!--搜尋欄-->
        <div class="SearchBar_container">
            <form action="" class="SearchBar">
                <input type="text" placeholder="搜尋..." name="question">
                <button type="submit"><img src="image/search.png"></button>
            </form>
        </div>

        <nav class="navbar">
                <a href="../MainPage.html">主頁面</a>
                <%
                    String username = (String) session.getAttribute("username");
                    if (username != null && !username.isEmpty()) {
                    // 如果用戶已經登入，顯示歡迎信息和用戶名
                %>
                    <input class="btnLogin-popup" type="button" value="歡迎, <%= username %>" onclick="location.href='/MainPage/MainPage%20Logged%20In/MemberDetail/MemberDetail.jsp'"></button>
                <%
                    } else {
                    // 如果用戶未登入，顯示默認的按鈕文本
                %>
                    <input class="btnLogin-popup" type="button" value="帳戶" onclick=""></button>
                <%
                    }
                %>
        </nav>

        <script src="js/header.js"></script>
    </header>

    <div class="container">
        <div class="title">個人資訊</div>
        <form action="#">
            <div class="user-details">

                <%      
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        String message = null; 

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String url = "jdbc:mysql://localhost:3306/transactionthing";
                            String dbUsername = "root";
                            String dbPassword = "8970";

                            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                            String sql = "SELECT * FROM membership WHERE MemberAccount = ? AND MemberPassword = ?";
                            pstmt = conn.prepareStatement(sql);
                            

                            rs = pstmt.executeQuery();
                            
                            String memberName = rs.getString("MemberName");
                            String memberMail = rs.getString("MemberAccount");
                            String memberPhone = rs.getString("MemberPhone");
                            String MemberPassword = rs.getString("MemberPassword");

                        } catch (Exception e) {
                            message = "資料庫連接失敗：" + e.getMessage();
                        } finally {
                            if (rs != null) try { rs.close(); } catch(SQLException e) {}
                            if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
                            if (conn != null) try { conn.close(); } catch(SQLException e) {}
                        }

                %>

                    <div class="input-box">
                        <span class="details">使用者名稱</span>
                        <p> <%= memberName %> </p>  
                    </div>
                    <div class="input-box">
                        <span class="details">信箱</span>
                        <input type="text" placeholder="請輸入信箱" >
                    </div>
                    <div class="input-box">
                        <span class="details">手機號碼</span>
                        <input type="text" placeholder="請輸入電話號碼" >
                    </div>
                    <div class="input-box">
                        <span class="details">密碼</span>
                        <input type="password" placeholder="請輸入密碼" >
                    </div>
                
            </div>

            <% if (message != null && !message.isEmpty() ) { %>
                    <script type="text/javascript">
                        alert('<%= message %>'); // 在頁面加載時顯示彈出消息
                    </script>
            <% } %>

            <div class="gender-details">
                <input type="radio" name="gender" id="dot-1">
                <input type="radio" name="gender" id="dot-2">
                <input type="radio" name="gender" id="dot-3">
                
            </div>
            
        
            <div class="button">
            <input type="submit"  value="登出" onclick="location.href='../../MainPage Login/MainPage.html'"></button>
            </div>
        </form>
    </div>
</body>
</html>