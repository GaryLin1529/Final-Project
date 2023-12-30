<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>電子書商網站</title>
    <link rel="stylesheet" href="css/main.css">
    <script src="https://kit.fontawesome.com/您的fontawesomekitcode.js" crossorigin="anonymous"></script>
    <!-- 引入其他所需CSS或JavaScript -->
</head>
<body>
    <!-- 頁面的header部分 -->

    <!-- 商品展示部分 -->
    <div class="pro_content">
        <section class="product">
            <!-- 主商品頁(新品) -->
            <h2>-----新品上市!!!-----</h2>
            <p>資訊</p>
            <div class="pro_container">
                <!-- 商品列表從資料庫動態生成 -->
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
                    <div class="pro">
                        <!-- 假設圖片暫時不顯示 -->
                        <div class="des">
                            <h5><%= productName %></h5>
                            <span><%= author %></span>
                            <div class="star">
                                <!-- 星星圖標 -->
                            </div>
                            <h4>$<%= price %></h4>
                        </div>
                        <a href="bookDetails.jsp?ProductID=<%= productId %>"><i class="fas fa-shopping-cart cart"></i></a>
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
        </section>
    </div>

    <!-- 頁面的其他部分 -->

</body>
</html>
