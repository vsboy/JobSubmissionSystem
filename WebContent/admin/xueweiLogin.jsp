<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sys.tools.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 防止中文乱码 -->
<%request.setCharacterEncoding("UTF-8");%>
<body>

<form action="xueweiLogin.jsp" method="post" >
	学院：
	<select name="Dept">
	<option value="传媒学院">传媒学院</option>
	<option value="城市与环境学院">城市与环境学院</option>
	<option value="计算机科学与技术学院">计算机科学与技术学院</option>
	</select><br>
	班级：<input type="text" name="Classid" id="Classid"  value=""><br>
	密码：<input type="password" name="Pwd"  id="Pwd"  value=""><br>
	<input type="submit" value="提交"/>
</form>


</body>
<%
String sessionDept= request.getParameter("Dept");
System.out.println(sessionDept);
String sessionClass= request.getParameter("Classid");
System.out.println(sessionClass);
String sessionPassword= request.getParameter("Pwd");
System.out.println(sessionPassword);
%>

<%
if(sessionDept=="" || sessionClass==""|| sessionPassword=="")
{
%><script>
alert("输入不能为空！");
</script><%
}else if(sessionDept!=null && sessionClass!=null && sessionPassword!=null){
	boolean flat = new xueweiLogin().login(sessionDept,sessionClass,sessionPassword);//判断管理员账号密码是否正确
	if (flat){
	    System.out.println("登录成功");
	    session.setAttribute("allsessionDept", request.getParameter("Dept"));
	    session.setAttribute("allsessionClass",sessionClass);
	    session.setAttribute("allsessionPasswordXW",sessionPassword);
	    //转跳管理员功能操作界面
	    %><script>window.location.href="xuewei.jsp"; </script>
	    <%
	}else {
	    System.out.println("登录失败");
	    %><script>
	    alert("账号或密码错误，登录失败！");
	    </script><%
		return;
	}
}
%>

</html>