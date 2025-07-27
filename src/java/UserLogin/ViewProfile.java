/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UserLogin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;

/**
 *
 * @author gamer
 */
public class ViewProfile extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //retreives the username from the session after retrrveing the session in a session object
        String username = request.getParameter("username");
        
        //Declares essential objects for database connectivity
        PrintWriter out = response.getWriter();
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        
        try{
        //Establishes connection with database
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            
            //Prepares statement for sql query
            String sql = "SELECT * FROM MEMBER WHERE USERNAME = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, username);
            
            //gets the result from the database query and stores it in the resultset
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            
            //checks if the entry is available, if it is it sends rquired data to dashboard.jsp otherwose shows a 404 user Not Found
            if(resultSet.next() && resultSet.getString("username").equals(username)){
                String firstName = (resultSet.getString("firstname") != null) ? resultSet.getString("firstname") : "";
                String lastName = (resultSet.getString("lastname") != null) ? resultSet.getString("lastname") : "";
                String nationality = (resultSet.getString("nationality") != null) ? resultSet.getString("nationality") : "";
                String address = (resultSet.getString("address") != null) ? resultSet.getString("address") : "";
                String pin = (resultSet.getString("pin") != null) ? resultSet.getString("pin") : "";
                String city = (resultSet.getString("city") != null) ? resultSet.getString("city") : "";
                String state = (resultSet.getString("state") != null) ? resultSet.getString("state") : "";
                String country = (resultSet.getString("country") != null) ? resultSet.getString("country") : "";
                String bloodgroup = (resultSet.getString("bloodgroup") != null) ? resultSet.getString("bloodgroup") : "";
                long phone = (resultSet.getString("phone") != null) ? Long.parseLong(resultSet.getString("phone")) : 0;
                String email = (resultSet.getString("email") != null) ? resultSet.getString("email") : "";
                String profession = (resultSet.getString("profession") != null) ? resultSet.getString("profession") : "";
                String hobby = (resultSet.getString("hobby") != null) ? resultSet.getString("hobby") : "";
                String sex = (resultSet.getString("sex") != null) ? resultSet.getString("sex") : "";
                long wpNumber = (resultSet.getString("wpnumber") != null) ? Long.parseLong(resultSet.getString("wpnumber")) : 0;
                String password = (resultSet.getString("password") != null) ? resultSet.getString("password") : "";
                String birthdate = (resultSet.getString("birthdate") != null) ? resultSet.getString("birthdate") : "";

               
               DateFormat targeFormat = new SimpleDateFormat("yyyy-MM-dd");
               DateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               Date date = originalFormat.parse(birthdate);
               birthdate = targeFormat.format(date);
               out.println(birthdate);
                
                //Closes connection, prepared statement and resultset
                resultSet.close();
                preparedStatement.close();
                connection.close();
                
                //sends a redirect plus the data is sent to the dashboard.jsp
                request.setAttribute("username", username);
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("nationality", nationality);
                request.setAttribute("address", address);
                request.setAttribute("pin", pin);
                request.setAttribute("city", city);
                request.setAttribute("state", state);
                request.setAttribute("country", country);
                request.setAttribute("bloodgroup", bloodgroup);
                request.setAttribute("phone", phone);
                request.setAttribute("email", email);
                request.setAttribute("profession", profession);
                request.setAttribute("hobby", hobby);
                request.setAttribute("sex", sex);
                request.setAttribute("wpnumber", wpNumber);
                request.setAttribute("birthdate", birthdate);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ViewProfile.jsp");
                dispatcher.forward(request, response);
                
            }
            else{
                //Closes connection, prepared statement and resultset
                resultSet.close();
                preparedStatement.close();
                connection.close();
                
                response.setContentType("text/html");
                out.println("<h1>404 - User not found</h1>");
            }
        
        }catch(SQLException | ParseException ex){
            Logger.getLogger(ViewProfile.class.getName()).log(Level.SEVERE , null, ex);
        }
    }

}
