<%@page import="com.sys.tools.xueshengLogin"%>
<%@ page import="com.sys.tools.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="js/jquery.min.js"></script>
    <!-- 防止中文乱码 -->
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
if(session.getAttribute("allsessionDept")==null || session.getAttribute("allsessionClass")==null || session.getAttribute("allsessionStuid")==null)
{
	%><script>
	alert("请重新登陆！");
	</script><%
	response.setHeader("refresh","0;URL=xueshengLogin.jsp");
}
%>
<body>
<%
String Dept=(String)session.getAttribute("allsessionDept");
String Class=(String)session.getAttribute("allsessionClass");
String Stuid=(String)session.getAttribute("allsessionStuid");
String Stuname=new xueshengLogin().findName(Dept, Class,Stuid);
String zt=new Zuoye().zuoyetable((String)session.getAttribute("allsessionDept"),Integer.valueOf((String)session.getAttribute("allsessionClass")).intValue(),0);

%>
学院：<%=(String)session.getAttribute("allsessionDept")%><br>
班级：<%=(String)session.getAttribute("allsessionClass")%><br>
学号：<%=(String)session.getAttribute("allsessionStuid")%><br>
姓名：<%=Stuname %><br>

<a href="http://localhost:8080/classsys/admin/upload.jsp?Dept=<%=Dept%>&Class=<%=Class%>&Stuid=<%=Stuid%>&Stuname=<%=Stuname%>">
    <button>上传文件</button>
</a>
		<table id="zuoyetb" border="1" bgcolor="#FAFAD2" >
			<tr>
				<th>作业编号</th>
				<th>作业名称</th>
				<th>下载</th>
				<th>提交</th>
			</tr>
			<%=zt %>
		</table>
</body>

</html>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".potzuo").click(function(){
			//window.location.href="zuoyeDel.jsp?delID="+delID;
			var potID=$(this).attr("id");
			window.location.href="http://localhost:8080/classsys/admin/upload.jsp?potID="+potID+"";
		});

	});
</script>