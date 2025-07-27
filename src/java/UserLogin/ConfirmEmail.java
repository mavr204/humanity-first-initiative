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
import java.sql.SQLException;
import oracle.jdbc.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.DriverManager;

/**
 *
 * @author gamer
 */
public class ConfirmEmail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        String username = request.getParameter("token");
        PrintWriter out = response.getWriter();
        
        try{
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            String sql = "SELECT EMAIL FROM UC_EMAIL WHERE TOKEN = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, username);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            
            response.setContentType("text/html");
            out.println("<html><head><title>Success</title>");
            
            if (resultSet.next() && !resultSet.getString("email").isEmpty()){
                String email = resultSet.getString("email");
                
                //Close the resulstSet and the preparedStatement
                resultSet.close();
                preparedStatement.close();
                
                //Checks if the username is on the member table
                sql = "SELECT COUNT(*) FROM MEMBER WHERE USERNAME = ?";
                preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                preparedStatement.setString(1, username);
                resultSet = (OracleResultSet) preparedStatement.executeQuery();
                
                if (resultSet.next() && resultSet.getInt(1) > 0) {
                    //close the prepared statement and resultSet
                    preparedStatement.close();
                    resultSet.close();
                    
                    //update the email
                    sql = "UPDATE MEMBER SET EMAIL = ? WHERE USERNAME = ?";
                    preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                    preparedStatement.setString(1, email);
                    preparedStatement.setString(2, username);
                    preparedStatement.executeUpdate();
                    //Delete the unconfirmed email
                    sql = "DELETE FROM UC_EMAIL WHERE EMAIL = ?";
                    preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                    preparedStatement.setString(1, email);
                    preparedStatement.execute();
                    out.println("The email was confirmed");
                } 
                else{
                    out.println("404 - User Not Found");
                }
            }
            else{
                out.println("404 - Token Not Found");
            }
            // Closes everything
            preparedStatement.close();
            resultSet.close();
            connection.close();
            
            out.println("<html><head><title>Success</title>");
            out.println("<script type='text/javascript'>");
            out.println("setTimeout(function(){ window.location.href='your_redirected_page.jsp'; }, 2000);"); // 2000 milliseconds (2 seconds) delay
            out.println("</script>");
            out.println("</head><body>");
            out.println("<h1>Update Successful</h1>");
            out.println("</body></html>");
        }catch(SQLException ex){
            Logger.getLogger(ConfirmEmail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
