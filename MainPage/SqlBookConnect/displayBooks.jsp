<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 進入網址：http://localhost:8080/pj/MainPage/SqlBookConnect/displayBooks.jsp -->

<!DOCTYPE html>
<html>
<head>
    <title>書籍展示</title>
    <!-- 添加適當的樣式或JavaScript -->
</head>
<body>
    <h1>書籍列表</h1>
    <table border="1">
        <tr>
            <th>書籍 ID </th>
            <th>書名</th>
            <th>作者</th>
            <th>庫存量</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/transactionthing";
                String dbUsername = "root";
                String dbPassword = "8970";

                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                stmt = conn.createStatement(); // 初始化stmt對象

                String sql = "SELECT ProductID, ProductName, BookAuthor, Quantity FROM inventoryquantity";
                rs = stmt.executeQuery(sql); // 使用stmt執行查詢
                while(rs.next()) {
                    int DisplayID = rs.getInt("ProductID");
                    String DisplayProductName = rs.getString("ProductName");
                    String DisplayAuthor = rs.getString("BookAuthor");
                    int DisplayQuantity = rs.getInt("Quantity");
        %>
                    <tr>
                        <td><%= DisplayID %></td>
                        <td><%= DisplayProductName %></td>
                        <td><%= DisplayAuthor %></td>
                        <td><%= DisplayQuantity %></td>
                    </tr>
        <%
                }
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { }
                if (conn != null) try { conn.close(); } catch (SQLException e) { }
            }
        %>
    </table>
</body>
</html>
