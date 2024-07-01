<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String organizationName = request.getParameter("organizationName");
    String contactPersonName = request.getParameter("contactPersonName");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    String address = request.getParameter("address");
    String zipCode = request.getParameter("zipCode");
    String description = request.getParameter("description");
    String upiId = request.getParameter("upiId");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/SupportSail?useUnicode=true&characterEncoding=utf8";
    String user = "root";
    String password = "@aftab123";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        PreparedStatement ps = conn.prepareStatement("INSERT INTO organizations (organizationName, contactPersonName, email, phoneNumber, address, zipCode, description, upiId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        ps.setString(1, organizationName);
        ps.setString(2, contactPersonName);
        ps.setString(3, email);
        ps.setString(4, phoneNumber);
        ps.setString(5, address);
        ps.setString(6, zipCode);
        ps.setString(7, description);
        ps.setString(8, upiId);
        
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
