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
import jakarta.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author gamer
 */
public class Complaint extends HttpServlet {
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        PrintWriter out = response.getWriter();
        
        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            

            String sql = "INSERT INTO complaint (name, email, message) VALUES (?, ?, ?)";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, request.getParameter("name"));
            preparedStatement.setString(2, request.getParameter("email"));
            preparedStatement.setString(3, request.getParameter("text"));
            preparedStatement.execute();
            
            preparedStatement.close();
            connection.close();
            
            response.setContentType("text/html;charset=UTF-8");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Success Page</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>Success!</h2>");
            out.println("<p>Payment was successful.</p>");
            out.println("<script>");
            
            HttpSession session = request.getSession(false);
            if (session != null)
                out.println( " setTimeout(function() { window.location.href = 'Home.jsp'; }, 2000);" );
            else{
                out.println( " setTimeout(function() { window.location.href = 'index.html'; }, 2000);" );
            }        
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
             Logger.getLogger(Complaint.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
