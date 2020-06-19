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


@WebServlet(name = "controllers.UpdatePasswordServlet", urlPatterns = "/profile/update-password")
public class UpdatePasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("user");
        request.getRequestDispatcher("/WEB-INF/profile/update-password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String updatePassword = request.getParameter("password");
        String confirmUpdatePassword = request.getParameter("confirm_password");


        User user = (User) request.getSession().getAttribute("user");

        User updateProfile = DaoFactory.getUsersDao().findByUserId(user.getId());
        updateProfile.setPassword(updatePassword);

        DaoFactory.getUsersDao().updateUserProfile(updateProfile);
        request.getSession().setAttribute("user", updateProfile);
        response.sendRedirect("/profile");
    }

}
