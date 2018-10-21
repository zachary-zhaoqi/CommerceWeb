package dao;

import dao.mall.ClassificationDAO;
import org.junit.Test;

import java.util.List;

public class ClassificationDAOTest {

    @Test
    public void main() {
        ClassificationDAO classificationDAO =new ClassificationDAO();
        try {
            List list= classificationDAO.getPrimaryClassification();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("aasa");
    }

    @Test
    public void sc(){
        ClassificationDAO classificationDAO =new ClassificationDAO();
        try {
            List list= classificationDAO.getsecondaryClassification("h");
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("aasa");

    }
}