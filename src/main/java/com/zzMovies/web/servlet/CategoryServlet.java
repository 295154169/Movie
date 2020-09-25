package com.zzMovies.web.servlet;

import com.zzMovies.entity.Category;
import com.zzMovies.service.CategoryService;
import com.zzMovies.service.impl.CategoryServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/category/*")
public class CategoryServlet extends BaseServlet {
    private CategoryService categoryService = new CategoryServiceImpl();

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Category> list = categoryService.findAll();
        writeValue(response, list);
    }

    public void findCName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String cid = request.getParameter("cid");
        String cname = categoryService.findCnameById(cid);
        writeValue(response, cname);
    }
}
