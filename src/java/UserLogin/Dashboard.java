/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UserLogin;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.*;
import java.sql.DriverManager;

/**
 *
 * @author gamer
 */
public class Dashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //retreives the username from the session after retrrveing the session in a session object
        HttpSession session = request.getSession(false);
        boolean isAdmin = session.getAttribute("admin") != null;
        String username = (String) session.getAttribute("username");
        PrintWriter  out = response.getWriter();
        
        
        //Declares essential objects for database connectivity
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
            //out.println(username);
            //checks if the entry is available, if it is it sends rquired data to dashboard.jsp otherwose shows a 404 user Not Found
            if(resultSet.next() && resultSet.getString("username").equals(username)){
                String name = resultSet.getString("firstname") + " " + resultSet.getString("lastname");
                long phone =  Long.parseLong(resultSet.getString("phone"));
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
               
                //Closes connection, prepared statement and resultset
                resultSet.close();
                preparedStatement.close();
                connection.close();
                
                //sends a redirect plus the data is sent to the dashboard.jsp
                request.setAttribute("username", username);
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                RequestDispatcher dispatcher;
                if (isAdmin) {
                    dispatcher = request.getRequestDispatcher("Members");
                }
                else{
                    dispatcher = request.getRequestDispatcher("dashboard.jsp");
                }
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
        
        }catch(SQLException ex){
            Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE , null, ex);
        }
    }

}
