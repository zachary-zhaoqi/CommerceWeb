package action.manage;

import action.Action;
import dao.mall.MembersDAO;
import dao.manage.AdminUserDAO;
import entity.AdminUser;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminUserAction  implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mark=request.getParameter("mark");
        switch(mark){
            case "login" :
                login(request, response);
                break;
            case "add" :

                break;
            case "alter" :

                break;
            case "remove" :

                break;
            default : //可选
                //语句
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminUser adminUser=new AdminUser();
        adminUser.setAdminuserpassword(request.getParameter("adminuserpassword"));
        adminUser.setAdminusername(request.getParameter("adminusername"));
        AdminUserDAO adminUserDAO=new AdminUserDAO();
        try {
            adminUser=adminUserDAO.login(adminUser);
            HttpSession session=request.getSession();
            session.setAttribute("AdminUser",adminUser);
            request.getRequestDispatcher("/manage/homeManager.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage",e.getMessage());
            request.getRequestDispatcher("/manage/Public/login.jsp").forward(request,response);
        }
    }
}
