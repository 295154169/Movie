package com.zzMovies.dao;

import com.zzMovies.entity.Category;

import java.util.List;

public interface CategoryDao {
    List<Category> findAllCategory();

    String findCnameById(String cid);
}
