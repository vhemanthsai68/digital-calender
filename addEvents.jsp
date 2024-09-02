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
        <link rel="stylesheet" type="text/css" href="addEvents.css"/>
        <title>Digital Calender</title>
    </head>
    <body>
        <a href="digitalCal.jsp">Back</a>
        <%
            String edate = request.getParameter("edate");
            if(edate == null){
        %>
        <div class="container">
            <form method="POST" action="addEvents.jsp">
                <fieldset>
                    <legend>Event details</legend>
                <input type="date" name="edate" placeholder="Enter date"><br>
                <input type="time" name="etime" placeholder="Enter time"><br>
                <input type="text" name="emsg" placeholder="Enter event description"><br>
                <input type="submit" value="Add event">
                </fieldset>
            </form>
        </div>
        <%
            }else{
            String etime = request.getParameter("etime");
            String emsg = request.getParameter("emsg");
            String uname = (String)session.getAttribute("id");
            Connection c = (Connection)application.getAttribute("dbcon");
            Statement s = c.createStatement();
            s.executeUpdate("insert into events values('"+uname+"', '"+edate+"', '"+etime+"', '"+emsg+"')");
            out.println("Successfully recorded");
            }        
        %>
    </body>
</html>