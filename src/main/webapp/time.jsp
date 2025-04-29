<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verzögerte Ausgabe</title>
</head>
<body>
<%
    String timeoutStr = request.getParameter("timeout");
    long timeout = 0;
    if (timeoutStr != null && !timeoutStr.isEmpty()) {
        try {
            timeout = Long.parseLong(timeoutStr);
        } catch (NumberFormatException e) {
            out.println("<p>Ungültiger Timeout-Wert in der URL.</p>");
            return;
        }
    }

    if (timeout > 0) {
        try {
            Thread.sleep(timeout);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            out.println("<p>Die Ausführung wurde unterbrochen.</p>");
            return;
        }
    }
%>
    <h1>Ausgabe nach Verzögerung</h1>
    <p>Diese Ausgabe erfolgt nach einer Verzögerung von <%= timeout %> Millisekunden.</p>
    <p>Aufruf mit ?timeout=3000 (Dies würde eine Verzögerung von 3 Sekunden verursachen .</p>
</body>
</html>
