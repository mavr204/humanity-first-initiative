/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UserLogin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import oracle.jdbc.*;
import jakarta.servlet.http.*;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.DriverManager;

/**
 *
 * @author gamer
 */
public class UserValidation extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        
        try{
            
            //Get the parameters submitted by the form
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            //establish Connection with database
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            
            //Prepare the query statement
            String sql = "SELECT PASSWORD FROM MEMBER WHERE USERNAME = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, username);
            
            //execute the prepared statement and store it in the resultset
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            
            //Check the password validity, if valid create a session to sotre the username
            if (resultSet.next() && password.equals(resultSet.getString("password"))) {
                //Close all the connection, prepared statement and the resultset
                resultSet.close();
                preparedStatement.close();
                
                
                //put the username on the session
                session.setAttribute("username", username);
                
                //checks if the uer is an admin
                sql = "SELECT admin FROM MEMBER WHERE username = ?";
                preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                preparedStatement.setString(1, username);
                resultSet = (OracleResultSet) preparedStatement.executeQuery();
                
                if (resultSet.next() && resultSet.getString("admin") != null && resultSet.getString("admin").equals("yes")) {
                    session.setAttribute("admin", true);
                }
                response.sendRedirect("Home.jsp");
            }
            else {
                //store both username and password provided by the user to the session
                session.setAttribute("username", username);
                session.setAttribute("password", password);
                response.sendRedirect("LoginB.jsp");
            }
        } catch(SQLException ex){
            Logger.getLogger(UserValidation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
