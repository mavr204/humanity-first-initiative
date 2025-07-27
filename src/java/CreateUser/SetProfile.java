/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package CreateUser;

import oracle.jdbc.*;
import java.sql.DriverManager;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gamer
 */
public class SetProfile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                PrintWriter out = response.getWriter();
                HttpSession session = request.getSession();
                
                //holds the attributes in [i] and their name in [j]
                String[][] attributes = {
                    {"", "username"},
                    {"", "firstname"},
                    {"", "lastname"},
                    {"", "nationality"},
                    {"", "address"},
                    {"", "pin"},
                    {"", "city"},
                    {"", "state"},
                    {"", "country"},
                    {"", "bloodgroup"},
                    {"", "phone"},
                    {"", "email"},
                    {"", "profession"},
                    {"", "hobby"},
                    {"", "sex"},
                    {"", "wpnumber"},
                    {"", "password"},
                    {"", "birthdate"},
                };
                
                //initialize the attributes and set the unavailable ones to null
                for (int i = 0, j = 0; i < attributes.length; i++) {
                    attributes[i][j] = request.getParameter(attributes[i][j+1]);
                    if (attributes[i][j] == null || attributes[i][j].equals("") || attributes[i][j].equals("none"))
                      attributes[i][j] = null;
                }
                
                //Declaration of the essential objects for database insertion
                OracleConnection connection;
                OraclePreparedStatement preparedStatement;
                DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
                connection = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
                
                //building the sql connection and preparedstatenent
                String sql = "INSERT INTO member (";
                String values = " VALUES (";
                for (int i = 0; i < attributes.length; i++) {
                    sql = sql.concat(attributes[i][1]);
                    values = values.concat("?");
                    if(i+1 < attributes.length){
                        sql = sql.concat(", ");
                        values = values.concat(", ");
                    }
                }
                sql = sql.concat(", admin)" + values + ", ?)");
                preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                
                //Formats the date into YYYY-MM-DD
                DateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");
                DateFormat targetFormat = new SimpleDateFormat("dd-MMM-yyyy");
                Date date;
                
                
                for (int i = 0; i < attributes.length; i++) {
                    if (attributes[i][1].equals("birthdate")) {
                        date = originalFormat.parse(attributes[i][0]);
                        attributes[i][0] = targetFormat.format(date);
                    }
                }
                
                //initates the prepared statement
                int count = 1;
                for(int i = 0, j =0; i < attributes.length; i++){
                    preparedStatement.setString((i+1), attributes[i][j]);
                    count++;
                }
                preparedStatement.setString(count, "NO");
                int x = preparedStatement.executeUpdate();
                
                //Terminate preparedStatement
                preparedStatement.close();
                
                if(x > 0){
                    //delete the email from the unconfirmed table
                    sql = "DELETE FROM UC_EMAIL WHERE EMAIL = ?";
                    preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                    preparedStatement.setString(1, (String) session.getAttribute("email"));
                    preparedStatement.executeQuery();
                    
                    //closes the connection and the preparedStatement
                    preparedStatement.close();
                    connection.close();
                    
                    //removes the password and the email from the session and redirects to dashboard
                    session.removeAttribute("password");
                    session.removeAttribute("email");
                    response.sendRedirect("Dashboard");
                }else{
                    response.setContentType("text/html");
                    out.println("<h2>Failed to create Account</h2>");
                }
            } catch (SQLException | ParseException ex) {
                Logger.getLogger(SetProfile.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
}
