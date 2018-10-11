package jdbc;

import org.junit.Test;
import java.sql.SQLException;
import static org.junit.Assert.*;

public class JdbcOperatorTest {
    @Test
    public void main() {
        String sql ="INSERT INTO `commerce`.`members` (`password`, `email`) VALUES (?, ?);";
        String password="654321";
        String email="999@qq.com";
        JdbcOperator jdbcOperator=new JdbcOperator();
        try {
            int result=jdbcOperator.executeUpdate(sql,password,email);
            System.out.println(result);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}