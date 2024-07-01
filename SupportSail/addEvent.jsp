<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Retrieve form data
    String etitle = request.getParameter("etitle");
    String location = request.getParameter("location");
    String organizer = request.getParameter("organizer");
    String date = request.getParameter("date");
    String description = request.getParameter("description");

    // JDBC connection details
    String url = "jdbc:mysql://localhost:3306/SupportSail?useUnicode=true&characterEncoding=utf8";
    String user = "root";
    String password = "@aftab123";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        PreparedStatement pstmt = conn.prepareStatement("INSERT INTO events (etitle, location, organizer, date, description) VALUES (?, ?, ?, ?, ?)");
        pstmt.setString(1, etitle);
        pstmt.setString(2, location);
        pstmt.setString(3, organizer);
        pstmt.setString(4, date);
        pstmt.setString(5, description);

        int rowsAffected = pstmt.executeUpdate();

        conn.close();

        if (rowsAffected > 0) {
            response.sendRedirect("Events.htm"); // Redirect if data inserted successfully
        } else {
            response.sendRedirect("Error.htm"); // Redirect to error page if not
        }
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
