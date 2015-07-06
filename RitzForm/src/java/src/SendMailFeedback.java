package src;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Administrator
 */
public final class SendMailFeedback {

    String host, port, emailid, username, password;
    Properties props = System.getProperties();
    Session l_session = null;

    public SendMailFeedback(String msg) throws Exception{
        host = "smtp.mail.yahoo.com";
        port = "587";
        emailid = "sudu_ishan@yahoo.com";
        username = "sudu_ishan";
        password = "SLISHAN290";

        emailSettings();
        createSession();
        sendMessage("sudu_ishan@yahoo.com", "sfthelp@gmail.com", "FEEDBACK", msg);
    }

    public void emailSettings() {
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.debug", "true");
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//        props.put("mail.smtp.socketFactory.port", port);
//        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.socketFactory.fallback", "false");

    }

    public void createSession() {

        l_session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        l_session.setDebug(true); // Enable the debug mode

    }

    public boolean sendMessage(String emailFromUser, String toEmail, String subject, String msg) 
                        throws Exception {
        //System.out.println("Inside sendMessage 2 :: >> ");
//        try {
            //System.out.println("Sending Message *********************************** ");
            MimeMessage message = new MimeMessage(l_session);
            emailid = emailFromUser;
            //System.out.println("mail id in property ============= >>>>>>>>>>>>>> " + emailid);
            //message.setFrom(new InternetAddress(emailid));
            message.setFrom(new InternetAddress(this.emailid));

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
//            message.addRecipient(Message.RecipientType.BCC, new InternetAddress(AppConstants.fromEmail));
            message.setSubject(subject);
            message.setContent(msg, "text/html");

            //message.setText(msg);
            Transport.send(message);
            System.out.println("Message Sent");
//        } catch (MessagingException mex) {
//            mex.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }//end catch block
        return true;
    }

//    public static void main(String[] args) {
//        new SendMailFeedback();
//    }
}
