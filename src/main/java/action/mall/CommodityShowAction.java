package action.mall;

import dao.mall.CommodityDAO;
import entity.PageModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CommodityShowAction implements action.Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mark=request.getParameter("mark");
        switch(mark){
            case "show" :
                show(request, response);
                break;
            case "change" :
                PageModel pageModel= (PageModel) request.getSession().getAttribute("pageModel");
                pageModel.setCurrentPage(Integer.parseInt(request.getParameter("targetPage")));
                request.setAttribute("pageModel",pageModel);
                request.getRequestDispatcher("/mall/list.jsp").forward(request,response);
                break;
            default : //可选
                //语句
        }



    }

    private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String primaryclassification=request.getParameter("primaryclassification");
        String secondaryclassification=request.getParameter("secondaryclassification");
        List commodityList=null;
        CommodityDAO commodityDAO=new CommodityDAO();

        if (primaryclassification!=null){
            commodityList = commodityDAO.getCommodityListForPrimaryClassification(primaryclassification);
        }else if(secondaryclassification!=null){
            commodityList = commodityDAO.getCommodityListForSecondaryClassification(secondaryclassification);
        }

        PageModel pageModel=new PageModel();
        pageModel.setList(commodityList);
        pageModel.setResultSize(commodityList.size());
        pageModel.setCurrentPage(1);
        request.setAttribute("pageModel",pageModel);
        request.getRequestDispatcher("/mall/list.jsp").forward(request,response);
    }
}
