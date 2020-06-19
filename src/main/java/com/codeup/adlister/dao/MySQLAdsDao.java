package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, category) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setString(4, ad.getCategory());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }



    @Override
    public List<Ad> filterByCategory(String category) {
        String query = "SELECT * FROM ads WHERE category = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, category);
            return createAdsFromResults(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error filtering category", e);
        }
    }

    public List<Ad> userSpecificPost(Long user_id ) {
        String query = "SELECT * FROM ads where user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1,user_id);
            return createAdsFromResults(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error filtering category", e);
        }
    }

    @Override
    public Ad adId(Long id) {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE id = ?");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next());
            return extractAd(rs);
        }catch(SQLException e){
            throw new RuntimeException("id not found", e);
        }
    }

    //update ad
    @Override
    public void updateAd(Ad ad) {
        try {
            String query = "UPDATE ads SET title = ?, description = ?, category=? WHERE id = " + ad.getId();
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setString(3, ad.getCategory());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public void deleteAd(Long id) {
        try {
            String query = "DELETE FROM ads WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, id);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting your ad.", e);
        }
    }

    @Override
    public List<Ad> searchAdByWord(String search) {
        String searchWord = "%" + search + "%";
        String query = "Select * FROM ads WHERE ads.title LIKE ? OR ads.description LIKE ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, searchWord);
            stmt.setString(2, searchWord);
            List<Ad> ads = createAdsFromResults(stmt.executeQuery());
            System.out.println(ads);
            return ads;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error finding your results", e);
        }

    }


    //for one specific ad
    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getString("category")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
