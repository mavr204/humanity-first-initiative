package CreateUser;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import oracle.jdbc.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author gamer
 */
public class MailCheck extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        PrintWriter out = response.getWriter();
        //Declare connection
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        try{
            //establish Connection and preaparing the query statement
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            String sql = "SELECT COUNT(*) FROM member WHERE email = ?";
            preparedStatement = (OraclePreparedStatement)connection.prepareCall(sql);
            preparedStatement.setString(1, email);//checks email validity on the member table
            
            //get the results from the query and check if the given email is unique on the member database
            resultSet = (OracleResultSet)preparedStatement.executeQuery();
            boolean isDuplicate = resultSet.next() && resultSet.getInt(1) > 0;
            
            //close the prepared statement and the result statement
            preparedStatement.close();
            resultSet.close();
            
            //If it is a already exisiting email sends to sign up pt1B
            if(isDuplicate){
                //close the connection
                connection.close();
                response.sendRedirect("SignUppt1B.html");
            }
            else{
                //prepares the query for the unconfirmed table
                sql = "SELECT token FROM uc_email WHERE email = ?";
                preparedStatement = (OraclePreparedStatement)connection.prepareCall(sql);
                preparedStatement.setString(1, email);//checks email validity on the unconfirmed table

                //get the results from the query and check if the given email is unique on the unconfirmed table
                resultSet = (OracleResultSet)preparedStatement.executeQuery();
                boolean isUnConfirmed = resultSet.next() && !resultSet.getString("token").isEmpty();

                //if the email exists in the unconfirmed email then get its token
                String token = "";
                if(isUnConfirmed){
                    token = resultSet.getString("token");
                }

                //close the prepared statement and the result statement
                preparedStatement.close();
                resultSet.close();
            
                //Creates a unique token
                boolean isTokenExisting = true;
                sql = "SELECT COUNT(*) FROM uc_email WHERE token = ?";
                while(isTokenExisting && !isUnConfirmed){
                    token = UUID.randomUUID().toString();
                    preparedStatement = (OraclePreparedStatement)connection.prepareCall(sql);
                    preparedStatement.setString(1, token);//checks if it is an existing token
                    resultSet = (OracleResultSet)preparedStatement.executeQuery();
                    isTokenExisting = resultSet.next() && resultSet.getInt(1) > 0;
                    resultSet.close();
                    preparedStatement.close();
                }
                
                //sends email
                sendConfirmEmail(email, token);
                
                
                //Adds the entry to the unconfirmed table if It is not already there
                if(!isUnConfirmed){
                    sql = "INSERT INTO UC_EMAIL (EMAIL, TOKEN) VALUES (?, ?)";
                    preparedStatement = (OraclePreparedStatement)connection.prepareCall(sql);
                    preparedStatement.setString(1, email);
                    preparedStatement.setString(2, token);
                    preparedStatement.executeQuery();
                }
                //close the connection
                preparedStatement.close();
                connection.close();
                out.println("<h3>Check Email for a registration link! <br>!If not found check spam.</h3>");
            }
        } catch (SQLException ex){
            Logger.getLogger(SetProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        protected void sendConfirmEmail(String email, String token) {
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

        // Construct the confirmation link
        String confirmationLink = "http://localhost:8080/HFI/VerifyToken?token=" + token;

        // Email content
        String subject = "Email Confirmation";
        String body = "Click the link below to confirm your email address:<br><a href='" + confirmationLink + "'>" + confirmationLink + "</a>";
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
            Logger.getLogger(MailCheck.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
