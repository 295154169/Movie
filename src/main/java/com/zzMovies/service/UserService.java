package com.zzMovies.service;

import com.zzMovies.entity.User;
import com.zzMovies.exception.LoginException;

public interface UserService {
    User login(String username, String password) throws LoginException;

    boolean registerUser(User user);

    boolean checkUserExist(String username);

    boolean active(String code);

    boolean updateUser(User user);
}
