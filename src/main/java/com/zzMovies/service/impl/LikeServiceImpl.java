package com.zzMovies.service.impl;

import com.zzMovies.dao.LikeDao;
import com.zzMovies.dao.impl.LikeDaoImpl;
import com.zzMovies.entity.Like;
import com.zzMovies.entity.MovieMsg;
import com.zzMovies.service.LikeService;

import java.util.List;

public class LikeServiceImpl implements LikeService {
    private LikeDao likeDao = new LikeDaoImpl();
    @Override
    public boolean ifLike(int mid, int uid) {
        Like like = likeDao.findByMidAndUid(mid, uid);
        return like != null;
    }

    @Override
    public void addLike(int mid, int uid) {
        likeDao.insert(mid,uid);
    }

    @Override
    public List<MovieMsg> findLike(String uid) {
        return likeDao.findByUid(uid);
    }
}
