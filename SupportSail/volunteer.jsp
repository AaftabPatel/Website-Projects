<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>

<%
    // Retrieve form data
    String project = request.getParameter("project");
    String fullName = request.getParameter("fname");
    String email = request.getParameter("email");
    String mobNo = request.getParameter("mob");

    // JDBC connection details
    String url = "jdbc:mysql://localhost:3306/SupportSail?useUnicode=true&characterEncoding=utf8";
    String user = "root";
    String password = "@aftab123";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // SQL query to insert form data into table
        PreparedStatement ps = conn.prepareStatement("INSERT INTO volunteerData (project, fullName, email, mobNo) VALUES (?, ?, ?, ?)");
        ps.setString(1, project);
        ps.setString(2, fullName);
        ps.setString(3, email);
        ps.setString(4, mobNo);

        int rowsAffected = ps.executeUpdate();

        conn.close();

        if (rowsAffected > 0) {
            response.sendRedirect("/SupportSail/Volunteer.htm"); // Redirect to contact page if data inserted successfully
        } else {
            response.sendRedirect("/SupportSail/Error.htm");
        }
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
