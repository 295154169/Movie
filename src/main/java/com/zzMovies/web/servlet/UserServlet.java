package com.zzMovies.web.servlet;

import com.zzMovies.entity.ResultInfo;
import com.zzMovies.entity.User;
import com.zzMovies.exception.LoginException;
import com.zzMovies.service.UserService;
import com.zzMovies.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/user/*")
public class UserServlet extends BaseServlet {

    private UserService us = new UserServiceImpl();

    //登录
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String check = request.getParameter("check");
        String checkcode_server = (String) request.getSession().getAttribute("CHECKCODE_SERVER");
        ResultInfo info = new ResultInfo();
        if (check == null || !check.equalsIgnoreCase(checkcode_server)) {
            info.setFlag(false);
            info.setErrorMsg("验证码错误!");
        } else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            //使用MD5加密密码
            String passwordMD5 = com.zzMovies.util.Md5Util.encodeByMd5(password);
            try {
                User login = us.login(username, passwordMD5);
                System.out.println(login.getStatus());
                if (login.getStatus().equals("N")) {
                    info.setFlag(false);
//                    info.setErrorMsg("您的账号未激活，请前往邮箱确认激活邮件");
                } else {
                    request.getSession().setAttribute("loginUser", login);
                    info.setFlag(true);
                }
            } catch (LoginException e) {
                e.printStackTrace();
                info.setFlag(false);
                info.setErrorMsg(e.getMessage());
            }
        }
        writeValue(response, info);
    }

    //注册
    public void registerUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 接收请求参数
        Map<String, String[]> map = request.getParameterMap();
        // 2. 封装对象
        User user = new User();
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        user.setPassword(com.zzMovies.util.Md5Util.encodeByMd5(user.getPassword()));
        // 3. 调用service进行注册
        boolean flag = us.registerUser(user);
        // 4. 判断结果 进行封装
        ResultInfo info = new ResultInfo();
        info.setFlag(flag);
        if (!flag) {
            info.setErrorMsg("注册失败!");
        }
        // 5. 将数据结果返回给客户端
        writeValue(response, info);
    }

    //确认用户名是否存在
    public void checkUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 1.接受请求参数 username
        String username = request.getParameter("username");
        // 2.调用service 检测用户是否存在
        boolean flag = us.checkUserExist("username");
        // 3.创建返回给前端的数据对象
        ResultInfo info = new ResultInfo();
        // 4.若用户存在，则进行取反，返回false
        info.setFlag(!flag);
        // 5.将数据对象封装为json返回给客户端
        writeValue(response, info);
    }

    //激活账号
    public void active(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = request.getParameter("code");
        response.setContentType("text/html;charset=utf-8");
        boolean flag = us.active(code);
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/index.html");
        } else {
            response.getWriter().write("激活失败！");
        }
    }

    //查询一个用户的基本信息
    public void findOne(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("loginUser");
        writeValue(response, user);
    }

    // 退出
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("loginUser");
        response.sendRedirect(request.getContextPath() + "/login.html");
    }

    //修改用户信息
    public void update(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 1. 接收请求参数
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        Map<String, String[]> map = request.getParameterMap();
        // 2. 封装对象
        User user = new User();
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        user.setPassword(com.zzMovies.util.Md5Util.encodeByMd5(user.getPassword()));
        boolean flag = us.updateUser(user);
        ResultInfo info = new ResultInfo();
        info.setFlag(flag);
        if (!flag) {
            info.setErrorMsg("修改失败!");
        }
        // 5. 将数据结果返回给客户端
        writeValue(response, info);
    }
}
