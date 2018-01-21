package database;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by kcp on 5/18/17.
 */
public class DBConnector {
    private static Connection con;

    private DBConnector() {

    }

    public static Connection getConnection(HttpServletRequest request, HttpServletResponse response) {
        con = (Connection) request.getServletContext().getAttribute("connection");

        //databse connection
        String driverClass = request.getServletContext().getInitParameter("dbDriver");
        String url = request.getServletContext().getInitParameter("dbUrl");
        String dbUsername = request.getServletContext().getInitParameter("dbUser");
        String dbPassword = request.getServletContext().getInitParameter("dbPass");

        if (con == null) {
            try {
                Class.forName(driverClass);
                con = DriverManager.getConnection(url, dbUsername, dbPassword);
                //storing connection in application context
                request.getServletContext().setAttribute("connection", con);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            con = (Connection) request.getServletContext().getAttribute("connection");
        }

        return con;
    }
}
