package com.zzMovies.dao;

import com.zzMovies.entity.Like;
import com.zzMovies.entity.MovieMsg;

import java.util.List;

public interface LikeDao {
    int findCountByMid(int mid);

    Like findByMidAndUid(int mid, int uid);

    void insert(int mid, int uid);

    List<MovieMsg> findByUid(String uid);
}
