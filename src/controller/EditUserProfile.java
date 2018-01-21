package controller;

import database.DBConnector;
import model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by trauma_sushan on 5/21/2017.
 */
public class EditUserProfile extends HttpServlet {

    public void editUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
        Connection con = DBConnector.getConnection(request, response);
        Users user = ((Users)request.getSession().getAttribute("loggedInUser"));
        String userid = user.getUserid();
        try {
            String sql = "update users set fullname=?, state=?, city=?, zipcode=?, " +
                    "birthyear=? where userid ="+userid  ;
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, request.getParameter("edit-fullname"));
            ps.setString(2, request.getParameter("edit-state"));
            ps.setString(3, request.getParameter("edit-city"));
            ps.setString(4, request.getParameter("edit-zip"));
            ps.setString(5,request.getParameter("edit-dob"));

            int result = ps.executeUpdate();
            if(result>0){
                user.setFullName(request.getParameter("edit-fullname"));
                user.setState(request.getParameter("edit-state"));
                user.setCity(request.getParameter("edit-city"));
                user.setZipcode(request.getParameter("edit-zip"));
                user.setBirthyear(request.getParameter("edit-dob"));

                request.getSession().setAttribute("loggedInUser", user);
                response.sendRedirect("/InitialLoad");
            }
            else{
                response.sendRedirect("/InitialLoad");
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // System.out.println(request.getSession().getAttribute("userid"));
        try{
            editUser(request, response);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }
}
