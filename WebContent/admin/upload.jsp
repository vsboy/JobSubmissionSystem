<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="com.sys.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传</title>
<%
String Dept=(String)session.getAttribute("allsessionDept");
String Class=(String)session.getAttribute("allsessionClass");
String Stuid=(String)session.getAttribute("allsessionStuid");
String Stuname=new xueshengLogin().findName(Dept, Class,Stuid);
String zyID=request.getParameter("potID");
String zyName=new Zuoye().getinfo(Dept, Integer.valueOf(Class).intValue(), Integer.valueOf(zyID).intValue(),1);
%>
</head>
<body>
<form method="post" action="/classsys/TomcatTest/UploadServlet" enctype="multipart/form-data">
<br/><br/>
    选择一个文件:
    <input type="file" name="uploadFile" />
    <br/><br/>
    
    <h4 name="Class">核对信息是否正确，错误请联系管理员</h4>
          学院：<input type="text" name="Dept" readonly="readonly" unselectable="on" value="<%=Dept%>"><br/>
          班级：<input type="text" name="Class" readonly="readonly" unselectable="on" value="<%=Class%>"><br/>
          学号：<input type="text" name="Stuid" readonly="readonly" unselectable="on" value="<%=Stuid%>"><br/>
          姓名：<input type="text" name="Stuname" readonly="readonly" unselectable="on" value="<%=Stuname%>"><br/>  
          作业编号：<input type="text" name="potID" readonly="readonly" unselectable="on" value="<%=request.getParameter("potID")%>"><br/>   
          作业名称：<input type="text" name="zyName" readonly="readonly" unselectable="on" value="<%=zyName%>"><br/>         
    <br/>
    <input type="submit" value="上传文件" />
</form>

</body>
</html>
