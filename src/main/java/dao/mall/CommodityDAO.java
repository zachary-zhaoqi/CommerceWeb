package dao.mall;

import entity.Commodity;
import jdbc.JdbcOperator;

import java.util.List;

public class CommodityDAO {
    private final JdbcOperator jdbcOperator;
    public CommodityDAO() {
        jdbcOperator = new JdbcOperator();
    }

    public List getCommodityListForPrimaryClassification(String primaryclassification) throws Exception {
        String sql="SELECT * FROM commerce.commodity WHERE primaryclassification=?;";

        List<Commodity> commodities=jdbcOperator.queryForJavaBeanList(sql,Commodity.class,primaryclassification);

        return commodities;
    }

    public List getCommodityListForSecondaryClassification(String secondaryclassification) throws Exception {
        String sql="SELECT * FROM commerce.commodity WHERE secondaryclassification=?;";

        List<Commodity> commodities=jdbcOperator.queryForJavaBeanList(sql,Commodity.class,secondaryclassification);

        return commodities;
    }

    public Commodity getCommodityForID(int idcommodity) throws Exception {
        String sql="SELECT * FROM commerce.commodity WHERE idcommodity=?;";

        Commodity commodity = (Commodity) jdbcOperator.queryForJavaBean(sql, Commodity.class, idcommodity);
        return commodity;
    }
}
