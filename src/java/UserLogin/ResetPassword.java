/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UserLogin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import oracle.jdbc.*;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.DriverManager;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author gamer
 */
public class ResetPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            String sql = "SELECT COUNT(*) FROM MEMBER WHERE EMAIL = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, email);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            boolean isValid = resultSet.next() && resultSet.getInt(1) > 0;
            resultSet.close();
            preparedStatement.close();
            connection.close();
            
            if (isValid) {
                String otp = generateOTP(6);
                sendConfirmEmail(email, otp);
                HttpSession session = request.getSession();
                session.setAttribute("otp", otp);
                session.setAttribute("email", email);
                response.sendRedirect("ResetPasswordB.jsp");
            }
            else{
                out.println("<html><head><title>404</title>");
                out.println("<script type='text/javascript'>");
                out.println("setTimeout(function(){ window.location.href='ResetPasswordA.html'; }, 2000);"); // 2000 milliseconds (2 seconds) delay
                out.println("</script>");
                out.println("</head><body>");
                out.println("<h1>404 - Email Not Found</h1>");
                out.println("</body></html>");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private static String generateOTP(int length) {
        String numbers = "0123456789";
        Random random = new Random();
        StringBuilder otp = new StringBuilder();
        int index;

        for (int i = 0; i < length; i++) {
            index = random.nextInt(numbers.length());
            otp.append(numbers.charAt(index));
        }

        return otp.toString();
    }
    protected void sendConfirmEmail(String email, String otp) {
        final String loginID = "humanityfirstinitiative.org@gmail.com";
        final String password = "sqcxssonhqjirdof";
        // SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", true);
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587"); // Adjust the port as needed

        // Create a Session object with authentication
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(loginID, password);
            }
        });

        // Email content
        String subject = "Email Confirmation";
        String body = "Here is your OTP: " + otp;
        String from = "humanityfirstinitiative.org@gmail.com";
        String to = email;

        try {
            // Create a message
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent(body, "text/html");
 
            // Send the message
            Transport.send(message);
            
        } catch (MessagingException ex) {
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
