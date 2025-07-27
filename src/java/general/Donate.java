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
import oracle.jdbc.OracleResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.DriverManager;
import java.util.UUID;
import java.sql.Timestamp;

/**
 *
 * @author gamer
 */
public class Donate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        
        String amount = request.getParameter("amount");
        String email = request.getParameter("email");
        String address = request.getParameter("address") + ", " + request.getParameter("pin") + ", " + request.getParameter("city") + ", " + request.getParameter("pin");
        String cardnumber = request.getParameter("cardnumber");
        String cvv = request.getParameter("cvv");
        String name = request.getParameter("name");
        String transactionID = "";
        
        PrintWriter out = response.getWriter();
        try {
            //Establish connection
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            
            //produce a unique transaction id
            String sql = "SELECT COUNT(*) FROM payment_table WHERE transaction_id = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            boolean isValid = false;
            UUID uuid;
            int idLength = 20;
            String transactionBase = "TRANSAC";
            while (!isValid) {                
                uuid = UUID.randomUUID();
                transactionID = transactionBase + uuid.toString();
                transactionID = transactionID.substring(0, Math.min(transactionID.length(), idLength));
                preparedStatement.setString(1, transactionID);
                resultSet = (OracleResultSet)preparedStatement.executeQuery();
                isValid = !(resultSet.next() && resultSet.getInt(1) > 0);
                preparedStatement.close();
                resultSet.close();
            }
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            //prepare Statement
            sql = "INSERT INTO PAYMENT_TABLE (TRANSACTION_ID, NAME, PAYMENT_DATE, AMOUNT, CARD_NUMBER, EMAIL, ADDRESS)  VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, transactionID);
            preparedStatement.setString(2, name);
            preparedStatement.setTimestamp(3, currentTimestamp);
            preparedStatement.setString(4, amount);
            preparedStatement.setString(5, cardnumber);
            preparedStatement.setString(6, email);
            preparedStatement.setString(7, address);
            preparedStatement.execute();
            
            //Close the conenction
            connection.close();
            
            isValid = true;
            
            response.setContentType("text/html;charset=UTF-8");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Success Page</title>");
            out.println("</head>");
            out.println("<body>");
            if (isValid) {
                out.println("<h2>Success!</h2>");
                out.println("<p>Payment was successful.</p>");
            }
            else{
                out.println("<h2>Payment Failed!</h2>");
                out.println("<p>Transaction was denied from the bank.</p>");
            }
            
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
            Logger.getLogger(Donate.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
