import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
public class SendMail {
    public static void main(String[] args) {
        Timer timer = new Timer(true); // Run as a daemon thread
        System.err.println("Hello World! line 21");
        String curDateTime = LocalDateTime.now().toString().substring(0, 16);
        System.err.println(curDateTime);

        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                try {
                    // Connect to SQLite database
                    System.err.println("Hello World! line 30");
                    String curDateTime = LocalDateTime.now().toString().substring(0, 16);
                    System.err.println(curDateTime);
                    Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\\\Users\\\\vhema\\\\Documents\\\\projects\\\\apache-tomcat-10.1.28-windows-x64\\\\apache-tomcat-10.1.28\\\\webapps\\\\ROOT\\\\sample.db");
                    String query = "SELECT * FROM events WHERE edate||'T'||etime = ?";
                    
                    System.err.println(query+" line 36");
                    
                    PreparedStatement stmt = conn.prepareStatement(query);
                    
                    
                    
                    stmt.setString(1, curDateTime);

                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        // Send an email for each matching event
                        String msg = "Your event: "+rs.getString("msg")+" is scheduled now.";
                        System.err.println(msg+" "+rs.getString("id"));
                        sendEmail(rs.getString("id"), "Event Reminder", msg);
                    }

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    System.out.println("Im at line 49 in cache block");
                    e.printStackTrace();
                }
            }
        }, 0, 60000); // Check every minute
    }

    private static void sendEmail(String to, String subject, String body) {
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
        message.setSubject(subject);
        message.setText(body);
        Transport.send(message);
        System.out.println("Mail sent");
    } catch (MessagingException e) {
        throw new RuntimeException(e);
    }
    }
}