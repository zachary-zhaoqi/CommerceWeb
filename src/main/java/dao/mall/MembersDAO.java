package dao.mall;

import entity.AdminUser;
import entity.Members;
import jdbc.JdbcOperator;

public class MembersDAO {
    private JdbcOperator jdbcOperator;

    public MembersDAO(){
        jdbcOperator = new JdbcOperator();
    }

    public void registe(Members members) throws Exception {
        String sql="INSERT INTO `commerce`.`members` (`email`, `password`) VALUES (?, ?);";

        int result=jdbcOperator.executeUpdate(sql,members.getEmail(),members.getPassword());
        if (result<=0){
            throw new Exception("没有更新数据；");
        }
    }

    public Members login(Members members) throws Exception {
        String sql="SELECT * FROM commerce.members where email=? and password=?;";

        Members members1= (Members) jdbcOperator.queryForJavaBean(sql,Members.class,members.getEmail(),members.getPassword());
        if (members1==null){
            throw new Exception("账户或密码错误！");
        }else {
            return members1;
        }
    }
}
