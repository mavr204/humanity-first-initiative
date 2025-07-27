/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package general;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import oracle.jdbc.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;


/**
 *
 * @author gamer
 */
public class FeedbackResponse extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        PrintWriter out = response.getWriter();
        
        String rating = request.getParameter("rating");
        String text = request.getParameter("text");
        try {
            //Establish Connection with the database
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            
            //Prepare the query
            String sql = "INSERT INTO feedback (rating, text) VALUES (?, ?)";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, rating);
            preparedStatement.setString(2, text);
            preparedStatement.execute();
            
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
