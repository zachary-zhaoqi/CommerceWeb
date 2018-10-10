package jdbc;

import config.DataSourceConfig;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JdbcOperator {

    private DataSource dataSource;

    public JdbcOperator() {
        this.dataSource = DataSourceConfig.getDataSource();
    }

    public JdbcOperator(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public int executeUpdate(String sql, Object... params) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        int result = -1;

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                preparedStatement.setObject(i + 1, params[i]);
            }
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw e;
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    //TODO: handle exception
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    public static void main(String[] args) {
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

