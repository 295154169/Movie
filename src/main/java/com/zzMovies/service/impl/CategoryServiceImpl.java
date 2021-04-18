package com.zzMovies.service.impl;

import com.zzMovies.dao.CategoryDao;
import com.zzMovies.dao.impl.CategoryDaoImpl;
import com.zzMovies.entity.Category;
import com.zzMovies.service.CategoryService;
import com.zzMovies.util.JedisUtil;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public List<Category> findAll() {
//        Jedis jedis = JedisUtil.getJedis();
//        Set<Tuple> categorys = jedis.zrangeWithScores("movie_category", 0, -1);
//        if (categorys == null || categorys.size() == 0) {
//            List<Category> list = categoryDao.findAllCategory();
//            for (Category cate : list) {
//                jedis.zadd("movie_category", cate.getCid(), cate.getCname());
//            }
//            return list;
//        } else {
//            List<Category> list = new ArrayList<>();
//            for (Tuple tuple : categorys) {
//                Category category = new Category();
//                category.setCid((int) tuple.getScore());
//                category.setCname(tuple.getElement());
//                list.add(category);
//            }
//            jedis.close();
//            return list;
//        }
        List<Category> list = categoryDao.findAllCategory();
        return list;
    }

    @Override
    public String findCnameById(String cid) {
        String cname = categoryDao.findCnameById(cid);
        return cname;
    }
}
