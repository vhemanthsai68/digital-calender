<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>  
<% 
	String id = (String)session.getAttribute("id");
	if(id == null){ %>
		<jsp:forward page="index.jsp"/>
	<%}
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="digitalCal.css">
        <title>Digital Calender</title>
    </head>
    <body>
        <div class="logout">
            <form method="POST" action="logout.jsp">
                <input type="submit" value="Logout">
            </form>
        </div>
        <h1>Welcome to Digital Calender</h1>
        <div class="container">
            <h2 id="one"><a href="myEvents.jsp">My events</a></h2>
            <h2 id="two"><a href="addEvents.jsp">Add events</a></h2>
        </div>
    </body>
</html>