package com.sys.tools;

import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.Properties;

public class JDBCUtils {
    private static String user;
    private static String password;
    private static String url;
    private static String drive;

    static {
        //读取资源文件
        try {
            //1.创建Propeties集合类
            Properties pro=new Properties();
            //获取src路径下文件的方式--->ClassLoader
            ClassLoader classLoader=JDBCUtils.class.getClassLoader();
            URL res=classLoader.getResource("jdbc.properties");
            String path = res.getPath();
            System.out.println("配置文件路径："+path);
            //2.加载文件
            //pro.load(new FileReader("D:\\eclipse-workspace\\jdbc\\day0_jdbc\\src\\jdbc.properties"));
            pro.load(new FileReader(path));
            //3.获取数据，赋值
            url=pro.getProperty("url");
            user=pro.getProperty("user");
            password=pro.getProperty("password");
            drive=pro.getProperty("driver");
            System.out.println("驱动获取成功");
            //4.注册驱动
            try {
                Class.forName(drive);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
/*
* 文件的读取，只需要读取一次即可拿到这些值
* */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url,user,password);
    }

    //施放资源
    public static void close(Statement stmt,Connection conn){
        try {
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(ResultSet rs, Statement stmt, Connection conn){
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
