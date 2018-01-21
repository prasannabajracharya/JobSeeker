package controller;

import com.google.gson.Gson;
import database.DBConnector;
import model.Post;
import model.Users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by kcp on 5/22/17.
 */
public class InitialLoad extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBConnector.getConnection(request, response);

        Users user = (Users) request.getSession().getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("/index.jsp");
            return;
        }

        HashMap<String, String> jsonData = new HashMap<String, String>();

        try {
            List<Post> posts = getAllPost(con, user);

            if (posts != null) {
                request.setAttribute("posts", posts);
            } else {
                request.setAttribute("error", "no post available");
            }
        } catch (SQLException e) {
            request.setAttribute("error", "could not load posts");
        }

        RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    private List<Post> getAllPost(Connection con, Users user) throws SQLException {
        List<Post> postList = new ArrayList<>();
        String sql = "SELECT postid, posts.userid, post, posts.datecreated, fullname FROM posts INNER JOIN users ON posts.userid=users.userid ORDER BY posts.postid DESC";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet resultSet = ps.executeQuery();

        while (resultSet.next()) {
            Post post = new Post();

            post.setPostid(resultSet.getString("postid"));
            post.setUserid(resultSet.getString("userid"));
            post.setPostcontent(resultSet.getString("post"));
            post.setDatecreated(resultSet.getString("datecreated"));
            post.setPostedby(resultSet.getString("fullname"));

            String sql2 = "SELECT COUNT(*) FROM likes WHERE postid=?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, post.getPostid());
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                post.setTotallikes(rs2.getString(1));
            } else {
                post.setTotallikes("0");
            }

            String sql3 = "SELECT * FROM likes WHERE postid=? AND userid=? LIMIT 1";
            PreparedStatement ps3 = con.prepareStatement(sql3);

            ps3.setString(1, post.getPostid());
            ps3.setString(2, user.getUserid());
            ResultSet resultSet1 = ps3.executeQuery();

            if (resultSet1.next()) {
                post.setLikedByMe("true");
            } else {
                post.setLikedByMe("false");
            }

            postList.add(post);

        }
        return postList;

    }
}
