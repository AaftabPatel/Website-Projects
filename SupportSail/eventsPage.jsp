<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Events</title>
    <link rel = "stylesheet" href = "eventsPage.css">
  <link rel = "icon" type = "image" href="images/ssLogo_nobg.png">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap">
  </head>

    <body>
      <%
        String eventName = request.getParameter("navSearch");
        if (eventName != null && !eventName.isEmpty()) {
          try {
            String url = "jdbc:mysql://localhost:3306/SupportSail?characterEncoding=UTF-8";
            String username = "root";
            String password = "@aftab123";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, password);
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM events WHERE etitle = ?");
            pstmt.setString(1, eventName);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
      %>  
            <div class="parallax" id="p1">
      <a href="index.htm"><h1 id="logo">SupportSail</h1></a>
        <ul id="nav1">
            <li><a href = "Contact.htm">Contact</a></li>
            <li><a href = "Donate.htm">Donate</a></li>
      <li><a href = "Events.htm">Events</a></li>
            <li><a href = "Volunteer.htm">Volunteer</a></li>
            <li><a href = "index.htm">Home</a></li>
        </ul>

      <div id="content">
        <img id="eventImage" src="images/beach.jpg">
      
        <span id="eventName"><%= rs.getString("etitle") %></span><br>
      
        <p><strong>Location</strong>: <%= rs.getString("location") %></p>
        <p><strong>Organizer</strong>: <%= rs.getString("organizer") %></p>
        <p><strong>Description</strong>: <%= rs.getString("description") %></p>    
      </div>
  <div class="button-container">
    <a href="Volunteer.htm"><button>Volunteer</button></a>
    <a href="About.htm"><button >About Us</button></a>
  </div>


      <%
            } else {
      %>
              <p>No event found with that name.</p>
      <%
            }
            con.close();
          } catch (Exception e) {
            response.sendRedirect("/SupportSail/Error.htm");
          }
        } else {
      %>
          <p>Please provide an event name.</p>
      <%
        }
      %>
    </body>
</html>