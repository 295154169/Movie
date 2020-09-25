package com.zzMovies.dao.impl;

import com.zzMovies.dao.MovieDao;
import com.zzMovies.entity.MovieMsg;
import com.zzMovies.entity.UserComment;
import com.zzMovies.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class MovieDaoImpl implements MovieDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public MovieMsg findOne(int mid) {
        String sql = "select * from tab_movies where mid=?";
        List<MovieMsg> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MovieMsg.class), mid);
        return list.size() == 0 ? null : list.get(0);
    }

    @Override
    public void updateComment(int mid, Date date, int uid, String message) {
        String sql = "insert into tab_comment(mid,date,uid,comment) values(?,?,?,?)";
        jdbcTemplate.update(sql, mid, date, uid, message);
    }

    @Override
    public void updateScore(int mid, int uid, int score) {
        String sql = "insert into tab_score(mid,uid,score) values(?,?,?)";
        jdbcTemplate.update(sql, mid, uid, score);
    }

    @Override
    public List<UserComment> findAllCommentById(int mid) {
        String sql = "select name,date,comment from tab_user u,tab_comment c where u.uid=c.uid and c.mid=? order by date desc";
        List<UserComment> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(UserComment.class), mid);
        return list;
    }


    @Override
    public boolean findScoreById(int mid, int uid) {
        String sql = "select score from tab_score where mid=? and uid=?";
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, mid, uid);
        return list.size() == 0 ? false : true;
    }


    @Override
    public int findCount(int cid) {
        String sql = "select count(*) from tab_movies where cid = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, cid);
        return count;
    }

    @Override
    public List<MovieMsg> findByPage(int cid, int start, int pageSize) {
        String sql = "select * from tab_movies where cid = ? limit ?,?";
        List<MovieMsg> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MovieMsg.class), cid, start, pageSize);
        return list;
    }

    @Override
    public List<MovieMsg> findTopThree() {
        String sql = "select * from tab_movies order by count desc limit 0, 3";
        List<MovieMsg> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MovieMsg.class));
        return list;
    }

    @Override
    public List<MovieMsg> findTopTen() {
        String sql = "select * from tab_movies order by count desc limit 0, 10";
        List<MovieMsg> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MovieMsg.class));
        return list;
    }

    @Override
    public List<MovieMsg> selectMovie(String title) {
        String sql="select * from tab_movies where mname like ?";
        List<MovieMsg> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MovieMsg.class), "%" + title + "%");
        return list;
    }
}
