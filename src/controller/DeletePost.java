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
import java.sql.SQLException;
import java.util.HashMap;

/**
 * Created by kcp on 5/23/17.
 */
public class DeletePost extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBConnector.getConnection(request, response);

        String postId = request.getParameter("postid");
        Users user = (Users) request.getSession().getAttribute("loggedInUser");

        HashMap<String, String> jsonData = new HashMap<String, String>();

        if (user == null) {
            response.sendRedirect("/index.jsp");
            return;
        }

        PreparedStatement statement = null;
        try {
            statement = con.prepareStatement("DELETE FROM posts WHERE postid = ?");
            statement.setString(1, postId);
            int resultDel = statement.executeUpdate();

            statement = con.prepareStatement("DELETE FROM comments WHERE postid = ?");
            statement.setString(1, postId);
            statement.executeUpdate();

            statement = con.prepareStatement("DELETE FROM likes WHERE postid = ?");
            statement.setString(1, postId);
            statement.executeUpdate();

            if (resultDel > 0) {
                jsonData.put("status", "success");
                jsonData.put("message", "Post Deleted!");
            } else {
                jsonData.put("status", "fail");
                jsonData.put("message", "Unable to Delete Post");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            jsonData.put("status", "fail");
            jsonData.put("message", "Unable to Delete Post");

        }

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        out.print(new Gson().toJson(jsonData));
        out.flush();
        out.close();
    }

}

