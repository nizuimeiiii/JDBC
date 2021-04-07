<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加信息</title>
    
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
    <form method="post">
     	输入姓名：<input type="text" name="stuName"/><br/>
     	输入密码：<input type="password" name="stuPwd"/><br/>
     	选择性别：    	
     	<input type="radio" name="stuSex" value="男">男
     	<input type="radio" name="stuSex" value="女">女 <br/>  	
      	<input type="submit" value="添加"/><br/>
    </form>
    <%
    	request.setCharacterEncoding("UTF-8");
      	Class.forName("com.mysql.jdbc.Driver");
    	//2.通过DriverManager获取数据库连接
        String url="jdbc:mysql://localhost:3306/student";      
        Connection con=DriverManager.getConnection(url,"root","root");
        //3.使用PreparedStatenment执行sql语句       
    	String stuName=request.getParameter("stuName");
    	String stuPwd=request.getParameter("stuPwd");
     	String stuSex=request.getParameter("stuSex");
        if(stuName!=null &&  stuPwd!=null &&  stuSex!=null)
        {
        	 String sql="INSERT INTO stuinfo(stuName,stuPwd,stuSex)values(?,?,?)"; 
	        //（1）创建执行SQL语句的PreparedStatement对象
	        PreparedStatement st=con.prepareStatement(sql);
	        st.setString(1,stuName);
	        st.setString(2,stuPwd);
	        st.setString(3,stuSex);
	        //st.executeUpdate();
	        int i=st.executeUpdate();
	        out.print("成功添加" + i + "行");
	  %>
	        <a href="JDBC/showInfo.jsp">返回原页面</a>
	  <%
        }  
        con.close();
        
     %>
     
  </body>
</html>
