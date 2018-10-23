package action.mall;

import action.Action;
import dao.mall.MembersDAO;
import dao.mall.ShoppingCartClauseDAO;
import entity.AdminUser;
import entity.Commodity;
import entity.Members;
import entity.ShoppingCartClause;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
            case "addShoppingCart" :
                addShoppingCart(request, response);
                break;
            case "alter" :

                break;
            case "remove" :

                break;
            default :
                //可选语句
        }

    }

    private void addShoppingCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idcommodity=Integer.parseInt(request.getParameter("idcommodity"));
        Members members= (Members) request.getSession().getAttribute("Members");
        if (members == null) {
            List<ShoppingCartClause> shoppingCart;
            if (request.getSession().getAttribute("ShoppingCart") == null) {
                shoppingCart = new ArrayList<>();
            }else {
                shoppingCart= (List<ShoppingCartClause>) request.getSession().getAttribute("ShoppingCart");
            }
            ShoppingCartClause shoppingCartClause=new ShoppingCartClause();
            shoppingCartClause.setIdcommodity(idcommodity);
            shoppingCartClause.setQuantity(1);
            shoppingCart.add(shoppingCartClause);
            request.getSession().setAttribute("ShoppingCart",shoppingCart);
            request.getRequestDispatcher("/mall/shopping-cart.jsp").forward(request,response);
            return;
        }
        ShoppingCartClauseDAO shoppingCartClauseDAO=new ShoppingCartClauseDAO();
        try {
            shoppingCartClauseDAO.addClause(members.getIdmembers(),idcommodity);
            request.getRequestDispatcher("/mall/shopping-cart.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage",e.getMessage());
            request.getRequestDispatcher("/mall/login.jsp").forward(request,response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Members members=new Members();
        members.setPassword(request.getParameter("password"));
        members.setEmail(request.getParameter("email"));
        MembersDAO membersDAO=new MembersDAO();
        try {
            members=membersDAO.login(members);
            request.getSession().setAttribute("Members",members);
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
            String ss= "<script type='text/javascript'>" +
                    "alert('registe succeed!please login!');" +
                    "window.location.href='" +request.getContextPath()+"/mall/login.jsp';" +
                    "</script>";
            response.getWriter().print(ss);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage",e.getMessage());
            request.getRequestDispatcher("/mall/error.jsp").forward(request,response);
        }
    }
}
