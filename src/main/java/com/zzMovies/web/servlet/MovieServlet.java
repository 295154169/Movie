package com.zzMovies.web.servlet;


import com.zzMovies.entity.*;
import com.zzMovies.service.LikeService;
import com.zzMovies.service.MovieService;
import com.zzMovies.service.impl.LikeServiceImpl;
import com.zzMovies.service.impl.MovieServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

@WebServlet("/movie/*")
public class MovieServlet extends BaseServlet {
    private MovieService movieService = new MovieServiceImpl();
    private LikeService likeService = new LikeServiceImpl();

    public void detail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获得mid
        int mid = Integer.parseInt(request.getParameter("mid"));
        //获得MovieMsg对象
        MovieMsg mv = movieService.findOne(mid);
        //返回json对象
        writeValue(response, mv);
    }

    public void comment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int mid = Integer.parseInt(request.getParameter("mid"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        String message = request.getParameter("message");
        movieService.publishComment(mid, new Date(), uid, message);
        writeValue(response, true);
    }

    public void grade(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int mid = Integer.parseInt(request.getParameter("mid"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        int score = Integer.parseInt(request.getParameter("score"));
        movieService.publishScore(mid, uid, score);
        writeValue(response, true);
    }

    public void findComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int mid = Integer.parseInt(request.getParameter("mid"));
        List<UserComment> list = movieService.findCommentById(mid);
        writeValue(response, list);
    }
    public void isGrade(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int mid = Integer.parseInt(request.getParameter("mid"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        if (movieService.findScoreById(mid, uid)) {
            writeValue(response, true);
        }
    }

    public void isLike(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Object user = request.getSession().getAttribute("loginUser");
        ResultInfo info = new ResultInfo();
        if (user == null) {
            writeValue(response, info);
            return;
        }
        int mid = Integer.parseInt(request.getParameter("mid"));
        int uid = ((User) user).getUid();
        if (likeService.ifLike(mid, uid)) {
            info.setFlag(true);
        } else {
            info.setFlag(false);
        }
        writeValue(response, info);
    }

    public void addLike(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("loginUser");
        if (user == null) {
            return;
        }
        int mid = Integer.parseInt(request.getParameter("mid"));
        likeService.addLike(mid, user.getUid());
        writeValue(response, true);
    }

    public void findLike(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String uid = request.getParameter("uid");
        System.out.println(uid);
        List<MovieMsg> list = likeService.findLike(uid);
        writeValue(response, list);
    }

    public void queryPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String cid = request.getParameter("cid");
        String currentPage = request.getParameter("currentPage");
        String pageSize = request.getParameter("pageSize");

        if (currentPage == null || "".equals(currentPage)) {
            currentPage = "1";
        }
        if (pageSize == null || "".equals(pageSize)) {
            pageSize = "8";
        }
        PageBean<MovieMsg> page = movieService.findByPage(Integer.parseInt(cid), Integer.parseInt(currentPage), Integer.parseInt(pageSize));
        writeValue(response, page);
    }

    public void findTopThree(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<MovieMsg> movieList = movieService.findTopThree();
        writeValue(response, movieList);
    }

    public void findTopTen(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<MovieMsg> movieList = movieService.findTopTen();
        writeValue(response, movieList);
    }

    public void selectMovie(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String title = request.getParameter("title");
        System.out.println(title);
        List<MovieMsg> list = movieService.selectMovie(title);
        writeValue(response,list);
    }
}
