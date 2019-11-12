<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="js/jquery.min.js"></script>
<%@ page import="com.sys.tools.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{border-collapse:collapse}
</style>
<%
String st="";
String zt="";
if(session.getAttribute("allsessionDept")==null || session.getAttribute("allsessionPasswordXW")==null)
{
	%><script>
	alert("请重新登陆！");
	</script><%
	response.setHeader("refresh","0;URL=xueweiLogin.jsp");
}else{
	st=new xueshengLogin().stutable((String)session.getAttribute("allsessionDept"), (String)session.getAttribute("allsessionClass"));
	zt=new Zuoye().zuoyetable((String)session.getAttribute("allsessionDept"),Integer.valueOf((String)session.getAttribute("allsessionClass")).intValue(),1);
}
%>
<h2>学院：<%=(String)session.getAttribute("allsessionDept")%></h2>
<h2>班级：<%=(String)session.getAttribute("allsessionClass")%></h2><br>

		<form action="zuoyeAdd.jsp" method="post" >
			<span>输入要添加的作业名称：</span><input type="text" name="getZuoyeName"/>
			<button type="submit">添加作业</button><br>
		</form>

		<table id="zuoyetb" border="1" bgcolor="#FAFAD2" >
			<tr>
				<th>作业编号</th>
				<th>作业名称</th>
				<th>下载</th>
				<th>删除</th>
			</tr>
			<%=zt %>
		</table>
		<table id="t1" border="1">
			<tr>
				<th>学号</th>
				<th>姓名</th>
			</tr>
			<%=st %>
		</table>
		<form action="xueshengAdd.jsp" method="post" >
			<span>输入要添加的学号：</span><input type="text" id="getStuID" name="getStuID"/>
			<span>输入要添加的姓名：</span><input type="text" id="getStuName" name="getStuName"/>
			<button id="add" type="submit">添加学生</button><br>
		</form>
		<form action="xueshengDel.jsp" method="post" >
			<span>输入要删除的学号：</span><input type="text" id="delStuID" name="delStuID"/>
			<button id="del" type="submit">删除学生</button>
		</form>
<body>


</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".delzuo").click(function(){
			var r=confirm("是否删除，本操作不可找回！");
			if(r==true){
			var delID=$(this).attr("id");
			window.location.href="zuoyeDel.jsp?delID="+delID;
		}else{
			//alert("删除取消");
		}
			//alert($(this).attr("id"));
		});
		
		$("#add").click(function(){
			var stuid=$("#getStuID").val();
		    var stuname=$("#getStuName").val();
			$("#t1").append('<tr id="'+stuid+'"><td>'+stuid+'</td><td>'+stuname+'</td></tr>');
		});
		
		$("#del").click(function(){
			var stuid=$("#delStuID").val();
			$("#"+stuid).remove();
		});
	});
</script>