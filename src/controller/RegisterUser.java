package controller;

import database.DBConnector;
import model.Users;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;

/**
 * Created by kcp on 5/19/17.
 */
public class RegisterUser extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Connection con = DBConnector.getConnection(request, response);
        try {
            String sql = "insert into users (fullname, username, gender, state, city, street, zipcode, birthyear, email, password, datecreated, dateupdated, imageurl) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, request.getParameter("register-full-name"));
            ps.setString(2, request.getParameter("register-username"));
            ps.setString(3, request.getParameter("register-gender"));
            ps.setString(4, request.getParameter("register-state"));
            ps.setString(5, request.getParameter("register-city"));
            ps.setString(6, request.getParameter("register-street"));
            ps.setString(7, request.getParameter("register-zip"));
            ps.setString(8, request.getParameter("register-dob"));
            ps.setString(9, request.getParameter("register-email"));
            ps.setString(10, request.getParameter("register-password"));
            ps.setString(11, "2017 May 18");//request.getParameter("register-datecreated")
            ps.setString(12, "today");
            ps.setString(13, "http://lorempixel.com/150/150");//request.getParameter("register-imageurl")
            int result = ps.executeUpdate();
            System.out.println("result:"+result);
            if (result > 0) {
                System.out.println("inside if");
                Users user = new Users();

                user.setFullName(request.getParameter("register-full-name"));
                user.setUsername(request.getParameter("register-username"));
                user.setGender(request.getParameter("register-gender"));
                user.setState(request.getParameter("register-state"));
                user.setCity(request.getParameter("register-city"));
                user.setState(request.getParameter("register-street"));
                user.setZipcode(request.getParameter("register-zip"));
                user.setBirthyear(request.getParameter("register-dob"));
                user.setEmail(request.getParameter("register-email"));
                user.setPassword(request.getParameter("register-password"));


                LocalDateTime psotedTime = LocalDateTime.now();
                Timestamp currentTime = Timestamp.valueOf(psotedTime);
                //TO-DO
                user.setDatecreated(currentTime.toString());
                user.setDateupdated(currentTime.toString());
                user.setImageurl("http://lorempixel.com/150/150");


                String sql1 = "SELECT * FROM users WHERE username=? AND password=?";

                PreparedStatement ps1 = con.prepareStatement(sql1);
                ps1.setString(1, request.getParameter("register-username"));
                ps1.setString(2, request.getParameter("register-password"));

                ResultSet resultSet = ps1.executeQuery();

                while (resultSet.next()) {
                    String userid = resultSet.getInt("userid") + "";
                    user.setUserid(userid);
                    user.setDatecreated(resultSet.getString("datecreated"));
                    user.setDateupdated(resultSet.getString("dateupdated"));
                    user.setImageurl(resultSet.getString("imageurl"));
                }
                request.getSession().setAttribute("loggedInUser", user);

                response.sendRedirect("/InitialLoad");
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            createUser(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
