<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShoppingInterface</title>
    <link rel="stylesheet" href="css/ShoppingInterface.css">
    <link rel="stylesheet" href="js/ShoppingInterface.js">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="js/header.js">
</head>
<body>
    <!--前導主頁-->
    <header class="header">
        <!--按Logo回主頁-->
        <a href="../../MainPageLogged.jsp" class="logo"><img class="header-logo" src="image/logo.png"/></a>
        
        <!--搜尋欄-->
        <div class="SearchBar_container">
            <form action="" class="SearchBar">
                <input type="text" placeholder="搜尋..." name="question">
                <button type="submit"><img src="image/search.png"></button>
            </form>
        </div>

        <nav class="navbar">
                <a href="../../MainPageLogged.jsp">主頁面</a>

                <%
                    String username = (String) session.getAttribute("username");
                    if (username != null && !username.isEmpty()) {
                    // 如果用戶已經登入，顯示歡迎信息和用戶名
                %>
                    <input class="btnLogin-popup" type="button" value="歡迎, <%= username %>" onclick="location.href='/MainPage/MainPage%20Logged%20In/MemberDetail/MemberDetail.jsp'"></button>
                <%
                    } else {
                    // 如果用戶未登入，顯示默認的按鈕文本
                %>
                    <input class="btnLogin-popup" type="button" value="帳戶" onclick=""></button>
                <%
                    }
                %>

                
        </nav>

        <script src="js/header.js"></script>
    </header>



<!--購物車&結帳頁面-->
<div class="contanier">
    <div class="checkoutLayout">
        <div class="returnCart">
            <h1>我的購物車</h1>

            <%
                // 检查是否有新加入购物车的产品
                String newProductId = request.getParameter("productID");
                String newQuantity = request.getParameter("quantity");

                if (newProductId != null && !newProductId.isEmpty()) {
                    // 将新加入的产品添加到购物车
                    ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
                    if (cart == null) {
                        cart = new ArrayList<String>();
                    }
                    cart.add(newProductId + ":" + newQuantity);
                    session.setAttribute("cart", cart);
                }

                int totalQuantity = 0; // 總書本數量
                int totalPrice = 0; // 總價格

                ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
                if (cart != null && !cart.isEmpty()) {
                    Connection ProductConn = null;
                    PreparedStatement ProductPstmt = null;
                    ResultSet ProductRs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        ProductConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/transactionthing", "root", "8970");
                        for (String item : cart) {
                            String[] parts = item.split(":");
                            String productId = parts[0];
                            int quantity = parts.length > 1 ? Integer.parseInt(parts[1]) : 1; // 默认数量为1

                            String sql = "SELECT ProductName, Price FROM inventoryquantity WHERE ProductID = ?";
                            ProductPstmt = ProductConn.prepareStatement(sql);
                            ProductPstmt.setString(1, productId);
                            ProductRs = ProductPstmt.executeQuery();
                            if (ProductRs.next()) {
                                String productName = ProductRs.getString("ProductName");
                                int price = ProductRs.getInt("Price");

                                /*
                                totalQuantity = totalQuantity + quantity; // 累加总数量
                                totalPrice = totalPrice + EachReturnPrice; // 累加总价格
                                */

                                %>

                                <div class="list">

                                    <!-- 商品1 -->
                                    <div class="item">
                                        <img src="bookImg/<%= productId %>.jpg" alt="">
                                        <div class="info">
                                            <div class="name"><%= productName %></div>
                                            <div class="priceAndQuantity"> 1 本 $ <%= price %> </div>
                                        </div>
                                        <div class="quantity"><%= quantity %></div>
                                        <div class="returnPrice">
                                            <%
                                                
                                                int EachReturnPrice = price * quantity;

                                                totalQuantity = totalQuantity + quantity; // 累加总数量
                                                totalPrice = totalPrice + EachReturnPrice; // 累加总价格
                                            %>
                                        $ <%= EachReturnPrice %>
                                        </div>
                                    </div>
                                </div>

                            <%
                                
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
                    out.println("<p>您的購物車是空的</p>");
                }
            %>


        </div>

        <div class="right">
            <h1>結帳</h1>
            <form action="CheckoutProcess.jsp" method="post">
                <div class="form">
                    <div class="group">
                        <label for="name">姓名</label>
                        <input type="text" name="name" id="name" required>
                    </div>
                    <div class="group">
                        <label for="phone">手機號碼</label>
                        <input type="text" name="phone" id="phone" required>
                    </div>
                    <div class="group">
                        <label for="address">地址</label>
                        <input type="text" name="address" id="address" required>
                    </div>
                </div>
                <div class="return">
                    <div class="row">
                        <div>總數量 :</div>
                        <div class="totalQuantity"> <%= totalQuantity %> </div>
                    </div>
                    <div class="row">
                        <div>總金額 :</div>
                        <div class="totalPrice">$ <%= totalPrice %> </div>
                    </div>
                </div>
                <button type="submit" class="buttonCheckout">確認結帳</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>