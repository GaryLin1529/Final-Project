<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<!-- http://localhost:8080/pj/MainPage/MainPage%20Logged%20In/shoppingCartTest/TestBookDetails.jsp -->

<!DOCTYPE html>
<html>
<head>
    <title>结账</title>
</head>
<body>
    <h1>结账</h1>
    <%
        ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
        int total = 0;
        if (cart != null && !cart.isEmpty()) {
            Connection ProductConn = null;
            PreparedStatement ProductPstmt = null;
            ResultSet ProductRs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                ProductConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/transactionthing", "root", "8970");
                for (String productId : cart) {
                    String sql = "SELECT ProductName, Price FROM inventoryquantity WHERE ProductID = ?";
                    ProductPstmt = ProductConn.prepareStatement(sql);
                    ProductPstmt.setString(1, productId);
                    ProductRs = ProductPstmt.executeQuery();
                    if (ProductRs.next()) {
                        String productName = ProductRs.getString("ProductName");
                        int price = ProductRs.getInt("Price");
                        total += price;
                        %><p><%= productName %> - <%= price %></p><%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (ProductRs != null) try { ProductRs.close(); } catch (SQLException e) { }
                if (ProductPstmt != null) try { ProductPstmt.close(); } catch (SQLException e) { }
                if (ProductConn != null) try { ProductConn.close(); } catch (SQLException e) { }
            }
            out.println("<h2>总计: " + total + "</h2>");
        } else {
            out.println("<p>您的购物车是空的</p>");
        }
    %>
    <!-- 结账表单 -->
    <form action="confirmCheckout.jsp" method="post">
        <!-- 结账信息表单字段 -->
        <input type="submit" value="提交订单">
    </form>
</body>
</html>
