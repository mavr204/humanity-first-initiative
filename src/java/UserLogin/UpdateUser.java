package UserLogin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.DriverManager;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.*;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Logger;
import java.util.logging.Level;
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
public class UpdateUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html><head><title>Success</title>");
        
        //Declare the important objects for the databse connection
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        
        //retreive the session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
       try{
                //Connect to the database
                DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
                connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");

                //Preapare sql query
                String sql = "SELECT * FROM MEMBER WHERE USERNAME = ?";
                preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                preparedStatement.setString(1, username);
                
                //execute the query and Set the values to resultSet
                resultSet = (OracleResultSet) preparedStatement.executeQuery();
                boolean isValid = resultSet.next() && resultSet.getString("username").equals(username);
                
                //close the prepared statement and resultset
                resultSet.close();
                preparedStatement.close();

               //check if the user actually exists
              if(isValid){
                    //Get the values from the Form
                    String newUsername = request.getParameter("username");
                    String newFirstName = request.getParameter("firstname");
                    String newLastName = request.getParameter("lastname");
                    String newNationality = request.getParameter("nationality");
                    String newAddress = request.getParameter("address");
                    String newPin = request.getParameter("pin");
                    String newCity = request.getParameter("city");
                    String newState = request.getParameter("state");
                    String newCountry = request.getParameter("country");
                    String newBloodgroup = request.getParameter("bloodgroup");
                    String newPhone = request.getParameter("phone");
                    String newEmail = request.getParameter("email");
                    String newProfession = request.getParameter("profession");
                    String newHobby = request.getParameter("hobby");
                    String newSex = request.getParameter("sex");
                    String newWpNumber = request.getParameter("wpnumber");
                    String newPassword = request.getParameter("password");
                    String newBirthdate = request.getParameter("birthdate");
                    
                    //Create the update query
                    sql = "UPDATE member " +
                    "SET " +
                    "firstname = ?, " +
                    "lastname = ?, " +
                    "nationality = ?, " +
                    "address = ?, " +
                    "pin = ?, " +
                    "city = ?, " +
                    "state = ?, " +
                    "country = ?, " +
                    "bloodgroup = ?, " +
                    "phone = ?,  " +
                    "profession = ?,  " +
                    "hobby = ?,  " +
                    "sex = ?, " +
                    "wpnumber = ?,  " +
                    "password = ?,  " +
                    "birthdate = ?  " +
                    "WHERE " +
                    "username = ?";

                    //Convert the birth date to a proper format
                    DateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");
                    DateFormat targetFormat = new SimpleDateFormat("dd-MMM-yyyy");
                    Date date = originalFormat.parse(newBirthdate);
                    newBirthdate = targetFormat.format(date);
                    //intialize the prepared statement
                    preparedStatement = (OraclePreparedStatement) connection.prepareStatement(sql);
                    preparedStatement.setString(1, newFirstName);
                    preparedStatement.setString(2, newLastName);
                    preparedStatement.setString(3, newNationality);
                    preparedStatement.setString(4, newAddress);
                    preparedStatement.setString(5, newPin);
                    preparedStatement.setString(6, newCity);
                    preparedStatement.setString(7, newState);
                    preparedStatement.setString(8, newCountry);
                    preparedStatement.setString(9, newBloodgroup);
                    preparedStatement.setString(10, newPhone);
                    preparedStatement.setString(11, newProfession);
                    preparedStatement.setString(12, newHobby);
                    preparedStatement.setString(13, newSex);
                    preparedStatement.setString(14, newWpNumber);
                    preparedStatement.setString(15, newPassword);
                    preparedStatement.setString(16, newBirthdate);
                    preparedStatement.setString(17, username);
                    preparedStatement.executeUpdate();
                    
                    //Close the perpared statement
                    preparedStatement.close();
                    
                    if(!username.equals(newUsername)){
                        //Check if the new username exists
                        sql = "SELECT COUNT(*) FROM MEMBER WHERE USERNAME = ?";
                        preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                        preparedStatement.setString(1, newUsername);
                        resultSet = (OracleResultSet) preparedStatement.executeQuery();
                        isValid  = !(resultSet.next() && resultSet.getInt(1) > 0);
                        resultSet.close();
                        preparedStatement.close();

                        //update the username if the username is unique
                        if(isValid){
                            sql = "UPDATE MEMBER SET USERNAME = ? WHERE USERNAME = ?";
                            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                            preparedStatement.setString(1, newUsername);
                            preparedStatement.setString(2, username);
                            preparedStatement.executeUpdate();

                            //update the session
                            session.removeAttribute("username");
                            session.setAttribute("username", newUsername);
                            username = newUsername;
                        }
                        else {
                            out.println("The username could not be changed as it already is registered to this database.");
                        }
                    }
                    
                    //check if the email is changed
                    sql = "SELECT EMAIL FROM MEMBER WHERE USERNAME = ?";
                    preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                    preparedStatement.setString(1, username);
                    resultSet = (OracleResultSet) preparedStatement.executeQuery();
                    isValid  = !(resultSet.next() && resultSet.getString("email").equals(newEmail));
                    resultSet.close();
                    preparedStatement.close();
                    
                    if (isValid) {
                        //check if the email exists
                        sql = "SELECT COUNT(*) FROM MEMBER WHERE EMAIL = ?";
                        preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                        preparedStatement.setString(1, newEmail);
                        resultSet = (OracleResultSet) preparedStatement.executeQuery();
                        isValid  = !(resultSet.next() && resultSet.getInt(1) > 0);
                        resultSet.close();
                        preparedStatement.close();

                        //send a confirmation email and send in the username as a token
                        if (isValid) {
                          //check if the email exists in the unconfirmed table
                          sql = "SELECT COUNT(*) FROM UC_EMAIL WHERE EMAIL = ?";
                            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                            preparedStatement.setString(1, newEmail);
                            resultSet = (OracleResultSet) preparedStatement.executeQuery();
                            isValid  = (resultSet.next() && resultSet.getInt(1) > 0);
                            resultSet.close();
                            preparedStatement.close();

                            sendConfirmEmail(newEmail, username);
                            
                            //Updates the uc_table if the email exists
                            if (isValid) {
                                sql = "UPDATE UC_EMAIL SET EMAIL = ? WHERE TOKEN = ?";
                                preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                                preparedStatement.setString(1, newEmail);
                                preparedStatement.setString(2, username);
                                preparedStatement.executeUpdate();
                                preparedStatement.close();
                            }
                            else{
                                sql = "INSERT INTO UC_EMAIL (EMAIL, TOKEN) VALUES (?, ?)";
                                preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                                preparedStatement.setString(1, newEmail);
                                preparedStatement.setString(2, username);
                                preparedStatement.execute();
                                preparedStatement.close();
                            }
                            out.println("Please confirm your identity by clicking the link sent to your email. Check spame if not found.");
                        }
                        else{
                            out.println("The email is already registered with an account");
                        }
                    }
              }
                    
                   out.println("<script type='text/javascript'>");
                   out.println("setTimeout(function(){ window.location.href='Dashboard'; }, 2000);"); // 2000 milliseconds (2 seconds) delay
                   out.println("</script>");
                   out.println("</head><body>");
                   out.println("<h1>User Profile Updated</h1>");
                   out.println("</body></html>");
       } catch(SQLException | ParseException ex){
           Logger.getLogger(UpdateUser.class.getName()).log(Level.SEVERE, null, ex);
       }
    }
        protected void sendConfirmEmail(String email, String token) {
            final String loginID = "humanityfirstinitiave.org@gmail.com";
            final String password = "ndqweknofqusconm";
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
            String confirmationLink = "http://localhost:8080/HFI/ConfirmEmail?token=" + token;

            // Email content
            String subject = "Email Confirmation";
            String body = "Click the link below to confirm your email address:<br><a href='" + confirmationLink + "'>" + confirmationLink + "</a>";
            String from = "humanityfirstinitiave.org@gmail.com";
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
                Logger.getLogger(UpdateUser.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
}