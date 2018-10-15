package dao.manage;

import entity.AdminUser;
import jdbc.JdbcOperator;

public class AdminUserDAO {
    private JdbcOperator jdbcOperator;
    public AdminUserDAO() {
        jdbcOperator = new JdbcOperator();
    }

    public AdminUser login(AdminUser adminUser) throws Exception {
        String sql="SELECT * FROM commerce.adminuser where adminusername=? and adminuserpassword=?;";

        AdminUser adminUser1= (AdminUser) jdbcOperator.queryForJavaBean(sql,AdminUser.class,adminUser.getAdminusername(),adminUser.getAdminuserpassword());
        if (adminUser1==null){
            throw new Exception("账户或密码错误！");
        }else {
            return adminUser1;
        }
    }
}
