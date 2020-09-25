package com.zzMovies.service.impl;

import com.zzMovies.entity.*;
import com.zzMovies.service.MovieService;
import com.zzMovies.dao.MovieDao;
import com.zzMovies.dao.impl.MovieDaoImpl;

import java.util.Date;
import java.util.List;

public class MovieServiceImpl implements MovieService {
    private MovieDao movieDao=new MovieDaoImpl();
    @Override
    public MovieMsg findOne(int mid) {
        return movieDao.findOne(mid);
    }

    @Override
    public void publishComment(int mid, Date date, int uid, String message) {
        movieDao.updateComment(mid, date, uid, message);
    }

    @Override
    public void publishScore(int mid, int uid, int score) {
        movieDao.updateScore(mid,uid,score);
    }

    @Override
    public List<UserComment> findCommentById(int mid) {
        List<UserComment> list = movieDao.findAllCommentById(mid);
        return list;
    }

    @Override
    public boolean findScoreById(int mid,int uid) {
        return movieDao.findScoreById(mid,uid);
    }


    @Override
    public PageBean<MovieMsg> findByPage(int cid, int currentPage, int pageSize) {

        List<MovieMsg> list = movieDao.findByPage(cid, (currentPage - 1) * pageSize, pageSize);
        int totalCount = movieDao.findCount(cid);
        int totalPage = (totalCount + pageSize - 1) / pageSize;

        PageBean<MovieMsg> pb = new PageBean<>();
        pb.setCurrentPage(currentPage);
        pb.setList(list);
        pb.setPageSize(pageSize);
        pb.setTotalCount(totalCount);
        pb.setTotalPage(totalPage);
        return pb;
    }

    @Override
    public List<MovieMsg> findTopThree() {
        List<MovieMsg> list = movieDao.findTopThree();
        return list;
    }
    @Override
    public List<MovieMsg> findTopTen() {
        List<MovieMsg> list = movieDao.findTopTen();
        return list;
    }

    @Override
    public List<MovieMsg> selectMovie(String title) {
        return movieDao.selectMovie(title);
    }
}
