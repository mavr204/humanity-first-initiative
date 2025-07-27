/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package general;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
public class Newsletter extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        try {
            //Establish Connection with the database
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            
            //prepare the querry for cheking if the email is existing
            String sql = "SELECT COUNT(*) FROM newsletter WHERE email = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, email);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            boolean isValid = !(resultSet.next() && resultSet.getInt(1) > 0);
            
            //close the prepared statement and the result set
            resultSet.close();
            preparedStatement.close();
            
            if (isValid) {
                //Prepare the query for insertion
                sql = "INSERT INTO newsletter (email) VALUES (?)";
                preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                preparedStatement.setString(1, email);
                preparedStatement.execute();                            
            }
            
            //Close the connection
            preparedStatement.close();
            connection.close();
            
            // Inside your servlet's doGet or doPost method
            response.setContentType("text/html");

            out.println("<html><head><title>Close Window</title></head><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.close();");
            out.println("</script>");
            out.println("</body></html>");

            // Close the writer
            out.close();
        } 
        catch (SQLException ex) {
            Logger.getLogger(FeedbackResponse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
