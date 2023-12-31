<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>書籍簡介</title>
    <link rel="stylesheet" href="css/details.css">
    <!-- 引入其他所需CSS或JavaScript -->
</head>
<body>
    <!-- 頁面的header部分 -->

    <!-- 書籍ID輸入表單 -->
    <!--
    <form action="bookDetails.jsp" method="post">
        <label for="ProductID">輸入書籍ID：</label> 
        <input type="text" id="ProductID" name="ProductID">
        <input type="submit" value="查詢">
    </form>
    -->

    <!-- 商品頁面部分 -->
    <section id="prodetails" class="section-p1">
        <div class="single-pro-image">
            <img src="img/Educational Books(1).jpg" width="100%" id="MainImg" alt="">
        </div>
        <div class="single-pro-details">
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
                            <h2><%= displayProductName %></h2>
                            <h3> $<%= displayPrice %> </h3> 
                            <input type="number" min="0" value="1"> 
                            <button class="normal" onclick="alert('已加入購物車')">加入購物車</button>
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
        </div>
    </section>

    <!-- 頁面的其他部分 -->

</body>
</html>
