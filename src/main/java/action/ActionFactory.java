package action;

import java.util.HashMap;
import java.util.Map;

public class ActionFactory {
    private static Map<String,Action> urlMappings=new HashMap<String,Action>();

    /***/
    public static void initUrlMapping(){
        urlMappings.put("/manage/login.do",new MembersAction());
    }

    /***/
    public static Action getAction(String url){
        Action action=urlMappings.get(url);
        return action;
    }
}
