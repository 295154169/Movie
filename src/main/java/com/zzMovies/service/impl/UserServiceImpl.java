package com.zzMovies.service.impl;

import com.zzMovies.dao.UserDao;
import com.zzMovies.dao.impl.UserDaoImpl;
import com.zzMovies.entity.User;
import com.zzMovies.service.UserService;
import com.zzMovies.exception.LoginException;
import com.zzMovies.util.MailUtils;
import com.zzMovies.util.UuidUtil;

public class UserServiceImpl implements UserService {

    private UserDao ud = new UserDaoImpl();

    @Override
    public User login(String username, String password) throws LoginException {
        User user = ud.findByUsernameAndPassword(username, password);
        if (user == null) {
            throw new LoginException("账号/密码错误!");
        } else if (user != null && user.getStatus() == "N") {
            throw new LoginException("账号未激活");
        } else {
            return user;
        }
    }

    @Override
    public boolean registerUser(User user) {
        try {
            // 设置账户未激活
            user.setStatus("N");
            // 设置唯一的code
            user.setCode(UuidUtil.getUuid());
            user.setName("新用户" + (int) (Math.random() * 100000 + 1));
            ud.saveUser(user);
            String text = "感谢您注册我们的账号，点击下面的链接即可激活您的账户<a href='http://localhost:8888//zzMovies/user/active?code=" + user.getCode() + "'>账号激活</a>";
            MailUtils.sendMail(user.getEmail(), text, user.getEmail() + "的激活邮件");
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean checkUserExist(String username) {
        try {
            ud.findUserByUsername(username);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean active(String code) {
        int count = ud.updateUserStatus(code);
        return count != 0;
    }

    @Override
    public boolean updateUser(User user) {
        boolean i = ud.updateUser(user);
        return i;
    }
}
