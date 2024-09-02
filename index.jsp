
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement, java.security.MessageDigest" %>  
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="style.css"/>
		<title>Server Side application</title>
	</head>
	<body>
		<%
			String uid = request.getParameter("uid");
			if(uid==null){ 
		%>
				<div class="container">
					<h1>Login form</h1>		
					<form method=POST action=index.jsp>
						<input type=text name=uid placeholder="User ID"><br>
						<input type=password name=pwd placeholder="password"><br>
						<input id="sub" type=submit value="Submit">
					</form>
				</div>
				<div class="count">
					<p>
						If you are a new user <a href="signup.jsp">Sign up</a>
					</p>
				</div>
				<div class="count">
					<%
					String count = (String)application.getAttribute("userCount");
					if(count == null){
						count = "1";
						application.setAttribute("userCount", count);
					}else{
						int c = Integer.parseInt(count);
						c++;
						application.setAttribute("userCount", c+"");
					}
					out.println("<center>You are visitor No. "+count+"</center>");
					%>
				</div>
		<%
			}else{
				String pwd = request.getParameter("pwd");
				Connection c = (Connection)application.getAttribute("dbcon");
				Statement s = c.createStatement();
				ResultSet r = s.executeQuery("select * from accounts where uid='"+uid+"'");
				if(r == null){
					out.println("User not exists");
					%>
						<jsp:forward page="index.jsp"/>
					<%
				}
				r.next();
				String apwd = r.getString("pwd");
				String salt = r.getString("salt");
				String spwd = salt + pwd;

				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(spwd.getBytes());
				byte[] b = md.digest();
				StringBuilder sb = new StringBuilder();
				for(int i=0; i < b.length ;i++) {
					sb.append(String.format("%02x", b[i]));
				}
				String enpwd = sb.toString();

				if(r != null && apwd.equals(enpwd)){
					session.setAttribute("id", uid);
					session.setMaxInactiveInterval(600); 
		%>
					<jsp:forward page="digitalCal.jsp"/>
		<%
				}else{
					out.println("Incorrect user id or password");
		%>
					<p><center><a href="index.jsp">Click here</a> to go to log in</center></p>
		<%
				}
			}	
		%>
	</body>
</html>
