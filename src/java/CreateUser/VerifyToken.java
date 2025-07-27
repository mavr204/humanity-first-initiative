/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package CreateUser;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
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
public class VerifyToken extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Declaration of essential objects
        PrintWriter out = response.getWriter();
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        
        try {
            //Creates the connection
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");;
            
            //creates a Prepared statement to verify the token provided by the user link
            String token = request.getParameter("token");
            String sql = "SELECT email FROM uc_email WHERE token = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, token);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            
            //based on the result either redirects to the desired page or shows meesage that the token do not match
            if (!resultSet.next() || resultSet.getString("email").isEmpty()) {
                //closes the connection
                resultSet.close();
                preparedStatement.close();
                connection.close();
                out.println("Token Was not found");
               
            } else {
                //Stores the email in a session
                String email = resultSet.getString("email");
                HttpSession session = request.getSession(true);
                session.setAttribute("email", email);
                //closes the connection
                resultSet.close();
                preparedStatement.close();
                connection.close();
                response.sendRedirect("SignUppt2A.html");
            }
        }catch (SQLException ex){
            Logger.getLogger(VerifyToken.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
