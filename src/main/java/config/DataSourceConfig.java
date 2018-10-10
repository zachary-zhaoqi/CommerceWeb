package config;


import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 数据库链接信息配置类及数据库链接池
 * @author 赵奇
 * */
public class DataSourceConfig {
    /**
     * 配置文件的路径
     * */
    private static final String DATASOURCE_CONFIG_FILE = "C:/Users/starr/workspace/CommerceWeb/src/main/resources/config/dataSource.properties";
    /**
     * 数据库帐号
     */
	public static String user;
    /**
     * 数据库密码
     */
    public static String password;
    /**
     * 数据库SID
     */
	public static String sid;
    /**
     * 数据库IP地址
     */
    public static String ip;
    /**
     * 数据库端口
     */
    public static String port;
    /**
     * 数据库名称
     * */
    private static String dataSourceName;

    /**
     * 数据源
     */
    private static DataSource dataSource;


    /**
     * 获取数据源，即连接池对象
     * @return Java.sql.DataSource
     */
    public static synchronized DataSource getDataSource(){
        if(dataSource == null){
            initialization();
        }
        return dataSource;
    }

    /**
     * 初始化数据库连接池
     */
    public static void initialization(){
        //1、先判断dataSource是否==null，是，先关闭
        //2、c3p0连接池创建并返回DataSource
        if (dataSource != null) {
            //关闭dataSource
            ((ComboPooledDataSource) dataSource).close();
        }
        dataSource=new ComboPooledDataSource();
        try {
            //配置连接池属性
            readDataSourceConfig();//刷新数据
            ((ComboPooledDataSource) dataSource).setDriverClass("com.mysql.cj.jdbc.Driver");
            ((ComboPooledDataSource) dataSource).setJdbcUrl("jdbc:"+sid+"://"+ip+":"+port+"/"+dataSourceName+"?characterEncoding=utf-8&serverTimezone=GMT&useSSL=false");
            ((ComboPooledDataSource) dataSource).setUser(user);
            ((ComboPooledDataSource) dataSource).setPassword(password);
            ((ComboPooledDataSource) dataSource).setLoginTimeout(3000);
            ((ComboPooledDataSource) dataSource).setMaxPoolSize(25);
        } catch (PropertyVetoException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
    }

    public static void closeDataSource() {
        if (dataSource != null) {
            //关闭dataSource
            ((ComboPooledDataSource) dataSource).close();
            dataSource=null;
        }
    }

    /**
     * 读取数据库连接信息配置文件，把信息存放在DataSourceConfig中
     */
    public static void readDataSourceConfig(){
        //TODO:
        try {
            FileInputStream fileInputStream=new FileInputStream(DATASOURCE_CONFIG_FILE);
            Properties properties=new Properties();
            properties.load(fileInputStream);
            DataSourceConfig.user=properties.getProperty("user");
            DataSourceConfig.password=properties.getProperty("password");
            DataSourceConfig.sid=properties.getProperty("sid");
            DataSourceConfig.ip=properties.getProperty("ip");
            DataSourceConfig.port=properties.getProperty("port");
            DataSourceConfig.dataSourceName=properties.getProperty("dataSourceName");
        }
        catch (FileNotFoundException fileNotFoundException) {
            // TODO Auto-generated catch block
            fileNotFoundException.printStackTrace();
        }
        catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 从DataSourceConfig中读取配置信息保存到配置文件中
     */
    public static void saveDataSourceConfig(){
        //TODO:
        try {
            FileOutputStream fileOutputStream=new FileOutputStream(DATASOURCE_CONFIG_FILE);
            Properties properties=new Properties();
            properties.setProperty("user", DataSourceConfig.user);
            properties.setProperty("password", DataSourceConfig.password);
            properties.setProperty("sid", DataSourceConfig.sid);
            properties.setProperty("ip", DataSourceConfig.ip);
            properties.setProperty("port", DataSourceConfig.port);
            properties.setProperty("dataSourceName", DataSourceConfig.dataSourceName);
            properties.store(fileOutputStream, DATASOURCE_CONFIG_FILE);
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DataSource dataSource = DataSourceConfig.getDataSource();
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet;
        try {
            connection = dataSource.getConnection();
            System.out.println(connection);

            String sql="SELECT * FROM commerce.user;";
            preparedStatement=connection.prepareStatement(sql);
            resultSet=preparedStatement.executeQuery();

            while (resultSet.next())
            {
                String string=resultSet.getString(1);
                System.out.println(string);
            }

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
            closeDataSource();
        }

    }

}
