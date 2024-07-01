<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Donate Page</title>
    <link rel="stylesheet" href="donatePage.css">
    <link rel="icon" type="image" href="images/ssLogo_nobg.png">
</head>
<body>
    <div class="parallax" id="p1">
        <h1><u>Donation Page</u></h1>
    </div>
    <div class="grid-container">
        <div>
            <img src="images/qr.png" alt="Organization QR" class="qrimage">
        </div>
        <div>
            <% 
                String organizationName = null;
                String upi = null;
                // Database connection details
                String url = "jdbc:mysql://localhost:3306/SupportSail?characterEncoding=UTF-8";
                String user = "root";
                String password = "@aftab123";
                
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    
                    // Query to retrieve organization information
                    String orgQuery = "SELECT organizationName, description, upiId FROM organizations WHERE organizationName = ?";
                    ps = conn.prepareStatement(orgQuery);
                    String orgName = request.getParameter("orgname");
                    ps.setString(1, orgName);
                    
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        organizationName = rs.getString("organizationName");
                        String description = rs.getString("description");
                        upi = rs.getString("upiId");
            %>
            <h2><u><%= organizationName %></u></h2>
            <p><%= description %></p>
            
            <!-- Google Pay -->
            <a href="upi://pay?pa=<%= upi %>&pn=<%= organizationName %>&mc=&tid=&tr=&tn=&am=&cu=INR" class="donate-button">
                <img src="images/gpay.png" id="linkImage">
            </a>
            
            <!-- PhonePe -->
            <a href="https://www.phonepe.com/xyz" class="donate-button">
                <img src="images/phonepe.png" id="linkImage">
            </a>
            
            <!-- Paytm -->
            <a href="https://paytm.com/xyz" class="donate-button">
                <img src="images/paytm.png" id="linkImage">
            </a>
            
            <%
                    } else {
                        out.println("Organization not found");
                    }
                
                } catch (Exception e) {
                    out.println("Error: " + e);
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>

    </div>
    <div class="button-container">
            <a href="Contact.htm">Contact</a>
            <a href="about.htm">About Us</a>
            <a href="index.htm">Home</a>
    </div>
</body>
</html>
