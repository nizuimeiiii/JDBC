<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DeleteInfo.jsp' starting page</title>
    
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
    	//获取用户点击删除对应列的stuId
    	int delId=Integer.parseInt(request.getParameter("stuId"));
  		request.setCharacterEncoding("UTF-8");
  		response.setCharacterEncoding("UTF-8");
  		Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/student";      
        Connection con=DriverManager.getConnection(url,"root","root");
        Statement st=con.createStatement();
		String sql="delete from stuinfo where stuId='" +delId+ "'";    
		int i=st.executeUpdate(sql);
    	if(i>0) 
    	{
    		out.print("成功删除" +i+ "行");
    		response.sendRedirect("showInfo.jsp");
    	}else{
    		out.print("删除失败");
    	}
    		
     %>
  </body>
</html>
