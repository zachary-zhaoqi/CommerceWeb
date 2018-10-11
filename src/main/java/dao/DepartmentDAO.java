package dao;

import entity.Department;
import jdbc.JdbcOperator;

import java.util.List;

public class DepartmentDAO {

    private JdbcOperator jdbcOperator;

    public DepartmentDAO(){
        jdbcOperator = new JdbcOperator();
    }

    public List getOneLevel() {
        List oneLevel=null;
        String sql="select * from commerce.department where departmentgrade regexp '^[0-9]+$' ;";

        oneLevel=jdbcOperator.queryForJavaBeanList(sql, Department.class);

        return oneLevel;
    }

    public static void main(String[] args) {
        DepartmentDAO departmentDAO=new DepartmentDAO();
        List list=departmentDAO.getOneLevel();

        System.out.println("aasa");
    }

}
