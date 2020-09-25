package com.zzMovies.dao.impl;

import com.zzMovies.dao.CategoryDao;
import com.zzMovies.entity.Category;
import com.zzMovies.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CategoryDaoImpl implements CategoryDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<Category> findAllCategory() {
        String sql = "select * from tab_category order by cid";
        List<Category> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Category.class));
        return list;
    }

    @Override
    public String findCnameById(String cid) {
        String sql = "select cname from tab_category where cid =?";
        return jdbcTemplate.queryForObject(sql, String.class, cid);
    }
}
