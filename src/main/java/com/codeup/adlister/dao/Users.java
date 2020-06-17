package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    User findByUserId(long userId);
    Long insert(User user);
    void updateUsername(User user);
    void deleteUserName(User user);
}
