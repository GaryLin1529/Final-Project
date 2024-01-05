<!-- 結帳處理頁面 - CheckoutProcess.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");

    if (cart != null && !cart.isEmpty()) {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/transactionthing", "root", "8970");
            conn.setAutoCommit(false); // 開始事務

            for (String item : cart) {
                String[] parts = item.split(":");
                String productId = parts[0];
                int quantity = Integer.parseInt(parts[1]);

                // 更新資料庫庫存
                String sql = "UPDATE inventoryquantity SET Quantity = Quantity - ? WHERE ProductID = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setInt(1, quantity);
                    pstmt.setString(2, productId);
                    pstmt.executeUpdate();
                }
            }

            conn.commit(); // 提交事務
        } catch (Exception e) {
            if (conn != null) conn.rollback(); // 回滾事務
            e.printStackTrace();
        } finally {
            if (conn != null) conn.close();
        }

        // 清空購物車
        session.removeAttribute("cart");

        // 顯示結帳成功訊息
        out.println("<script type='text/javascript'>");
        out.println("alert('結帳成功！您的訂單將配送到: " + address + "');");
        out.println("location='../../MainPageLogged.jsp';"); // 重定向到首頁或其他頁面
        out.println("</script>");
    }
%>
