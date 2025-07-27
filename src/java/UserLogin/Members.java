package UserLogin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;
import oracle.jdbc.*;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

public class Members extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final int entriesPerPage = 10;
        int page =  1;
        int offset = (page - 1) * entriesPerPage;
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        PrintWriter out = response.getWriter();

        try {
            // Establish a connection
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");

            // Prepare query to get the entries from MEMBER table
            String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, username, firstname, lastname, phone, email, admin FROM (SELECT username, firstname, lastname, phone, email, admin FROM MEMBER ORDER BY username) WHERE ROWNUM <= ?) WHERE rnum >= ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setInt(1, offset + entriesPerPage);
            preparedStatement.setInt(2, offset + 1);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();


            // Make a list of the last ten entries
            List<Member> members = new ArrayList<>();
            while (resultSet.next()) {
                Member member = new Member(resultSet.getString("USERNAME"),
                        resultSet.getString("FIRSTNAME"), resultSet.getString("LASTNAME"), resultSet.getString("PHONE"),
                        resultSet.getString("EMAIL"), resultSet.getString("ADMIN"));
                members.add(member);
            }

            //close the resultset and prepared connections
            preparedStatement.close();
            resultSet.close();

            //prepare statement to get the number of members
            sql = "SELECT COUNT(*) FROM member";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            int memberCount;

            if(resultSet.next() && resultSet.getInt(1) > 0){
                memberCount = resultSet.getInt(1);
            }else{
                memberCount = 0;
            }

            //close the prepared statement and resultset
            resultSet.close();
            preparedStatement.close();

            //get the Total amount of donations
            sql = "SELECT amount FROM payment_table";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            int totalAmount = 0;
            while(resultSet.next()){
                totalAmount += Math.round(Float.parseFloat(resultSet.getString("amount")));
            }
            //close the prepared statement and resultset
            resultSet.close();
            preparedStatement.close();

            //prepare statement to get the number of members
            sql = "SELECT COUNT(*) FROM newsletter";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            int subCount;

            if(resultSet.next() && resultSet.getInt(1) > 0){
                subCount = resultSet.getInt(1);
            }else{
                subCount = 0;
            }
            //close the prepared statement and resultset
            resultSet.close();
            preparedStatement.close();

            request.setAttribute("members", members);
            // Set pagination attributes
            request.setAttribute("memberCount", memberCount);
            request.setAttribute("totalAmount", totalAmount);
            request.setAttribute("subCount", subCount);
            
            request.setAttribute("page", page);
            request.setAttribute("entriesPerPage", entriesPerPage);
            request.setAttribute("offset", offset);
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(Members.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
