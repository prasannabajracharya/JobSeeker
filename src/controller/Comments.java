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
 * Created by kcp on 5/22/17.
 */
public class Comments extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBConnector.getConnection(request, response);
        Users user = (Users) request.getSession().getAttribute("loggedInUser");
        PrintWriter out = response.getWriter();

        if (user == null) {
            response.sendRedirect("/index.jsp");
            return;
        }

        String user_id = user.getUserid();
        String post_id = request.getParameter("post_id");
        String comment = request.getParameter("comment");


        HashMap<String, String> jsonData = new HashMap<>();
        try {
            String sql = "insert into comments (userid, postid, comment) values (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user_id);
            ps.setString(2, post_id);
            ps.setString(3, comment);
            int res = ps.executeUpdate();
            if (res > 0) {
                jsonData.put("status", "success");
            } else
                jsonData.put("status", "failed");

            Gson gson = new Gson();
            response.setContentType("application/json");
            out.print(gson.toJson(jsonData));
            out.flush();
            request.setAttribute("post_id", post_id);
            request.setAttribute("comment-value", comment);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }
}
