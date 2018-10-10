package dao;

import entity.Members;
import jdbc.JdbcOperator;

import java.sql.SQLException;

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
}
