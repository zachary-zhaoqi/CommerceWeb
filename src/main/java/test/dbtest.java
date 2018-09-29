package test;


import com.mysql.cj.protocol.Resultset;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class dbtest {
    public static void main(String[] args){
        String user="";
        String password="";


        try {
            FileInputStream fileInputStream=new FileInputStream("src/main/resources/config/datasource.properties");
            Properties properties=new Properties();
            properties.load(fileInputStream);
            user=properties.getProperty("user");
            password=properties.getProperty("password");
        } catch (IOException e) {
            e.printStackTrace();
        }


        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/commerce?characterEncoding=utf-8&serverTimezone=GMT&useSSL=false",
                    user,password);

            String sql="SELECT * FROM commerce.user;";
            preparedStatement=connection.prepareStatement(sql);
            resultSet=preparedStatement.executeQuery();
            while (resultSet.next())
             {
                String string=resultSet.getString(1);
                System.out.println(string);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
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

    }
}
