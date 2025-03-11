<html>
<body>
<h2>Hello World, worst Apocalypse ever!</h2>
<h3>Session ID = <%=session.getId()%></h3>
<h3>Creation Time = <%=session.getCreationTime()%></h3>
<%
String myObject = "Hallo Besucher";
 // Object in Session
session.setAttribute("myObject", myObject);
 // Object aus Session holen
String sessionObject = (String) session.getAttribute("myObject");
%>
<h3>Session =<% sessionObject.toString(); %>
</body>
</html>
