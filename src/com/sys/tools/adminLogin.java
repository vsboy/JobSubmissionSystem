package com.sys.tools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import com.sys.tools.JDBCUtils;


public class adminLogin {
	public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("请输入用户名：");
        String username=sc.nextLine();
        System.out.println("请输入密码：");
        String password=sc.nextLine();
        boolean flat = new adminLogin().login(username, password);
        if (flat){
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败");
        }
    }
	public boolean login(String username,String password) {

        if (username == null || password == null) {
            return false;
        }
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try {
            conn = JDBCUtils.getConnection();

            String sql="select * from admin where username=? and password=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,username);
            pstmt.setString(2,password);

            rs = pstmt.executeQuery();

            return rs.next();//next（）返回值本身就位布尔型

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(rs,pstmt,conn);
        }
        return true;
    }
}
