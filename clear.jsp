<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>  
<%
    Connection c = (Connection)application.getAttribute("dbcon");
    c.close();
%>