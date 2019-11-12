package com.sys.tools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.sys.model.XueShengMod;

//import cn.itcat.jdbc.jdbc8UsUtils;

public class xueshengLogin {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.println("请输入学院：");
		String dept = sc.nextLine();
		System.out.println("请输入班级：");
		String classid = sc.nextLine();
		System.out.println("请输入学号：");
		String stuid=sc.nextLine();
		//System.out.println("请输入姓名：");
		//String stuname=sc.nextLine();
		// System.out.println("请输入密码：");
		// String password=sc.nextLine();
//		boolean flat = new xueshengLogin().findOne(dept, classid,stuid);
//		if (flat){
//		System.out.println("登录成功");
//		}else {
//		System.out.println("登录失败");
//		}
		String test=new xueshengLogin().findName(dept, classid, stuid);
		System.out.println(test);
		//String st =new xueshengLogin().stutable(dept, classid);
		//System.out.println("11111111");
	}

	public String stutable(String dept, String classid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer st = new StringBuffer(); 
		try {
			conn=JDBCUtils.getConnection();
			String sql = "SELECT * FROM xuesheng WHERE dept=? and classid=? order by stuid";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept);
			pstmt.setInt(2, Integer.parseInt(classid));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int stuid = rs.getInt("stuid");
				String stuname = rs.getString("stuname");
				st.append("<tr id=\""+stuid+"\"><td>"+stuid+"</td><td>"+stuname+"</td></tr>");
			}
			return st.toString();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtils.close(rs, pstmt, conn);
		}
		return st.toString();
	}
	
	public boolean findOne(String dept, String classid, String stuid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=JDBCUtils.getConnection();
			String sql = "SELECT * FROM xuesheng WHERE dept=? and classid=? and stuid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept);
			pstmt.setInt(2, Integer.parseInt(classid));
			pstmt.setString(3, stuid);
			rs = pstmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtils.close(rs, pstmt, conn);
		}
		return false;
	}
	public int delOne(String dept, String classid, String stuid) {
		Connection conn = null;
		//PreparedStatement pstmt = null;
		ResultSet rs = null;
		Statement stmt=null;
		try {
			conn=JDBCUtils.getConnection();
			//System.out.println("q------q");
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE from xuesheng WHERE dept='"+dept+"' and classid="+classid+" and stuid="+stuid+"");
			System.out.println(sql);
			stmt = conn.createStatement();

	        int result =stmt.executeUpdate(sql.toString());
			//System.out.println(result);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtils.close(rs,stmt, conn);
		return 0;
	}
	public int insertOne(String dept, String classid, String stuid,String stuname) {
		//
		Connection conn = null;
		//PreparedStatement pstmt = null;
		ResultSet rs = null;
		Statement stmt=null;
		try {
			conn=JDBCUtils.getConnection();
			//System.out.println("q------q");
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT into xuesheng (dept,classid,`PASSWORD`,stuid,stuname)VALUES('"+dept+"',"+classid+",'123456',"+stuid+","+"'"+stuname+"')");
			System.out.println(sql);
			stmt = conn.createStatement();

	        int result =stmt.executeUpdate(sql.toString());
			//System.out.println(result);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtils.close(rs,stmt, conn);
		return 0;
	}
	
	public int findID(String dept, String classid, String stuid) {
		if(findOne(dept, classid, stuid)) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn=JDBCUtils.getConnection();
				String sql = "SELECT ID FROM xuesheng WHERE dept=? and classid=? and stuid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dept);
				pstmt.setInt(2, Integer.parseInt(classid));
				pstmt.setString(3, stuid);
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
		}
		return 0;
	}	
	
	public String findName(String dept, String classid, String stuid) {
		if(true) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn=JDBCUtils.getConnection();
				String sql = "SELECT stuname FROM xuesheng WHERE dept=? and classid=? and stuid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dept);
				pstmt.setInt(2, Integer.parseInt(classid));
				pstmt.setString(3, stuid);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					return rs.getString("stuname");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCUtils.close(rs, pstmt, conn);
			}
		}
		return "kong1";
	}
	public List<XueShengMod> findALL(String dept, String classid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<XueShengMod> list = null;
		try {
			conn = JDBCUtils.getConnection();
			String sql = "SELECT * FROM xuesheng WHERE dept=? and classid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept);
			pstmt.setInt(2, Integer.parseInt(classid));
			rs = pstmt.executeQuery();
			list = new ArrayList<XueShengMod>();
			while (rs.next()) {
				int stuid = rs.getInt("stuid");
				String stuname = rs.getString("stuname");
				XueShengMod xueshengmod = new XueShengMod();
				xueshengmod.setStuid(stuid);
				xueshengmod.setStuname(stuname);
				list.add(xueshengmod);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtils.close(rs, pstmt, conn);
		}

		return list;
	}

	public boolean login(String dept, String classid, String password, String stuid) {

		if (dept == null || classid == null || password == null || stuid == null) {
			return false;
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();
			String sql = "select * from xuesheng WHERE dept=? and classid=? and `password`=? and stuid=?";
			System.out.println("***********");
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dept);
			pstmt.setInt(2, Integer.parseInt(classid));
			pstmt.setString(3, password);
			pstmt.setString(4, stuid);
			rs = pstmt.executeQuery();
			return rs.next();// next（）返回值本身就位布尔型
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.close(rs, pstmt, conn);
		}
		return true;
	}
}
