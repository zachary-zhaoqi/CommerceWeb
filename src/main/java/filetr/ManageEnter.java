package filetr;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "ManageEnter")
public class ManageEnter implements Filter {

    String excludedPages;
    String[] excludedPageArray;

    public void destroy() {
        System.out.println("进入过滤器destroy了！");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
        boolean isExcludedPage = false;
        HttpServletRequest request = (HttpServletRequest) req;
//        System.out.println("=======================LoginFilter==============================" + request.getContextPath() + "  " + request.getServletPath());
        for (String page : excludedPageArray) {//判断是否在过滤url之外
            if(request.getServletPath().equals(page)){
                isExcludedPage = true;
                break;
            }
        }
        if (isExcludedPage) {
            chain.doFilter(req, resp);
        } else {
            HttpSession session = request.getSession();
            if (session.getAttribute("AdminUserAction") != null) {
                chain.doFilter(req, resp);
            } else {
//                System.out.println("=======================LoginFilter==============================");
                HttpServletResponse response = (HttpServletResponse) resp;
                response.setContentType("text/html;charset=utf-8");
                String ss=
                        "<script type='text/javascript'>alert('请先登录！');window.location.href='"+request.getContextPath()+"/manage/Public/login.jsp';</script>";
                response.getWriter().print(ss);
                return;
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("进入过滤器init了！");
        excludedPages = config.getInitParameter("excludedPages");
        if (excludedPages != null) {
            excludedPageArray = excludedPages.split(",");
        }
    }

}
