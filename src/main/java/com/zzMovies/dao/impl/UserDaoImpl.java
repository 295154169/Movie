package com.zzMovies.dao.impl;

import com.zzMovies.dao.UserDao;
import com.zzMovies.entity.User;
import com.zzMovies.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class UserDaoImpl implements UserDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public User findByUsernameAndPassword(String username, String password) {
        String sql = "select * from tab_user where username = ? and password = ?";
        try {
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username, password);
            return user;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void saveUser(User user) {
        String sql = "insert into tab_user values(null, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        template.update(sql, user.getUsername(), user.getPassword(), user.getName(), user.getBirthday(), user.getGender(), user.getTelephone(), user.getEmail(), user.getStatus(), user.getCode());
    }

    @Override
    public User findUserByUsername(String username) {
        String sql = "select * from tab_user where username = ?";
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username);
        return user;
    }

    @Override
    public int updateUserStatus(String code) {
        String sql = "update tab_user set status = 'Y' where code = ?";
        int count = template.update(sql, code);
        return count;
    }

    @Override
    public boolean updateUser(User user) {
        String sql = "update tab_user set password = ? , name = ? , birthday = ? , gender = ? , telephone = ? where uid = ?";
        int count = template.update(sql, user.getPassword(), user.getName(), user.getBirthday(), user.getGender(), user.getTelephone(), user.getUid());
        return count != 0;
    }
}
