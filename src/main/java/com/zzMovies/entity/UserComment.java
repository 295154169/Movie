package com.zzMovies.entity;

import java.io.Serializable;


public class UserComment implements Serializable {
    private String name;
    private String date;
    private String comment;

    public UserComment() {
    }

    public UserComment(String name, String date, String comment) {
        this.name = name;
        this.date = date;
        this.comment = comment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "UserComment{" +
                "name='" + name + '\'' +
                ", date=" + date +
                ", comment='" + comment + '\'' +
                '}';
    }
}
