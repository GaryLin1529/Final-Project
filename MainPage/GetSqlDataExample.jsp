<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Database Connection</title>
</head>
<body>
<!-- 會員測試  -->
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
                    out.println("<h2>Member List:</h2>");
                    out.println("<table border='1'>");
                    out.println("<tr><th>Member ID</th><th>Member Password</th><th>Member Name</th><th>Member Account </th><th>Member Phone</th></tr>");

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("MemberID") + "</td>");
                        out.println("<td>" + rs.getInt("MemberPassword") + "</td>");
                        out.println("<td>" + rs.getString("MemberName") + "</td>");
                        out.println("<td>" + rs.getString("MemberAccount") + "</td>");
                        out.println("<td>" + rs.getInt("MemberPhone") + "</td>");
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

</body>
</html>
