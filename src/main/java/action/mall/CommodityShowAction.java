package action.mall;

import dao.mall.CommodityDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CommodityShowAction implements action.Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String primaryclassification=request.getParameter("primaryclassification");
        String secondaryclassification=request.getParameter("secondaryclassification");
        List commodityList=null;
        CommodityDAO commodityDAO=new CommodityDAO();
        if (primaryclassification!=null){
            commodityList = commodityDAO.getCommodityListForPrimaryClassification(primaryclassification);
        }else if(secondaryclassification!=null){
            commodityList = commodityDAO.getCommodityListForSecondaryClassification(secondaryclassification);
        }
        request.setAttribute("commodityList",commodityList);
        request.getRequestDispatcher("/mall/list.jsp").forward(request,response);
    }
}
