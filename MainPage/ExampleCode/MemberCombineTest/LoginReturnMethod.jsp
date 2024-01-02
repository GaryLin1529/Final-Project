<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<html>
<head>
    <title>黃金屋書店 - 登入</title>
    <!-- 添加您的样式代码 -->
    <style>
        /* 您的 CSS 样式代码 */
    </style>
</head>
<body>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String message = "";

    if (email != null && password != null && !email.isEmpty() && !password.isEmpty()) {
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
                message = "登入成功，歡迎 " + rs.getString("MemberName") + "！";
            } else {
                message = "帳號或密碼錯誤，請重新輸入！";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>

<div class="form-box login">
    <h2>登入</h2>
    <form action="ReturnMethod.jsp" method="post">
        <div class="input-box">
            <span class="icon"><ion-icon name="mail"></ion-icon></span>
            <input type="email" id="email" name="email" required>
            <label>帳號(email)</label>
        </div>
        <div class="input-box">
            <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
            <input type="password" id="password" name="password" required>
            <label>密碼</label>
        </div>
        <button type="submit" class="btn">登入</button>
    </form>
    <% if (!message.isEmpty()) { %>
        <p><%= message %></p>
    <% } %>
</div>

<!-- 这里可以添加更多页面内容 -->

</body>
</html>
