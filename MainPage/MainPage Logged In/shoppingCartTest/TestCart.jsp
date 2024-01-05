<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>购物车</title>
</head>
<body>
    <h1>购物车</h1>
    <%
        // 假设您已经在会话中保存了购物车信息
        ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
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
        } else {
            out.println("<p>您的购物车是空的</p>");
        }
    %>
    <a href="TestCheckout.jsp">前往结账</a>
</body>
</html>
