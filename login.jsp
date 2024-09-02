<%
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	if(uid.equals("sai") && pwd.equals("sai")){
		out.println("Welcome Sai");
	}else{
		out.println("Incorrect user id or password");
	}
%>