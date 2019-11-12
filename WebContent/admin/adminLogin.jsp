<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sys.tools.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<form action="adminLogin.jsp" method="post" >
	账号：<input type="text" name="User" id="User"  value=""><br>
	密码：<input type="password" name="Pwd"  id="Pwd"  value=""><br>
	<input type="submit" value="提交"/>
</form>

<%request.setCharacterEncoding("UTF-8");%>
用户：<%=request.getParameter("User") %><br>
密码：<%=request.getParameter("Pwd") %><br>


</body>
<%
String sessionUsername= request.getParameter("User");
System.out.println(sessionUsername);
String sessionPassword= request.getParameter("Pwd");
System.out.println(sessionPassword);
%>

<%
//两秒后转跳get.jsp页面
//response.setHeader("refresh","2;URL=admin.jsp");
%>
<%

%>
<%
if(sessionUsername=="" || sessionPassword=="")
{
%><script>
alert("账号或密码不能为空！");
</script><%
}else if(sessionUsername!=null && sessionPassword!=null){
	boolean flat = new adminLogin().login(sessionUsername, sessionPassword);//判断管理员账号密码是否正确
	if (flat){
	    System.out.println("登录成功");
	    session.setAttribute("allsessionPassword", request.getParameter("Pwd"));//将用户输入正确的密码传入全局变量
	    session.setAttribute("allsessionUsername",request.getParameter("User"));//将用户输入正确的账号传入全局变量
	    //转跳管理员功能操作界面
	    %><script>window.location.href="admin.jsp"; </script>
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

<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script>
function LoginCheck() 
{   
    var LoginCheck = false;
    if($("#User").val()==="" || $("#Pwd").val()===""){
		alert("用户名或密码不能为空!");
        return false;
	}
    return true;
}
</script>
</html>