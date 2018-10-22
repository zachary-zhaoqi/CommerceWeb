package dao.mall;

import entity.ShoppingCartClause;
import jdbc.JdbcOperator;

import java.sql.SQLException;
import java.util.List;

public class ShoppingCartClauseDAO {

    private final JdbcOperator jdbcOperator;

    public ShoppingCartClauseDAO() {
        jdbcOperator = new JdbcOperator();
    }

    public List<ShoppingCartClause> getShoppingCart(int idmembers) throws Exception {
        String sql="SELECT * FROM commerce.shoppingcartclause WHERE idmembers=?;";

        return jdbcOperator.queryForJavaBeanList(sql,ShoppingCartClause.class,idmembers);
    }

    public void addClause(int idmembers, int idcommodity) throws SQLException {
        String sql="INSERT INTO `commerce`.`shoppingcartclause` (`idmembers`, `idcommodity`) VALUES (?, ?);";

        jdbcOperator.executeUpdate(sql,idmembers,idcommodity);
    }
}
