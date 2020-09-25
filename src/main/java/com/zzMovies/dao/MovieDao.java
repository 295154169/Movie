package com.zzMovies.dao;

import com.zzMovies.entity.MovieMsg;
import com.zzMovies.entity.UserComment;

import java.util.Date;
import java.util.List;

public interface MovieDao {
    MovieMsg findOne(int mid);

    void updateComment(int mid, Date date, int uid, String message);

    void updateScore(int mid, int uid, int score);

    List<UserComment> findAllCommentById(int mid);


    boolean findScoreById(int mid, int uid);

    int findCount(int cid);

    List<MovieMsg> findByPage(int cid, int start, int pageSize);

    List<MovieMsg> findTopThree();

    List<MovieMsg> findTopTen();

    List<MovieMsg> selectMovie(String title);

}
