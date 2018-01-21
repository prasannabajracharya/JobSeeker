package controller;

import com.google.gson.Gson;
import database.DBConnector;
import model.Post;
import model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.HashMap;

/**
 * Created by prasannabajracharya on 5/21/17.
 */

public class SubmitPost extends HttpServlet {

    private boolean addPost(Connection con, Users user, String postContent) throws SQLException, IOException {
        try {
            String sql = "INSERT INTO posts (userid, post, posttype, dateupdated) VALUES(?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            LocalDateTime psotedTime = LocalDateTime.now();
            Timestamp currentTime = Timestamp.valueOf(psotedTime);

            ps.setString(1, user.getUserid());
            ps.setString(2, postContent);
            ps.setString(3, "1");
            ps.setTimestamp(4, currentTime);

            int result = ps.executeUpdate();

            if (result > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private String getLatestPost(Connection con, Users user) throws SQLException {
        Post post = new Post();

        String sql = "SELECT postid, posts.userid, post, posts.datecreated, fullname FROM posts INNER JOIN users ON posts.userid=users.userid ORDER BY posts.postid DESC LIMIT 1";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet resultSet = ps.executeQuery();

        if (resultSet.next()) {
            String postId = resultSet.getInt("postid") + "";

            post.setPostid(postId);
            post.setUserid(resultSet.getString("userid"));
            post.setPostcontent(resultSet.getString("post"));
            post.setDatecreated(resultSet.getString("datecreated").substring(0,15));
            post.setPostedby(resultSet.getString("fullname"));

            post.setTotallikes("0");
            post.setLikedByMe("false");

        }

        Gson gson = new Gson();
        return gson.toJson(post);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBConnector.getConnection(request, response);

        String postContent = request.getParameter("post");

        Users user = (Users) request.getSession().getAttribute("loggedInUser");

        HashMap<String, String> jsonData = new HashMap<String, String>();

        if (user == null) {
            response.sendRedirect("/index.jsp");
            return;
        }

        try {
            if (addPost(con, user, postContent)) {
                jsonData.put("status", "success");
                jsonData.put("post", getLatestPost(con, user));

            } else {
                jsonData.put("status", "fail");
                jsonData.put("message", "Unable To Insert Post!");

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
}
