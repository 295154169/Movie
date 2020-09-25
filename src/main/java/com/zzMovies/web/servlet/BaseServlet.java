package com.zzMovies.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@WebServlet("/BaseServlet")
public class BaseServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 接收请求, 来实现方法的分发: 按照功能调用不同的方法
        // uri: /user/active
        // 判断调用的是哪个方法 active login
        String uri = request.getRequestURI();
        // method就是要调用的方法名
        String methodName = uri.substring(uri.lastIndexOf("/") + 1);
        try {
            // 1.获得method所在的字节码对象, 从而得到方法对象 - 反射
            // this是当前对象, 谁调用这方法, 对象就是谁
            // System.out.println(this);
            Method method1 = this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method1.invoke(this, request, response);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    // 将制定对象序列化为json返回给客户端
    protected void writeValue(HttpServletResponse response, Object obj) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getOutputStream(), obj);
    }
}
