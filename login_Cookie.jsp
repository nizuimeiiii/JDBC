<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生登录页面</title>
    
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
   <%!String reName; %>
  <%!String rePwd; %>
  
  <%
  	Cookie[] cks=request.getCookies();
  	if(cks!=null){
  		//如果已经设置了cookie，则得到它的值
  		for(int i=0;i<cks.length;i++)
  		{
  			if(cks[i].getName().equals("username"));
  				reName=cks[i].getValue();
  			if(cks[i].getName().equals("password"));
  				rePwd=cks[i].getValue();
  		}
  	}
  	
   %>
  
     <form action="JDBC/loginOK.jsp" method="post">
     	输入用户名：<input type="text" name="cardId" value=<%=(reName!=null?"":"") %>/><br/>
     	输入密码：<input type="password" name="password" value=<%=(rePwd!=null?"":"")%> /><br/>
     	<input type="checkbox" name="check1"/> 是否记住用户名和密码 
     	<input type="submit" value="登录"/>
     	<input type="reset" value="重置"/>
    </form>
  </body>
</html>
