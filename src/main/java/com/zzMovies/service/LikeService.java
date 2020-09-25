package com.zzMovies.service;

import com.zzMovies.entity.MovieMsg;

import java.util.List;

public interface LikeService {
    boolean ifLike(int mid, int uid);

    void addLike(int mid, int uid);

    List<MovieMsg> findLike(String uid);
}
