<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>  
<%
      Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\vhema\\Documents\\projects\\apache-tomcat-10.1.28-windows-x64\\apache-tomcat-10.1.28\\webapps\\ROOT\\sample.db");
      Statement statement = con.createStatement();
      
      String id = request.getParameter("id");
      String uname = request.getParameter("uname");
      statement.executeUpdate("insert into person values("+id+",'"+uname+"')");
      connection.close();
      out.println("One record inserted");
%>