<%@page import="com.sys.tools.Zuoye"%>
<%@page import="com.sys.tools.xueweiLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 防止中文乱码 -->
<%request.setCharacterEncoding("UTF-8");%>
<%String dept=(String)session.getAttribute("allsessionDept");%>
<%String classid=(String)session.getAttribute("allsessionClass");%>
<%
String zuoyeName=request.getParameter("getZuoyeName");
String zyGuishu=new xueweiLogin().findID(dept, classid)+"";
int rs=new Zuoye().insertOne(zuoyeName, zyGuishu);
if (rs==1)//判断返回值
{
	out.print("<script>alert('添加成功!');location.href='xuewei.jsp';</script>");//页面输出

}
else //或者
{
	out.print("<script>alert('添加失败!');location.href='xuewei.jsp';</script>");//页面输出

}
%>
