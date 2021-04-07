<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新操作页面</title>
    
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
  		request.setCharacterEncoding("UTF-8");
  		response.setCharacterEncoding("UTF-8");
  		Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/student";      
        Connection con=DriverManager.getConnection(url,"root","root");
		String sql2="update stuinfo set stuName=?,stuPwd=?,stuSex=? where stuId=?";     
    	PreparedStatement pst=con.prepareStatement(sql2);   	
    	pst.setString(1,request.getParameter("sName"));
    	pst.setString(2,request.getParameter("sPwd"));
    	pst.setString(3,request.getParameter("Sex"));
    	pst.setString(4,request.getParameter("sId"));
    	int j=pst.executeUpdate();
    	if(j>0) 
    		out.print("更新成功");
     %>
     <br><br/>
     <a href="JDBC/showInfo.jsp">点击返回原页面</a>
  </body>
</html>
