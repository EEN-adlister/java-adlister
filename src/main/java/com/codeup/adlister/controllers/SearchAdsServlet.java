package com.codeup.adlister.controllers;



import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.SearchAdsServlet", urlPatterns = "/ads/search")

public class SearchAdsServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String userSearch= request.getParameter("searchWord");
//        request.setAttribute("ads", DaoFactory.getAdsDao().all());
//        List<Ad> ads = DaoFactory.getAdsDao().searchAdByWord(userSearch);
//        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
//        response.sendRedirect("/ads/search");
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userSearch = request.getParameter("searchWord");
        request.setAttribute("ads", DaoFactory.getAdsDao().searchAdByWord(userSearch));
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
        response.sendRedirect("/ads/search");

    }
}
