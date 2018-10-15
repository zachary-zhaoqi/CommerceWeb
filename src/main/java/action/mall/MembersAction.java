package action.mall;

import action.Action;
import dao.mall.MembersDAO;
import entity.AdminUser;
import entity.Members;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MembersAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mark=request.getParameter("mark");
        switch(mark){
            case "registe" :
                registe(request, response);
                break;
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
        Members members=new Members();
        members.setPassword(request.getParameter("password"));
        members.setEmail(request.getParameter("email"));
        MembersDAO membersDAO=new MembersDAO();
        try {
            members=membersDAO.login(members);
            request.setAttribute("Members",members);
            request.getRequestDispatcher("/mall/index.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage",e.getMessage());
            request.getRequestDispatcher("/mall/login.jsp").forward(request,response);
        }
    }

    private void registe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Members members=new Members();
        members.setPassword(request.getParameter("password"));
        members.setEmail(request.getParameter("email"));
        MembersDAO membersDAO=new MembersDAO();
        try {
            membersDAO.registe(members);
            request.setAttribute("Members",members);
            request.getRequestDispatcher("/mall/index.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage",e.getMessage());
            request.getRequestDispatcher("/mall/error.jsp").forward(request,response);
        }
    }
}
