package com.zzMovies.service;

import com.zzMovies.entity.*;

import java.util.Date;
import java.util.List;

public interface MovieService {
    MovieMsg findOne(int mid);

    void publishComment(int mid, Date date, int uid, String message);

    void publishScore(int mid, int uid, int score);

    List<UserComment> findCommentById(int mid);


    boolean findScoreById(int mid, int uid);

    PageBean<MovieMsg> findByPage(int cid, int currentPage, int pageSize);

    List<MovieMsg> findTopThree();

    List<MovieMsg> findTopTen();

    List<MovieMsg> selectMovie(String title);
}
