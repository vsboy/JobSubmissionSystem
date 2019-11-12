package com.sys.tools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
public class Zuoye {

	public static void main(String[] args) {
	
		//String rsssssString=new Zuoye().getinfo("计算机科学与技术学院", 1707,10, 1);
		//System.out.println(rsssssString);
		String musicLocal="efef.doc";
		String ext = musicLocal.substring(musicLocal.lastIndexOf("."));
		System.out.println(ext);
	}
	
	public int insertOne(String zuoyeName, String zyGuishu) {
		Connection conn = null;
		//PreparedStatement pstmt = null;
		ResultSet rs = null;
		Statement stmt=null;
		try {
			conn=JDBCUtils.getConnection();
			//System.out.println("q------q");
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT into zuoye (zyName,zyGuishu)VALUES('"+zuoyeName+"',"+Integer.valueOf(zyGuishu).intValue()+")");
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
	public int delOne(String delID) {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt=null;
		try {
			conn=JDBCUtils.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE from zuoye WHERE IDzuoye="+delID+"");
			System.out.println(sql);
			stmt = conn.createStatement();
	        int result =stmt.executeUpdate(sql.toString());
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtils.close(rs,stmt, conn);
		return 0;
	}
	public String getinfo(String dept,int classid,int zuoyeID,int s) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer st=new StringBuffer();
		try {
			conn=JDBCUtils.getConnection();
			String sql="SELECT * FROM zuoye,xuewei WHERE xuewei.ID=zuoye.zyGuishu and dept='"+dept+"' and classid="+classid+" and IDzuoye="+zuoyeID+"";
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				String zyName=rs.getString("zyName");
				int idzuoye=rs.getInt("IDzuoye");
				if(s==1) {
					st.append(zyName);
				}else {
					st.append(idzuoye);
				}
			}
			return st.toString();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtils.close(rs,pstmt ,conn);
		}
		return st.toString();
	}
	public String zuoyetable(String dept,int classid,int s) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer st=new StringBuffer();
		try {
			conn=JDBCUtils.getConnection();
			String sql="SELECT * FROM zuoye,xuewei WHERE xuewei.ID=zuoye.zyGuishu and dept='"+dept+"' and classid="+classid+"";
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				String zyName=rs.getString("zyName");
				int idzuoye=rs.getInt("IDzuoye");
				if(s==1) {
					st.append("<tr id=\""+idzuoye+"\"><td>"+idzuoye+"</td><td>"+zyName+"</td><td>下载作业</td><td id=\""+idzuoye+"\" class=\"delzuo\"><button>删除并结束提交本作业</button></td></tr>");
				}else {
					st.append("<tr id=\""+idzuoye+"\"><td>"+idzuoye+"</td><td>"+zyName+"</td><td>下载作业</td><td id=\""+idzuoye+"\" class=\"potzuo\"><button>提交本作业</button></td></tr>");
				}
			
			}
			return st.toString();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtils.close(rs,pstmt ,conn);
		}
		return st.toString();
	}
}
