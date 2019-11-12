<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
if(session.getAttribute("allsessionUsername")==null)
{
	%><script>
	alert("请重新登陆！");
	</script><%
	response.setHeader("refresh","0;URL=adminLogin.jsp");
}
%>
<body>
<!-- 防止中文乱码 -->
<%request.setCharacterEncoding("UTF-8");%>
用户：<%=(String)session.getAttribute("allsessionUsername")%><br>
密码：<%=(String)session.getAttribute("allsessionPassword")%><br>
</body>
</html>
