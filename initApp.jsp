<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>  
<%
    Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\vhema\\Documents\\projects\\apache-tomcat-10.1.28-windows-x64\\apache-tomcat-10.1.28\\webapps\\ROOT\\sample.db");
    application.setAttribute("dbcon", con);
%>
<html>
    <body>
        <center>Successfully initialized Sqlite</center>
    </body>
</html>