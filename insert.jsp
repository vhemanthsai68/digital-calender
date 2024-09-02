<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>
<%@ page import="java.io.PrintWriter" %>
<%
    // Initialize variables for database connection and SQL operations
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;

    try {
        // Create a database connection
        connection = DriverManager.getConnection("jdbc:sqlite:sample.db");
        statement = connection.createStatement();
        statement.setQueryTimeout(30);  // Set timeout to 30 sec.

        // Execute SQL statements
        //statement.executeUpdate("drop table if exists person");
        //statement.executeUpdate("create table person (id integer, name string)");
        statement.executeUpdate("insert into person values(2, 'leo')");
        statement.executeUpdate("insert into person values(3, 'yui')");
        statement.executeUpdate("insert into person values(4, 'sai')");

        // Execute a query to retrieve data
        rs = statement.executeQuery("select * from person");

        // Output the results
        out.println("<h2>Person Table Data</h2>");
        out.println("<table border='1'><tr><th>ID</th><th>Name</th></tr>");

        while(rs.next()) {
            // Read and display the result set
            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
            out.println("<td>" + rs.getString("name") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");
    } catch(SQLException e) {
        // Handle SQL exception
        out.println("An error occurred while accessing the database: " + e.getMessage());
        e.printStackTrace(System.err);
    } finally {
        // Close the result set, statement, and connection to avoid resource leaks
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
        if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
    }
%>
