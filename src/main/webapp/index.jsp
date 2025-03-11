<%@ page import="java.net.InetAddress" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Session Info</title>
</head>
<body>
  <h1>Session Information</h1>

  <%
    // Get Session ID
    String sessionId = session.getId();
    out.println("<p>Session ID: " + sessionId + "</p>");

    // Get Hostname
    String hostname = "Unknown";
    try {
      hostname = InetAddress.getLocalHost().getHostName();
    } catch (UnknownHostException e) {
      out.println("<p>Error getting hostname: " + e.getMessage() + "</p>");
    }
    out.println("<p>Hostname: " + hostname + "</p>");

    // Session Counter
    Integer counter = (Integer) session.getAttribute("counter");
    if (counter == null) {
      counter = 1;
    } else {
      counter++;
    }
    session.setAttribute("counter", counter);

    out.println("<p>Counter: " + counter + "</p>");

  %>

</body>
</html>
