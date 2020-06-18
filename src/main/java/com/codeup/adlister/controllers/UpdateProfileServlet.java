package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "controllers.UpdateProfileServlet", urlPatterns = "/profile/update")
public class UpdateProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long userUpdateID = Long.parseLong(request.getParameter("id"));

        User user = DaoFactory.getUsersDao().findByUserId(userUpdateID);
        request.setAttribute("user",user);
        request.getRequestDispatcher("/WEB-INF/profile/update.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String updateUsername = request.getParameter("username");
        String updateEmail = request.getParameter("email");
        String updatePassword = request.getParameter("password");
        Long updateUserId = Long.parseLong(request.getParameter("user.id"));

        User user = (User) request.getSession().getAttribute("user");

        User updateProfile = DaoFactory.getUsersDao().findByUserId(updateUserId);
        updateProfile.setUsername(updateUsername);
        updateProfile.setEmail(updateEmail);
        updateProfile.setPassword(updatePassword);

        DaoFactory.getUsersDao().updateUserProfile(updateProfile);
        request.getSession().setAttribute("user", updateProfile);
        response.sendRedirect("/profile");

    }
}