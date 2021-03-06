package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> filterByCategory(String category);
    List<Ad> userSpecificPost(Long user_id);

    Ad adId(Long id);

    void updateAd(Ad ad);
    void deleteAd(Long id);

    List <Ad> searchAdByWord(String search);


}
