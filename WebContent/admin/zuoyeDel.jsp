<%@page import="com.sys.tools.Zuoye"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 防止中文乱码 -->
<%request.setCharacterEncoding("UTF-8");%>
<%
String delID=request.getParameter("delID");
int rs=new Zuoye().delOne(delID);
if(rs==1){
	out.print("<script>alert('删除成功!');location.href='xuewei.jsp';</script>");//页面输出
}
else {//否则
	out.print("<script>alert('删除失败!');location.href='xuewei.jsp';</script>");//页面输出
}
%>