package controller;

import com.google.gson.Gson;
import database.DBConnector;
import model.Post;
import model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoadMorePosts")
public class LoadMorePosts extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBConnector.getConnection(request, response);

        String start = request.getParameter("start");
        String postsType = request.getParameter("posttype");

        String limit = (String) request.getServletContext().getInitParameter("limit");
        Users user = (Users) request.getSession().getAttribute("loggedInUser");

        List<Post> posts = new ArrayList<>();

        if (user == null) {
            response.sendRedirect("/index.jsp");
            return;
        }

        try {
            String sql;
            PreparedStatement ps;

//            if (postsType.equals("profile")) {
//                sql = "SELECT posts.id, user_id, content, images, location, datetime, full_name FROM posts INNER JOIN users ON posts.user_id=users.id WHERE users.id = ? ORDER BY posts.id DESC LIMIT ?, ?";
//                ps = con.prepareStatement(sql);
//                ps.setString(1, user.getUserid());
//                ps.setInt(2, Integer.parseInt(start));
//                ps.setInt(3, Integer.parseInt(limit));
//
//            } else {
                sql = "SELECT postid, posts.userid, post, posts.datecreated, fullname FROM posts INNER JOIN users ON posts.userid=users.userid ORDER BY posts.postid DESC LIMIT ?, ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(start));
                ps.setInt(2, Integer.parseInt(limit));

//            }

            ResultSet result = ps.executeQuery();

            while (result.next()) {
                Post post = new Post();

                post.setPostid(result.getString("postid"));
                post.setUserid(result.getString("userid"));
                post.setPostcontent(result.getString("post"));
                String dateTime = result.getString("datecreated");
                dateTime = dateTime.substring(0, dateTime.length() - 5);
                post.setDatecreated(dateTime);
                post.setPostedby(result.getString("fullname"));

                String sql2 = "SELECT COUNT(*) FROM likes WHERE post_id=?";
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setString(1, post.getPostid());

                ResultSet rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    post.setTotallikes(rs2.getInt(1) + "");
                } else {
                    post.setTotallikes("0");
                }

                String sql3 = "SELECT * FROM likes WHERE post_id=? AND user_id=? LIMIT 1";
                PreparedStatement ps3 = con.prepareStatement(sql3);
                ps3.setString(1, post.getUserid());
                ps3.setString(2, user.getUserid());

                ResultSet rs3 = ps3.executeQuery();
                if (rs3.next()) {
                    post.setLikedByMe("true");
                } else {
                    post.setLikedByMe("false");
                }

                posts.add(post);
            }

        } catch (SQLException e) {
            e.printStackTrace();

        }

        response.setContentType("application/json");
        response.getWriter().print(new Gson().toJson(posts));
        response.getWriter().flush();
    }
}
