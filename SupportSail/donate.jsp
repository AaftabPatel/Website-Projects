<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String organizationName = request.getParameter("organizationName");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobileNumber = request.getParameter("mobileNumber");
    String amount = request.getParameter("amount");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/SupportSail?useUnicode=true&characterEncoding=utf8";
    String user = "root";
    String password = "@aftab123";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        PreparedStatement ps = conn.prepareStatement("INSERT INTO donations (organizationName, name, email, mobileNumber, amount) VALUES (?, ?, ?, ?, ?)");
        ps.setString(1, organizationName);
        ps.setString(2, name);
        ps.setString(3, email);
        ps.setString(4, mobileNumber);
        ps.setString(5, amount);

        int rowsAffected = ps.executeUpdate();

        conn.close();

        if (rowsAffected > 0) {
            response.sendRedirect("donatePage.jsp?orgname=" + organizationName); // Redirect on successful insertion
        } else {
            response.sendRedirect("Error.htm"); // Redirect in case of error
        }
    } catch (Exception e) {
        out.println("Error: " + e); // For debugging - handle exceptions appropriately
    }
%>
