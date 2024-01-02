<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>註冊 - 黃金屋書店</title>
    <style>
        /* 添加您的样式代码 */
        /* 这里可以包含之前给出的 CSS 样式 */
    </style>
</head>
<body>

<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phoneNumber = request.getParameter("phoneNumber");
    String message = "";

    if (username != null && email != null && password != null && phoneNumber != null) {
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

            String sql = "INSERT INTO membership (MemberName, MemberAccount, MemberPassword, MemberPhone) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, phoneNumber);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                message = "註冊成功，歡迎 " + username + "!";
            } else {
                message = "註冊失敗，請檢查資料是否正確！";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
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
    <form action="RegisterReturnMethod.jsp" method="post">
        <div class="input-box">
            <span class="icon"><ion-icon name="person"></ion-icon></span>
            <input type="text" id="username" name="username" required>
            <label>使用者名稱</label>
        </div>
        <div class="input-box">
            <span class="icon"><ion-icon name="mail"></ion-icon></span>
            <input type="email" id="email" name="email" required>
            <label>帳號(Email)</label>
        </div> 
        <div class="input-box">
            <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
            <input type="password" id="password" name="password" required>
            <label>密碼</label>
        </div>
        <div class="input-box">
            <span class="icon"><ion-icon name="phoneNumber"></ion-icon></span>
            <input type="text" id="phoneNumber" name="phoneNumber" required>
            <label>手機號碼</label>
        </div>   
        <div class="remeber-forget">
            <label><input type="checkbox">我同意隱私條款</label>
        </div>
        <button type="submit" class="btn">註冊</button>
    </form>
    <% if (!message.isEmpty()) { %>
        <p><%= message %></p>
    <% } %>
</div>

</body>
</html>
