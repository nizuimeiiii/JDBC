<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生登录验证页面</title>
    
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
    	//int sId=Integer.parseInt(request.getParameter("stuId")); //获取登录学号
    	String sId=request.getParameter("cardId");
    	String sPwd=request.getParameter("password");     //获取登录密码
    	String flag=request.getParameter("check1");
    	
      	Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/student";      
        Connection con=DriverManager.getConnection(url,"root","root");
        Statement st=con.createStatement();
        String sql="select * from stuInfo where stuId='"+sId+"'";
        ResultSet rs=st.executeQuery(sql);//结果集    
	    if(rs.next())
	    {	
	    	String sid=rs.getString("cardId");		    
		    String spwd=rs.getString("stuPwd");  
		    if(sId == sid && sPwd.equals(spwd))
		    {
		    	out.println("登录成功！");
		    }     
		    if(flag!=null){
		    	Cookie nameCookie=new Cookie("username",sId);
		    	//设置Cookie的有效期为3天
		    	nameCookie.setMaxAge(60*60*24*3);
		    	Cookie pwdCookie=new Cookie("password",sPwd);
		    	pwdCookie.setMaxAge(60*60*24*3);
		    	response.addCookie(nameCookie);
		    	response.addCookie(pwdCookie);
		    }
	        
	    }else
	    {
	      	out.println("登录失败！");  
	   %>     
		  	<br/><br/>
      		<a href="JDBC/loginForm.jsp">点击返回登录页面</a>
	  <% 
		  }	     
	  %>
	     
  </body>
</html>
