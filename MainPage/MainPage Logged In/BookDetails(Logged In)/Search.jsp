<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
</head>
<body>

    <!-- 搜尋功能 -->

    <%
    String searchQuery = request.getParameter("question");
    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/transactionthing", "root", "8970");
            String query = "SELECT * FROM inventoryquantity WHERE ProductName LIKE ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, "%" + searchQuery.trim() + "%");
            rs = stmt.executeQuery();

            if (!rs.isBeforeFirst()) { // Checks if ResultSet is empty
                out.println("<p>No results found for the search query.</p>");
            } else {
                while (rs.next()) {
                    // Ensure these are the correct column names from your database
                    out.println("<p><a href='BookDetails.jsp?ProductID=" + rs.getString("ProductID") + "'>" + rs.getString("ProductName") + "</a></p>");
                }
            }
        } catch (ClassNotFoundException e) {
            out.println("<p>JDBC Driver not found.</p>");
            e.printStackTrace(); // For debugging
        } catch (SQLException e) {
            out.println("<p>Error executing SQL query: " + e.getMessage() + "</p>");
            e.printStackTrace(); // For debugging
        } catch (Exception e) {
            out.println("<p>An unexpected error occurred: " + e.getMessage() + "</p>");
            e.printStackTrace(); // For debugging
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<p>Please enter a search query.</p>");
    }
    %>
</body>
</html>


