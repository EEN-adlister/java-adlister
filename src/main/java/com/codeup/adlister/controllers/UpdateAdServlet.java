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

@WebServlet(name = "controllers.UpdateAdServlet", urlPatterns = "/ads/update")
public class UpdateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long adID = Long.parseLong(request.getParameter("id"));
        System.out.println(adID);
        Ad ad = DaoFactory.getAdsDao().adId(adID);
        request.setAttribute("ad",ad);
        request.getRequestDispatcher("/WEB-INF/ads/update.jsp").forward(request,response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String updateTitle = request.getParameter("title");
        String updateDescription = request.getParameter("description");
        String updateCategory = request.getParameter("category");
        Long updateAdId = Long.parseLong(request.getParameter("ad.id"));

        User user = (User) request.getSession().getAttribute("user");

        Ad updatedAd = DaoFactory.getAdsDao().adId(updateAdId);
        updatedAd.setTitle(updateTitle);
        updatedAd.setDescription(updateDescription);
        updatedAd.setCategory(updateCategory);


        // edit ad with information from form POST
        DaoFactory.getAdsDao().updateAd(updatedAd);
        response.sendRedirect("/profile");
    }
}

