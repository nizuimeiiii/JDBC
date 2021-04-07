<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新信息页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%
  		//request.getParameter("stuId")为空时会报错
  		//int id=Integer.parseInt(request.getParameter("stuId"));
  		 response.setCharacterEncoding("UTF-8");
       String sid=request.getParameter("stuId"); 
       String sname1=request.getParameter("stuName"); 
       String sname=new String(sname1.getBytes("ISO-8859-1"),"utf-8");
       String spwd=request.getParameter("stuPwd"); 
       String ssex1=request.getParameter("stuSex"); 
       String ssex=new String(ssex1.getBytes("ISO-8859-1"),"utf-8");
       //out.print(ssex);
  		
  		      
  	 %>
    <form action="JDBC/UpdateDo.jsp" method="post"><!-- 最好提交到控制器处理 -->
    	<input type="hidden" name="sId" value=<%=sid%>><!-- 为了后面更新获取id --> 
     	
     	<!-- ==比较的是内存的地址，equal比较的才是内容-->
     	学号：<input type="text" value=<%=sid %> name="sId" readonly /><br/>
     	姓名：<input type="text" name="sName" value="<%=sname%> "/><br/>
     	密码：<input type="password" name="sPwd" value="<%=spwd%>"/><br/>
     	选择性别：    	
   		 <input type="radio" name="Sex" value="男" <%=ssex.equals("男")?"checked":"" %> value="男" >男
     	<input type="radio" name="Sex" value="女" <%=ssex.equals("女")?"checked":"" %> value="女" >女 <br/>  	
      	<input type="submit" value="更新"/><br/>
    </form>
  	 
  </body>
</html>
