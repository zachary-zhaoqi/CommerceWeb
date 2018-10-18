package action;

import action.mall.CommodityShowAction;
import action.mall.MembersAction;
import action.manage.AdminUserAction;

import java.util.HashMap;
import java.util.Map;

public class ActionFactory {
    private static Map<String,Action> urlMappings=new HashMap<String,Action>();


    public static void initUrlMapping(){
        urlMappings.put("/mall/Members.action",new MembersAction());
        urlMappings.put("/manage/AdminUser.action",new AdminUserAction());
        urlMappings.put("/mall/CommodityShow.action",new CommodityShowAction());
    }


    public static Action getAction(String url){
        Action action=urlMappings.get(url);
        return action;
    }
}
