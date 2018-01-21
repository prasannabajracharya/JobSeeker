package controller;

import com.google.gson.Gson;
import database.DBConnector;
import model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 * Created by kcp on 5/20/17.
 */
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = DBConnector.getConnection(request, response);

        HashMap<String, String> jsonData = new HashMap<String, String>();

        try {
            if (loginAuthentication(connection, request, response)) {
                jsonData.put("status", "success");
                jsonData.put("message", "Login Success!");

            } else {
                jsonData.put("status", "fail");
                jsonData.put("message", "Invalid Login Credentials!");
            }
        } catch (SQLException e) {
            jsonData.put("status", "fail");
            jsonData.put("message", "Oops, something went wrong!");
        }

        Gson gson = new Gson();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(jsonData));
        out.flush();
    }

    private boolean loginAuthentication(Connection connection, HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String sql = "SELECT * FROM users WHERE (username=? AND password=?)";

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, request.getParameter("username"));
        ps.setString(2, request.getParameter("password"));

        ResultSet resultSet = ps.executeQuery();
        Users user;

        if (resultSet.next()) {
            user = new Users();
            String userid = resultSet.getInt("userid")+"";
            user.setUserid(userid);
            user.setFullName(resultSet.getString("fullname"));
            user.setUsername(resultSet.getString("username"));
            user.setGender(resultSet.getString("gender"));
            user.setState(resultSet.getString("state"));
            user.setCity(resultSet.getString("city"));
            user.setState(resultSet.getString("street"));
            user.setZipcode(resultSet.getString("zipcode"));
            user.setBirthyear(resultSet.getString("birthyear"));
            user.setEmail(resultSet.getString("email"));
            user.setPassword(resultSet.getString("password"));
            user.setDatecreated(resultSet.getString("datecreated"));
            user.setDateupdated(resultSet.getString("dateupdated"));
            user.setImageurl(resultSet.getString("imageurl"));

            request.getSession().setAttribute("loggedInUser", user);
            return true;
        } else {
            return false;
        }
    }
}
