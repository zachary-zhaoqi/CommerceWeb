package dao;

import dao.mall.ClassificationDAO;
import org.junit.Test;

import java.util.List;

public class ClassificationDAOTest {

    @Test
    public void main() {
        ClassificationDAO classificationDAO =new ClassificationDAO();
        List list= classificationDAO.getPrimaryClassification();

        System.out.println("aasa");
    }

    @Test
    public void sc(){
        ClassificationDAO classificationDAO =new ClassificationDAO();
        List list= classificationDAO.getsecondaryClassification("h");

        System.out.println("aasa");

    }
}