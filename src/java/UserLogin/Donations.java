/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package UserLogin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;
import oracle.jdbc.*;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author gamer
 */
public class Donations extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final int entriesPerPage = 10;
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int offset = (page - 1) * entriesPerPage;
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        PrintWriter out = response.getWriter();
        
        try {
            //Establish a connection
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            
            //Preapare query to get the entries
            String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY payment_date DESC) AS row_num, payment_table.* FROM payment_table) WHERE row_num > ? AND row_num <= (? + ?) ORDER BY payment_date DESC";

            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setInt(1, offset);
            preparedStatement.setInt(2, offset+1);
            preparedStatement.setInt(3, entriesPerPage);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            
            //makes a list of the last ten entries
            List<Payment> payments = new ArrayList<>();
            while (resultSet.next()) {
                Payment payment = new Payment(resultSet.getString("transaction_id"), 
                        resultSet.getString("name"), resultSet.getDate("payment_date"), 
                        resultSet.getString("amount"), resultSet.getString("card_number"), 
                        resultSet.getString("email"));
                payments.add(payment);
            }
            request.setAttribute("payments", payments);
            // Set pagination attributes
            request.setAttribute("page", page);
            request.setAttribute("entriesPerPage", entriesPerPage);
            request.setAttribute("offset", offset);
            request.getRequestDispatcher("DonationsMember.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Donations.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
