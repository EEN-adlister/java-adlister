package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "controllers.UpdateAdServlet", urlPatterns = "/ads/update-ad")
public class UpdateAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.getRequestDispatcher("/WEB-INF/ads/update-ad.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = (request.getParameter("id"));
        Long longId = Long.parseLong(request.getParameter("id"));
        User user = (User) request.getSession().getAttribute("user");
        if (request.getParameter("title") != null && request.getParameter("description") != null && request.getParameterValues("category") != null) {
            Ad ad = new Ad(
                    longId,
                    user.getId(),
                    request.getParameter("title"),
                    request.getParameter("description"),
                    request.getParameter("category")
            );

            DaoFactory.getAdsDao().editAd(ad);
            DaoFactory.getAdsDao().insert(ad);

            response.sendRedirect("/profile");
        }
    }

}
