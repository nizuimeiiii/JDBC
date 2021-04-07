<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8" %>
<%--注意：引用java.sql.*包 --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>模糊查询页面</title>   
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
    	String uname=request.getParameter("userName");     
      	Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/student";      
        Connection con=DriverManager.getConnection(url,"root","root");
        //Statement st=con.createStatement();
        //String sql="select * from stuInfo where stuName like '"+uname+"'";
        //ResultSet rs=st.executeQuery(sql);//结果集    
        String sql="select * from stuInfo where stuName like ?";
        PreparedStatement pst=con.prepareStatement(sql);   	
        pst.setString(1,"%"+uname+"%");
        ResultSet rs=pst.executeQuery();
	    if(rs.next())
	    {
     %>
	      <table border="1">
	      	<tr>
	         <th>学号</th>
	         <th>姓名</th>
	         <th>密码</th>
	         <th>性别</th>
	      	</tr>
	      <% 
	      	int i=0;
	      	do{
		        int sid=rs.getInt("stuId");
		        String sname=rs.getString(2);
		        String spwd=rs.getString("stuPwd");
		        String ssex=rs.getString("stuSex");
		        i++;
	      %>
	       <tr>
	          <td><%=sid %></td>
	          <td><%=sname %></td>
	          <td><%=spwd %></td>
	          <td><%=ssex%></td>
	       </tr>	      
	     <% 
	        }while(rs.next());	  
	     %>
	     <%--注意table放置的位置，不要放在while里面 --%>
	     </table>
	     <%      
	        out.println("<br>"+"成功查询到"+i+" 条信息");
	      }
	      else
	      	out.println("查无此人");         
	     %>
      <br/><br/>
      <a href="JDBC/searchForm.jsp">点击返回查询页面</a>
  </body>
</html>