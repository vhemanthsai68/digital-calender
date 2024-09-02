<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<% 
    String to = "rsrsp21@gmail.com";
    String from = "vhemanthsai68@gmail.com";
    final String username = "vhemanthsai68@gmail.com";
    final String password = "vxoykzzuzovvsacm";

    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");

    javax.mail.Session mailSession = javax.mail.Session.getInstance(props, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        Message message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject("Event remainder from Digital Calender");
        message.setText("Hello, this is a test email from a JSP page!");
        Transport.send(message);
        out.println("Sent message successfully....");
    } catch (MessagingException e) {
        throw new RuntimeException(e);
    }
%>
