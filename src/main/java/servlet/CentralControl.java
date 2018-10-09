package servlet;

import action.Action;
import action.ActionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CentralControl",value = "*.action")
public class CentralControl extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        ActionFactory.initUrlMapping();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url=request.getRequestURI();
        //解析url
        url=url.substring(request.getContextPath().length());
        if (url.indexOf("?")>=0){
            url=url.substring(0,url.indexOf("?"));
        }
        System.out.println(url);
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
