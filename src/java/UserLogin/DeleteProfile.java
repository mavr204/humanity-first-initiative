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
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author gamer
 */
public class DeleteProfile extends HttpServlet {
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        
        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            
            String sql = "SELECT COUNT(*) FROM member WHERE username = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, username);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            
            if (resultSet.next() && resultSet.getInt(1) > 0){
                sql = "DELETE FROM member WHERE username = ?";
                preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                preparedStatement.setString(1, username);
                preparedStatement.executeUpdate();
            }
            
            resultSet.close();
            preparedStatement.close();
            connection.close();
            
            response.sendRedirect("Dashboard");
        } catch (SQLException ex) {
             Logger.getLogger(DeleteProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
