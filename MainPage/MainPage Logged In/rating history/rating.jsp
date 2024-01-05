<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>

<%
    String url = "jdbc:mysql://localhost:3306/transactionthing"; 
    String user = "root";
    String pass = "8970";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, user, pass);

        String userName = request.getParameter("userName");
        String userOpinion = request.getParameter("userOpinion");
        String ratingStr = request.getParameter("rating");
        int rating = 0;

        if (userName != null && !userName.trim().isEmpty() && userOpinion != null && !userOpinion.trim().isEmpty()) {
            try {
                rating = Integer.parseInt(ratingStr);
                String insertSql = "INSERT INTO reviews (Rating, Opinion, MemberName) VALUES (?, ?, ?)";
                try (PreparedStatement pstmt = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) {
                    pstmt.setInt(1, rating);
                    pstmt.setString(2, userOpinion.trim());
                    pstmt.setString(3, userName.trim());
                    pstmt.executeUpdate();
                }
            } catch (NumberFormatException e) {
                out.println("請輸入星號並重新送出");
            }
        }

        // Display all reviews
        String query = "SELECT * FROM reviews";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);
        while (rs.next()) {
            int dbRating = rs.getInt("Rating");
            String dbUserOpinion = rs.getString("Opinion");
            String dbUserName = rs.getString("MemberName");

            for (int i = 0; i < dbRating; i++) {
                out.println("<i class='bx bx-star star' style='color: blue;'></i>");
            }
            out.println("<br>");

            out.println("<textarea name='userName' id='userName' cols='30' rows='1' placeholder='Member Name'>" + dbUserName + "</textarea><br>");

            out.println("<textarea name='userOpinion' id='userOpinion' cols='30' rows='7' placeholder='User Opinion'>" + dbUserOpinion + "</textarea><br>");
        }
    } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
        out.println("An error occurred: " + ex.getMessage());
        ex.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

