<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>

<%
    // Retrieve form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobNo = request.getParameter("mobNo");
    String message = request.getParameter("message");

    // JDBC connection details
    String url = "jdbc:mysql://localhost:3306/SupportSail?useUnicode=true&characterEncoding=utf8";
    String user = "root";
    String password = "@aftab123";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        PreparedStatement ps = conn.prepareStatement("INSERT INTO contactData (name, email, mobNo, message) VALUES (?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, mobNo);
        ps.setString(4, message);

        int rowsAffected = ps.executeUpdate();

        conn.close();

        if (rowsAffected > 0) {
            response.sendRedirect("/SupportSail/Contact.htm"); // Redirect to contact page if data inserted successfully
        } else {
            response.sendRedirect("/SupportSail/Error.htm");
        }
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
