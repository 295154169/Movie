package com.zzMovies.service;

import com.zzMovies.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> findAll();

    String findCnameById(String cid);
}
