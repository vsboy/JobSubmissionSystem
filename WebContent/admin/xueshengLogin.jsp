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

<form action="xueshengLogin.jsp" method="post" >
	学院：
	<select name="Dept" class="selector">
	<option value="传媒学院">传媒学院</option>
	<option value="城市与环境学院">城市与环境学院</option>
	<option value="计算机科学与技术学院">计算机科学与技术学院</option>
	</select><br>
	班级：<input type="text" name="Classid" id="Classid"  value=""><br>
	学号：<input type="text" name="Stuid" id="Stuid"  value=""><br>
	密码：<input type="password" name="Pwd"  id="Pwd"  value=""><br>
	<input type="submit" value="提交"/>
</form>

班级：<%=request.getParameter("Classid")%>
<%
session.setAttribute("allsessionClass",request.getParameter("Classid"));
%>
班级：<%=(String)session.getAttribute("allsessionClass")%>
</body>
<%
String sessionDept= request.getParameter("Dept");
//System.out.println(sessionDept);
String sessionClass= request.getParameter("Classid");
//System.out.println("1:"+sessionClass);
String sessionStuid= request.getParameter("Stuid");
//System.out.println(sessionStuid);
String sessionPassword= request.getParameter("Pwd");
//System.out.println(sessionPassword);
%>

<%
if(sessionDept=="" || sessionClass==""|| sessionPassword=="" || sessionStuid=="")
{
	System.out.println("2:"+sessionClass);
%><script>
alert("输入不能为空！");
</script><%
}else if(sessionDept!=null && sessionClass!=null && sessionPassword!=null&& sessionStuid!=null){
	boolean flat = new xueshengLogin().login(sessionDept,sessionClass,sessionPassword,sessionStuid);//判断管理员账号密码是否正确
	if (flat){
	    System.out.println("登录成功");
	    session.setAttribute("allsessionDept", request.getParameter("Dept"));
	    session.setAttribute("allsessionClass",request.getParameter("Classid"));
	    session.setAttribute("allsessionPassword",request.getParameter("Pwd"));
	    session.setAttribute("allsessionStuid",request.getParameter("Stuid"));
	    //转跳管理员功能操作界面
	    %><script>window.location.href="xuesheng.jsp"; </script>
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
<script src="js/jquery.min.js"></script>
<script src="js/amazeui.min.js"></script>
<script>
$(document).ready(function(){
$("#Classid").val("<%=request.getParameter("Classid")%>");
$(".selector").val("<%=request.getParameter("Dept")%>");
  $("p").click(function(){
    $(this).hide();
  });
});
</script>
</html>