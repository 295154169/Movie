package com.zzMovies.dao;

import com.zzMovies.entity.User;

public interface UserDao {
    User findByUsernameAndPassword(String username, String password);

    void saveUser(User user);

    User findUserByUsername(String username);

    int updateUserStatus(String code);

    boolean updateUser(User user);
}
