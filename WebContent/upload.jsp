<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传实例 - 菜鸟教程</title>
</head>
<body>
<h1>教程</h1>
<form method="post" action="/classsys/TomcatTest/UploadServlet" enctype="multipart/form-data">
    选择一个文件:
    <input type="file" name="uploadFile" />
    <br/><br/>
    <input type="text" name="test" />
    <input type="submit" value="上传" />
</form>
学院：<%=(String)session.getAttribute("allsessionDept")%><br>
班级：<%=(String)session.getAttribute("allsessionClass")%><br>
学号：<%=(String)session.getAttribute("allsessionStuid")%><br>
</body>
</html>
