<%@page import="com.sys.tools.xueshengLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 防止中文乱码 -->
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String dept=(String)session.getAttribute("allsessionDept");
String classid=(String)session.getAttribute("allsessionClass");
String stuid = request.getParameter("delStuID");//从页面请求中获取命令
//String stuname = request.getParameter("getStuName");
boolean CunZai= new xueshengLogin().findOne(dept, classid, stuid);
if(CunZai){
	int result=new xueshengLogin().delOne(dept, classid, stuid);
	if(result!=0){
		out.print("<script>alert('删除成功!');location.href='xuewei.jsp';</script>");
	}
	//页面输出
	//return;//结束
}else{
	//int result=new xueshengLogin().insertOne(dept, classid, stuid, stuname);
	//return;//结束
	System.out.println("CunZai："+CunZai);
	out.print("<script>alert('操作失败!');location.href='xuewei.jsp';</script>");//页面输出
}
%>
</body>
</html>