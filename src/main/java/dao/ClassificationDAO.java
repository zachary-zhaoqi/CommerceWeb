package dao;

import entity.Classification;
import jdbc.JdbcOperator;

import java.util.ArrayList;
import java.util.List;

public class ClassificationDAO {

    private JdbcOperator jdbcOperator;

    public ClassificationDAO(){
        jdbcOperator = new JdbcOperator();
    }

    public List getPrimaryClassification() {
        List<Classification> primaryclassification=null;
        String sql="select * from commerce.classification where classificationgrade regexp '^[0-9]+$' ;";

        primaryclassification=jdbcOperator.queryForJavaBeanList(sql, Classification.class);

        return primaryclassification;
    }


    public List<Classification> getsecondaryClassification(String secondaryClassificationgrade) {
        List secondaryClassifications=null;
        String sql="SELECT classificationname FROM commerce.classification where classificationgrade=?;";

        secondaryClassifications=jdbcOperator.queryForJavaBeanList(sql, Classification.class,secondaryClassificationgrade);

        return secondaryClassifications;
    }
}
