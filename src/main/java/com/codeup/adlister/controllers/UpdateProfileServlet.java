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


@WebServlet(name = "controllers.UpdateProfileServlet", urlPatterns = "/profile/update-account")
public class UpdateProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("user");
//        System.out.println(userUpdateID);
        String error = request.getParameter("error");
        System.out.println(error);
        User user = DaoFactory.getUsersDao().findByUserId(currentUser.getId());
        request.setAttribute("user", user);
        request.setAttribute("error", error);
        request.getRequestDispatcher("/WEB-INF/profile/update-account.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String updateUsername = request.getParameter("username");
        String updateEmail = request.getParameter("email");

        User user = (User) request.getSession().getAttribute("user");

        if(DaoFactory.getUsersDao().doesUsernameExist(updateUsername)){
            response.sendRedirect("/profile/update-account?error=username_exists");
            return;
        }

        User updateProfile = DaoFactory.getUsersDao().findByUserId(user.getId());
        updateProfile.setUsername(updateUsername);
        updateProfile.setEmail(updateEmail);

        DaoFactory.getUsersDao().updateUserProfile(updateProfile);
        request.getSession().setAttribute("user", updateProfile);
        response.sendRedirect("/profile");
    }
}