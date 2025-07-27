/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package CreateUser;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;

/**
 *
 * @author gamer
 */
public class CreateUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Gets the username and password
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        
        //Creates the necesary objects for database connection and creating a session
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        try {
            //puts the password on the Session
            session.setAttribute("password", password);
            
            //Initiates the database connection
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            String sql = "SELECT COUNT(*) FROM MEMBER WHERE USERNAME = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, username);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            
            //Closest the database connection and checks usrname validity
            boolean isExistingUsername = resultSet.next() && resultSet.getInt(1) > 0;
            resultSet.close();
            preparedStatement.close();
            connection.close();
            if(isExistingUsername){
                response.sendRedirect("SignUppt2B.jsp");
            }
            else{
                session.setAttribute("username", username);
                response.sendRedirect("SetProfile.jsp");
            }
        }catch(SQLException ex){
            Logger.getLogger(CreateUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
