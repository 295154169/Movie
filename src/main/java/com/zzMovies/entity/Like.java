package com.zzMovies.entity;

import java.io.Serializable;

/**
 * 收藏实体类
 */
public class Like implements Serializable {
    private MovieMsg movie;
    private User user;

    /**
     * 无参构造方法
     */
    public Like() {
    }

    public Like(MovieMsg movie, User user) {
        this.movie = movie;
        this.user = user;
    }

    public MovieMsg getMovie() {
        return movie;
    }

    public void setMovie(MovieMsg movie) {
        this.movie = movie;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
