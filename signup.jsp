<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement, java.security.MessageDigest, java.security.SecureRandom, java.util.Base64" %>  
<html>
    <head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="style.css"/>
		<title>Sign up form</title>
	</head>
    <body>
        <%
            Connection c = (Connection)application.getAttribute("dbcon");
            Statement s = c.createStatement();
            String usId = request.getParameter("usid");
            ResultSet r = s.executeQuery("select * from accounts where uid='"+usId+"'");
            if(usId == null){ 
        %>
                <div class="container">
                <h1>Sign up</h1>
                <form method="POST" action="signup.jsp">
                    <input type="text" name="usid" placeholder="Enter user id"><br>
                    <input type="password" name="pwd" placeholder="Enter new password"><br>
                    <input type="submit" value="Submit">
                </form>
                </div>
        <%
            }else{
                if(r.getString("uid") != null){
                    out.println("UserID already exists");
                }else{
                    String pass = request.getParameter("pwd");
                    String salt = null;
                    String spwd = null;
                    String enpwd = null;
     
                    SecureRandom sr = new SecureRandom();
                    byte[] saltBytes = new byte[16]; // 128-bit salt
                    sr.nextBytes(saltBytes);
                    
                    // Convert salt to Base64 string for storage
                    salt = Base64.getEncoder().encodeToString(saltBytes);
                    
                    // Combine salt and password
                    spwd = salt + pass;

                    MessageDigest md = MessageDigest.getInstance("SHA-256");
                    md.update(spwd.getBytes());
                    byte[] b = md.digest();
                    StringBuilder sb = new StringBuilder();
                    for(int i=0;i < b.length;i++) {
                        sb.append(String.format("%02x", b[i]));
                    }
                    enpwd = sb.toString();
                    s.executeUpdate("insert into accounts values('"+usId+"','"+enpwd+"','"+salt+"')");
                    out.println("User created successfully");
        %>
                    <center><a href="index.jsp">Click here</a> to go to log in</center>
        <%
                }
            }
        %>
    </body>
</html>