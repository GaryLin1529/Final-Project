<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
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

        .register-container {
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
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phoneNumber = request.getParameter("phoneNumber");

    Connection conn = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmtSelect = null; // 添加宣告
    ResultSet rs = null; // 添加宣告

    try {
        // 加載JDBC驅動程序
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 資料庫連接URL
        String url = "jdbc:mysql://localhost:3306/transactionthing";
        String dbUsername = "root";
        String dbPassword = "8970";

        // 建立資料庫連接
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // 使用PreparedStatement來執行SQL插入
        String sql = "INSERT INTO membership (MemberName, MemberAccount, MemberPassword, MemberPhone) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setString(3, password);
        pstmt.setString(4, phoneNumber);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            // 註冊成功，這裡可以進行相應的操作
            out.println("註冊成功，歡迎 " + username + "!");

            // 使用PreparedStatement來執行SQL查詢
            String selectSql = "SELECT * FROM membership WHERE MemberAccount = ?";
            pstmtSelect = conn.prepareStatement(selectSql);
            pstmtSelect.setString(1, email);

            rs = pstmtSelect.executeQuery();

            // 列印查詢結果
            out.println("");
            out.println("<h2>帳號表格：</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>MemberID</th><th>MemberName</th><th>MemberAccount</th><th>MemberPassword</th><th>MemberPhone</th></tr>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("MemberID") + "</td>");
                out.println("<td>" + rs.getString("MemberName") + "</td>");
                out.println("<td>" + rs.getString("MemberAccount") + "</td>");
                out.println("<td>" + rs.getString("MemberPassword") + "</td>");
                out.println("<td>" + rs.getString("MemberPhone") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");

        } else {
            // 註冊失敗
            out.println("註冊失敗，請檢查資料是否正確！");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        // 關閉資源
        try {
            if (pstmt != null) pstmt.close();
            if (pstmtSelect != null) pstmtSelect.close(); // 關閉 pstmtSelect
            if (rs != null) rs.close(); // 關閉 rs
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<a href="MainPage.jsp" target="_self"> 點此回到首頁重新登入 </a> <!-- 回到首頁後登入按鈕需不見，需要呈現歡迎 + username -->

</body>
</html>
