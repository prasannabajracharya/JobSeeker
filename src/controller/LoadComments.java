package controller;

import com.google.gson.Gson;
import database.DBConnector;
import model.Comment;
import model.Post;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by kcp on 5/23/17.
 */
public class LoadComments extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBConnector.getConnection(request, response);
        Users user = (Users) request.getSession().getAttribute("loggedInUser");
        PrintWriter out = response.getWriter();

        if (user == null) {
            response.sendRedirect("/index.jsp");
            return;
        }

        String post_id = request.getParameter("post_id");

        List<Comment> commentList = new ArrayList<>();
        try {
            String sql = "SELECT commentid, userid, postid, comment, datecreated FROM comments WHERE postid =?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, post_id);
            ResultSet result = ps.executeQuery();
            while (result.next()) {
                Comment comment = new Comment();

                comment.setCommentid(result.getString("commentid"));
                comment.setUserid(result.getString("userid"));
                comment.setPostid(result.getString("postid"));
                comment.setComment(result.getString("comment"));
                comment.setDatecreated(result.getString("datecreated"));
                commentList.add(comment);
            }

            Gson gson = new Gson();
            response.setContentType("application/json");
            out.print(gson.toJson(commentList));
            out.flush();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }
}
