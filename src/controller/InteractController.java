package controller;

import com.google.gson.Gson;
import database.DBConnector;
import model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
 * Created by trauma_sushan on 5/21/2017.
 */
@WebServlet("/likes")
public class InteractController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBConnector.getConnection(request, response);
        PrintWriter out = response.getWriter();

        Users user = (Users) request.getSession().getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect("/index.jsp");
            return;
        }

        String userid = user.getUserid();
        String postid = request.getParameter("postid");
        HashMap<String, String> jsonData = new HashMap<String, String>();

        try{
            String sql = "select postid, userid from likes where userid=? and postid=?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, userid);
            statement.setString(2, postid);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                System.out.println("hello");
                PreparedStatement ps = con.prepareStatement("DELETE FROM likes WHERE userid=? AND postid=?");
                ps.setString(1, userid);
                ps.setString(2, postid);
                int res = ps.executeUpdate();
                if(res>0){
                    jsonData.put("status","Button Unliked");
                }
                else{
                    jsonData.put("status","Button Unlike failed");
                }
            }
            else {
                PreparedStatement ps = con.prepareStatement("insert into likes (userid, postid) VALUES (?,?)");
                ps.setString(1, userid );
                ps.setString(2, postid);
                int result = ps.executeUpdate();
                if(result>0){
                    jsonData.put("status","Button liked");
                }
                else{
                    jsonData.put("status","Button Like failed");
                }

            }
            Gson gson = new Gson();

            response.setContentType("application/json");
            out.print(gson.toJson(jsonData));
            out.flush();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

}
