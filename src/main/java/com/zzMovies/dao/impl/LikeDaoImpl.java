package com.zzMovies.dao.impl;

import com.zzMovies.dao.LikeDao;
import com.zzMovies.entity.Like;
import com.zzMovies.entity.MovieMsg;
import com.zzMovies.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class LikeDaoImpl implements LikeDao {
    JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public int findCountByMid(int mid) {
        String sql = "select count(*) from tab_like where mid = ?";
        return jdbcTemplate.queryForObject(sql, Integer.class, mid);
    }

    @Override
    public Like findByMidAndUid(int mid, int uid) {
        try {
            String sql = "select * from tab_like where mid = ? and uid = ?";
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Like.class), mid, uid);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void insert(int mid, int uid) {
        String sql = "insert into tab_like(mid, uid) values(?, ?)";
        jdbcTemplate.update(sql, mid, uid);
    }

    @Override
    public List<MovieMsg> findByUid(String uid) {
        String sql = "select * from tab_movies where mid in (select tab_like.mid from tab_like where uid = ?);";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MovieMsg.class), uid);
    }
}
