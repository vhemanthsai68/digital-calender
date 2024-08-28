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
            Connection c = (Connection)application.getAttribute("dbcon");
            Statement s = c.createStatement();
            String id1 = (String)session.getAttribute("id");
            ResultSet r = s.executeQuery("select * from events where id='"+id1+"'");
            r.next();
            if(r.getString("id") != null){
        %>
            <div class="container">
                <table border="1">
                    <tr>
                        <th>
                            Date
                        </th>
                        <th>
                            Time
                        </th>
                        <th>
                            Event
                        </th>
                    </tr>
        <%
            do{
                %>
                <tr>
                    <td>
                        <%
                            String d = r.getString("edate");    
                        %>
                        <%= d %>
                    </td>
                    <td>
                        <%
                            String t = r.getString("etime");    
                        %>
                        <%= t %>
                    </td>
                    <td>
                        <%
                            String m = r.getString("msg");       
                        %>
                        <%= m %>
                    </td>
                </tr>
                <%
            }while(r.next());
            }else{
                %>
                    <div class="nodata">
                        <p>Your data will be displayed here</p>
                    </div>
                <%
            }
        %>
                </table>
        </div>
    </body>
</html>