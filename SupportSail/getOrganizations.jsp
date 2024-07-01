<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Assuming you have a method to retrieve organization names from your database
    List<String> organizationNames = getOrganizationNamesFromDB(); // Implement this method

    // Output organization names as options for the search list
    for (String orgName : organizationNames) {
%>
        <option value="<%= orgName %>"></option>
<%
    }
%>
