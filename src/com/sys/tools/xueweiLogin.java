package com.sys.tools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class xueweiLogin {

	public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("请输入学院：");
        String dept=sc.nextLine();
        System.out.println("请输入班级：");
        String classid=sc.nextLine();
        System.out.println("请输入密码：");
        String password=sc.nextLine();
        boolean flat = new xueweiLogin().login(dept, classid, password);
        if (flat){
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败");
        }
        int ss=new xueweiLogin().findID(dept, classid);
        System.out.println(ss);
    }
	
	public int findID(String dept, String classid) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn=JDBCUtils.getConnection();
				String sql = "SELECT ID FROM xuewei WHERE dept=? and classid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dept);
				pstmt.setInt(2, Integer.parseInt(classid));
				rs = pstmt.executeQuery();
				while(rs.next()) {
					return rs.getInt("ID");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCUtils.close(rs, pstmt, conn);
			}
		return 0;
	}	
	
	public boolean login(String dept,String classid,String password) {
		
        if (dept == null || classid == null|| password == null) {
            return false;
        }
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try {    	
            conn = JDBCUtils.getConnection();
            String sql="select * from xuewei where dept=? and classid=? and password=? ";
            System.out.println("***********");
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,dept);
            pstmt.setInt(2, Integer.parseInt(classid));
            pstmt.setString(3,password);
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
