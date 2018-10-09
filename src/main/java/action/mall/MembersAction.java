package action.mall;

import dao.MembersDAO;
import action.Action;
import entity.Members;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MembersAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Members members=new Members();
        members.setPassword(request.getParameter("password"));
        members.setEmail(request.getParameter("email"));
        MembersDAO membersDAO=new MembersDAO();

    }
}
