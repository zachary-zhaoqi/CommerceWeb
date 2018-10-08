package servlet;

import action.Action;
import action.ActionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CentralControl")
public class CentralControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url=request.getRequestURI();
        //解析url

        //工厂方法
        Action action= ActionFactory.getAction(url);
        if (action==null){
            //不存在业务方法，跳转到错误页面。
            request.setAttribute("errorMessage","无效的请求！");
            request.getRequestDispatcher("mall/error.jsp").forward(request,response);

        }else {
            action.execute(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
