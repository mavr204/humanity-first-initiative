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
import jakarta.servlet.http.HttpSession;
import oracle.jdbc.*;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.DriverManager;
/**
 *
 * @author gamer
 */
public class ResetPasswordB extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        
        OracleConnection connection;
        OraclePreparedStatement preparedStatement;
        OracleResultSet resultSet;
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            connection = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orclp", "admin", "database");
            String sql = "SELECT COUNT(*) FROM MEMBER WHERE EMAIL = ?";
            preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
            preparedStatement.setString(1, email);
            resultSet = (OracleResultSet) preparedStatement.executeQuery();
            boolean isValid = resultSet.next() && resultSet.getInt(1) > 0;
            resultSet.close();
            preparedStatement.close();
            
            if (isValid) {
                String otp = (String) session.getAttribute("otp");
                String inputOTP = request.getParameter("otp");
                String password = request.getParameter("password");
                
                if (inputOTP.equals(otp)) {
                    sql = "UPDATE MEMBER SET PASSWORD = ? WHERE EMAIL = ?";
                    preparedStatement = (OraclePreparedStatement) connection.prepareCall(sql);
                    preparedStatement.setString(1, password);
                    preparedStatement.setString(2, email);
                    preparedStatement.executeUpdate();
                    connection.close();
                    out.println("<html><head><title>Success</title>");
                    out.println("<script type='text/javascript'>");
                    out.println("setTimeout(function(){ window.location.href='LoginA.html'; }, 3000);"); // 2000 milliseconds (2 seconds) delay
                    out.println("</script>");
                    out.println("</head><body>");
                    out.println("<h1>Password Updated</h1>");
                    out.println("</body></html>");
                }
                else{
                    out.println("<html><head><title>404</title>");
                    out.println("<script type='text/javascript'>");
                    out.println("setTimeout(function(){ window.location.href='ResetPasswordB.jsp'; }, 2000);"); // 2000 milliseconds (2 seconds) delay
                    out.println("</script>");
                    out.println("</head><body>");
                    out.println("<h1>404 Incorrect OTP</h1>");
                    out.println("</body></html>");
                    connection.close();
                }
            }
            else{
                out.println("<html><head><title>404</title>");
                out.println("<script type='text/javascript'>");
                out.println("setTimeout(function(){ window.location.href='ResetPasswordA.html'; }, 2000);"); // 2000 milliseconds (2 seconds) delay
                out.println("</script>");
                out.println("</head><body>");
                out.println("<h1>404 - Email Not Found</h1>");
                out.println("</body></html>");
                connection.close();
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
