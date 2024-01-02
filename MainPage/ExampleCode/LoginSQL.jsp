<!-- LoginSQL.jsp -->

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // 加載JDBC驅動程序
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 資料庫連接URL
        String url = "jdbc:mysql://localhost:3306/transactionthing";
        String dbUsername = "root";
        String dbPassword = "8970";

        // 建立資料庫連接
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // 使用PreparedStatement來執行SQL查詢
        String sql = "SELECT * FROM membership WHERE MemberAccount = ? AND MemberPassword = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, email);
        pstmt.setString(2, password);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 登入成功，這裡可以進行相應的操作
            out.println("登入成功，歡迎 " + rs.getString("MemberName") + "！");
        } else {
            // 登入失敗
            out.println("帳號或密碼錯誤，請重新輸入！");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        // 關閉資源
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<a href="MainPage.jsp" target="_self"> 點此回到首頁 </a> <!-- 回到首頁後登入按鈕需不見，需要呈現歡迎 + username -->

</body>
</html>
