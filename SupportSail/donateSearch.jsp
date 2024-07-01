
<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        String searchTerm = request.getParameter("q");

        Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SupportSail?useUnicode=true&characterEncoding=utf8", "root", "@aftab123");
        String sql = "SELECT organizationName FROM organizations WHERE organizationName LIKE ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, "%" + searchTerm + "%");
        rs = ps.executeQuery();

        while (rs.next()) {
            out.println("<div class='option'>" + rs.getString("organizationName") + "</div>");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        // Close resources
    }
%>
