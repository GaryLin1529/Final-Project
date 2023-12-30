<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>簡單的書店</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/您的fontawesomekitcode.js" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="index.jsp">主頁</a></li>
                <li><a href="#">最新上架</a></li>
                <li><a href="#">暢銷書籍</a></li>
                <li><a href="#">關於我們</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <div class="book-list">
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/transactionthing";
                    String dbUsername = "root";
                    String dbPassword = "8970";
                    conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                    String sql = "SELECT ProductID, ProductName, BookAuthor, Price FROM inventoryquantity";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while(rs.next()) {
                        int productId = rs.getInt("ProductID");
                        String productName = rs.getString("ProductName");
                        String author = rs.getString("BookAuthor");
                        int price = rs.getInt("Price");
            %>
                <div class="book-item">
                    <h3><%= productName %></h3>
                    <p>作者: <%= author %></p>
                    <p>價格: $<%= price %></p>
                    <a href="bookDetails.jsp?ProductID=<%= productId %>">查看詳情</a>
                </div>
            <%
                    }
                } catch(Exception e) {
                    out.println("<p>資料庫連接失敗：" + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { }
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { }
                }
            %>
        </div>
    </main>
    
</body>
</html>
